package com.here.ivi.api;

import com.here.ivi.api.OptionReader;
import com.here.ivi.api.OptionReaderException;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.output.ConsoleOutput;
import com.here.ivi.api.output.FileOutput;
import com.here.ivi.api.validator.common.BasicValidator;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URI;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Transpiler {

    static List<String> GENERATORS = Arrays.asList("legacy", "stub");
    static Logger logger = Logger.getLogger(BasicValidator.class.getName());

    public static void main(final String[] args) {

        OptionReader or = new OptionReader( );
        try {
            OptionReader.TranspilerOptions options = or.read(args);
            new Transpiler(options).execute();
        } catch (OptionReaderException e) {
            System.err.println("Failed reading options: " + e.getMessage() + "\n");
            or.printUsage();
            System.exit(1);
        }
    }

    public Transpiler(OptionReader.TranspilerOptions options) {
        this.options = options;
    }

    public void execute() {

        //Generation
        List<String> generators = options.getGenerators();

        for ( String sn : generators ) {
            System.out.println("Using generator " + sn);

            try {

                GeneratorSuite<?, ?> generator = GeneratorSuite.instantiateByShortName(sn, this);

                generator.buildModel(options.getInputDir());
                System.out.println("Instantiated generator " + generator.getName() + " " + generator.getVersion());
                boolean valid = generator.validate();
                logger.log(Level.INFO, valid ? "Validation Succeeded" : "Validation Failed");

                if (options.validateOnly()){
                    return;
                }
                List<GeneratedFile> outputFiles = generator.generate();
                output(outputFiles);
            } catch (IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
                System.err.println("Failed instantiation of generator '" + sn + "'");
            }

            System.out.println("");
        }
    }

    public void output(List<GeneratedFile> files) {
        // handle output options
        if (options.dumpToStdout()) {
            try {
                ConsoleOutput co = new ConsoleOutput();
                co.output(files);
            } catch (IOException e) {
            }
        }

        String outdir = options.getOutputDir();
        if (outdir != null) {
            try {
                FileOutput fo = new FileOutput(new File(outdir));
                fo.output(files);
            } catch (IOException e) {
            }
        }
    }

    public Version getVersion() {
        return new Version(0,0,1);
    }
    public String getName() {
        return "com.here.Transpiler";
    }

    public String resolveRelativeToRootPath(String other) throws IOException {
        File rootFile = new File(options.getInputDir());
        if (rootFile.isFile()) {
            rootFile = rootFile.getParentFile();
        }
        final URI parentURI = URI.create(rootFile.getCanonicalPath());
        final URI childURI = URI.create(other);
        return parentURI.relativize(childURI).toString();
    }

    private final OptionReader.TranspilerOptions options;
}
