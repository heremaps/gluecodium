package com.here.ivi.api.generator;

import java.io.File;

public class GeneratedFile {

    public GeneratedFile(CharSequence content, File targetFile) {
        this.content = content;
        this.targetFile = targetFile;
    }

    final public CharSequence content;
    final public File targetFile;
}
