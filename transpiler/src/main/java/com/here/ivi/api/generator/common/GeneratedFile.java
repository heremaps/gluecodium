package com.here.ivi.api.generator.common;

import java.io.File;

public class GeneratedFile {

    public GeneratedFile(CharSequence content, String targetFile) {
        this(content, new File(targetFile));
    }

    public GeneratedFile(CharSequence content, File targetFile) {
        this.content = content;
        this.targetFile = targetFile;
    }

    final public CharSequence content;
    final public File targetFile;
}
