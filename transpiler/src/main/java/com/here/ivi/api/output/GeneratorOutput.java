package com.here.ivi.api.output;

import com.here.ivi.api.generator.common.GeneratedFile;

import java.io.IOException;
import java.util.List;

public interface GeneratorOutput {
    void output(List<GeneratedFile> files) throws IOException;
}
