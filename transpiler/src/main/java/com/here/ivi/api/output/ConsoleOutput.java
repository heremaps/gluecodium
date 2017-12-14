/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.output;

import com.here.ivi.api.generator.common.GeneratedFile;
import java.io.IOException;
import java.util.List;
import org.eclipse.xtend2.lib.StringConcatenation;

/** Write generated files to standard console output. */
public class ConsoleOutput implements GeneratorOutput {

  @Override
  public void output(List<GeneratedFile> files) throws IOException {
    files.forEach(
        file -> {
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
