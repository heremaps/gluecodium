package com.here.ivi.api.output;

import com.here.ivi.api.generator.common.GeneratedFile;
import org.eclipse.xtend2.lib.StringConcatenation;

import java.io.IOException;
import java.util.List;

public class ConsoleOutput implements GeneratorOutput {
    @Override
    public void output(List<GeneratedFile> files) throws IOException {
        files.forEach(file -> {
            StringConcatenation builder = new StringConcatenation();
            builder.append("Generated ");
            builder.append(file.targetFile.getPath(), "");
            builder.append(":");
            builder.newLineIfNotEmpty();
            builder.newLine();
            builder.append("        ");
            builder.append(file.content, "        ");
            builder.newLineIfNotEmpty();

            System.out.println(builder.toString());
        });

        System.out.println("Done.");
    }
}
