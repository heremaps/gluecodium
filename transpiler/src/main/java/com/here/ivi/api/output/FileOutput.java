package com.here.ivi.api.output;

import com.here.ivi.api.generator.common.GeneratedFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class FileOutput implements GeneratorOutput {
    public FileOutput(File rootPath) throws IOException {
        if (!rootPath.exists()) {
            throw new FileNotFoundException(rootPath.getPath()  + " (Missing root path)");
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
