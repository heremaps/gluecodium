package com.here.ivi.api.output;

import com.here.ivi.api.generator.common.GeneratedFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FileOutput implements GeneratorOutput {

    private static Logger logger = Logger.getLogger(FileOutput.class.getName());

    public FileOutput(File rootPath) throws IOException {
        if (!rootPath.exists()) {
            if (!rootPath.mkdir()) {
                throw new FileNotFoundException(rootPath.getPath() +
                        " (Can't create output directory)");
            }
        }
        this.rootPath = rootPath;
    }

    @Override
    public void output(List<GeneratedFile> files) throws IOException {
        for (GeneratedFile f : files) {
            output(f);
        }
    }

    public void output(GeneratedFile file) throws IOException {

        // write file
        File targetFile = new File(rootPath, file.targetFile.getPath());
        logger.log(Level.INFO, "Writing " + targetFile);

        // create missing path(s)
        Path path = Paths.get(targetFile.getParent());
        if (Files.notExists(path)) {
            Files.createDirectories(path);
        }

        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(targetFile));
        bufferedWriter.write(file.content.toString());
        bufferedWriter.close();
    }

    private final File rootPath;
}
