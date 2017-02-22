package com.here.ivi.api;

import com.here.ivi.api.OptionReaderException;

import com.here.ivi.api.generator.legacy.LegacyGeneratorSuite;
import com.here.ivi.api.generator.common.GeneratorSuite;
import org.apache.commons.cli.*;

import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;

public class OptionReader {

    public static class TranspilerOptions {
        public String getInputDir() {
            return inputDir;
        }
        public String getOutputDir() {
            return outputDir;
        }
        public boolean dumpToStdout() {
            return stdoutDump;
        }
        public List<String> getGenerators() {
            return generators;
        }
        public boolean validateOnly() { return validateOnly; }
        protected String inputDir;

        protected String outputDir;
        protected boolean stdoutDump;
        protected boolean validateOnly = false;

        protected List<String> generators;
    }

    public OptionReader() {
        this.options = new Options();

        options.addOption("input", true, "The path or the file to use for generation");
        options.addOption("output", true, "Generated files output destination");
        options.addOption("nostdout", false, "Don't dump generated files to stdout");
        options.addOption("help", false, "Shows this help and exits.");
        options.addOption("listGenerators", false, "Prints out all available generators and exits.");
        options.addOption("validateOnly", false, "Perform fidl and fdepl files validation without generating any code.");

        Option generatorsOpt = new Option("generators", true,
                "The generators to use, separated by comma. Uses all available generators by default.");
        generatorsOpt.setValueSeparator(',');
        options.addOption(generatorsOpt);
    }

    public TranspilerOptions read(final String[] args) throws OptionReaderException {
        TranspilerOptions res = new TranspilerOptions();
        CommandLineParser parser = new BasicParser();

        try {
            CommandLine cmd = parser.parse(options, args);

            if (cmd.hasOption("listGenerators")) {
                printGenerators();
                System.exit(0);
            }

            if (cmd.hasOption("help")) {
                printUsage();
                System.exit(0);
            }

            String[] remainingArgs = cmd.getArgs();
            if (remainingArgs.length > 1) {
                throw new OptionReaderException("too many arguments");
            }

            if (cmd.hasOption("input")) {
                res.inputDir = cmd.getOptionValue("input");
            } else if (remainingArgs.length == 1){
                res.inputDir = remainingArgs[0];
            }

            if (cmd.hasOption("output")) {
                res.outputDir = cmd.getOptionValue("output");

            } else {
                res.outputDir = null;
            }

            if (cmd.hasOption("generators")) {
                res.generators = Arrays.asList(cmd.getOptionValues("generators"));
            } else {
                res.generators = GeneratorSuite.generatorShortNames();
            }

            if (cmd.hasOption("validateOnly")) {
                res.validateOnly = true;
            }

            res.stdoutDump = !cmd.hasOption("nostdout");

        } catch (ParseException e) {
            throw new OptionReaderException(e.getMessage());
        }

        if (res.inputDir == null) {
            throw new OptionReaderException("input option required");
        }

        return res;
    }

    private void printGenerators() {
        System.out.println("Available generators: \n");

        for (String sn : GeneratorSuite.generatorShortNames()) {
            System.out.println("  Found generator " + sn);

            try {
                GeneratorSuite<?, ?> gen = GeneratorSuite.instantiateByShortName(sn, null);
                System.out.println("   DefinedIn:  " + gen.getClass().getName());
                System.out.println("   Name:       " + gen.getName());
                System.out.println("   Version:    " + gen.getVersion());
            } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException | InstantiationException e) {
                System.err.println("   Instantiation failed!");
            }

            System.out.println("");
        }
    }

    public void printUsage() {
        String header = "Transpiler - Generate APIs for franca files\n\n";
        String footer = "\nPlease report issues at /dev/null";

        HelpFormatter formatter = new HelpFormatter();
        formatter.printHelp("transpiler [input]", header, options, footer, true);
    }

    private final Options options;
}
