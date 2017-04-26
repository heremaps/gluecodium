package com.here.ivi.api.generator.common;

import java.io.File;
import java.io.IOException;
import java.net.URL;

/**
 * Class using clang-format tool to process file content
 */
public class ClangFormatter extends CommandLineTool {

    /**
     *  Enums to choose language used while formatting files
     */
    public enum Language {
        CPP,
        JAVA,
    }

    /**
     * @param styleFile Path to resource file containing style to be used for formatting. It must be a file named '.clang-format'.
     * @param language Argument to choose language that will be assumed by clang-format while formatting files.
     *                 Based on this argument proper value of parameter '-assume-filename' (cpp, java, js, ...)
     *                 will be set.
     * @throws IOException Thrown in case passed style file does not exists, is not a file, can not be found in resources or
     *                     has name different than '.clang-format'
     */
    public ClangFormatter(String styleFile, Language language) throws IOException {
        super("clang-format");
        URL resource = getClass().getClassLoader().getResource(styleFile);
        if (resource == null) {
            throw new IOException(String.format("Unable to load style file from resources: %s", styleFile));
        }
        File file = new File(resource.getPath());
        if (!file.isFile()) {
            throw new IOException(String.format("Provided resource '%s' is not a file", styleFile));
        }
        if (!".clang-format".equals(file.getName())) {
            throw new IOException(String.format("Provided resource '%s' does not refer to '.clang-format' file", styleFile));
        }
        String directory = file.getParent();
        this.setCWD(directory);
        this.setArgs(new String[]{"-style=file", String.format("-assume-filename=.%s", filenameFromLanguage(language))});
    }

    private static String filenameFromLanguage(Language language) throws IOException {
        String assumeFilename;
        switch( language ) {
            case CPP:
                assumeFilename = "cpp";
                break;
            case JAVA:
                assumeFilename = "java";
                break;
            default:
                throw new IOException(String.format("Unsupported language requested: '%s'", language));
        }
        return assumeFilename;
    }
}
