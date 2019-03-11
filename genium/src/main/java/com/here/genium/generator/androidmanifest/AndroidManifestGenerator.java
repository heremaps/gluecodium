/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.androidmanifest;

import com.here.genium.generator.common.AbstractGenerator;
import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.TemplateEngine;
import java.util.List;

public final class AndroidManifestGenerator extends AbstractGenerator {

  public AndroidManifestGenerator(final List<String> packageList) {
    super(packageList);
  }

  public GeneratedFile generate() {
    String fileContent =
        TemplateEngine.render("android/AndroidManifest", String.join(".", basePackages));
    return new GeneratedFile(fileContent, AndroidManifestNameRules.getManifestFilename());
  }
}
