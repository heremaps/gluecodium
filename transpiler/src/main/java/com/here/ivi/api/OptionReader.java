package com.here.ivi.api;

import com.here.ivi.api.OptionReaderException;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

public class OptionReader{
    public String getOutputDir() {
        return outputDir;
    }

    public boolean dumpToStdout() {
        return stdoutDump;
    }

    public OptionReader(final String[] args) throws OptionReaderException {
        Options options = new Options();

        options.addOption("output", true, "Generated files output destination");
        options.addOption("nostdout", false, "Don't dump generated files to stdout");

        CommandLineParser parser = new BasicParser();
        CommandLine cmd;

        try {
            cmd = parser.parse(options, args);
            if (cmd.hasOption("output"))
              outputDir = cmd.getOptionValue("output");
            else
              outputDir = null;

            stdoutDump = !cmd.hasOption("nostdout");
        } catch (ParseException e) {
            throw new OptionReaderException(e.getMessage());
        }
    }
    private final String outputDir;
    private final boolean stdoutDump;
}
