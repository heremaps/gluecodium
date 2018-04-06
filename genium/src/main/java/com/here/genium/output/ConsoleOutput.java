/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.output;

import com.here.genium.generator.common.GeneratedFile;
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
