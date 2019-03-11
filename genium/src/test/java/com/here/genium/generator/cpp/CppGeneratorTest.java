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

package com.here.genium.generator.cpp;

import static org.junit.Assert.*;

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppClass;
import com.here.genium.model.cpp.CppFile;
import com.here.genium.model.cpp.CppMethod;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

public class CppGeneratorTest {

  private static final String OUTPUT_FILE_NAME_HEADER = "some_fancy_header.output";
  private static final String OUTPUT_FILE_NAME_IMPL = "some_fancy_impl.output";

  private final CppGenerator cppGenerator = new CppGenerator("", "");

  private final CppMethod cppMethod = new CppMethod.Builder("methodical").build();
  private final CppClass cppClass = new CppClass("Classy");
  private final CppFile cppModel = new CppFile(Collections.emptyList());

  @Before
  public void setUp() {
    cppClass.methods.add(cppMethod);
    cppModel.members.add(cppClass);
  }

  @Test
  public void generateCodeWithNullModel() {
    List<GeneratedFile> generatedFiles =
        cppGenerator.generateCode(null, OUTPUT_FILE_NAME_HEADER, OUTPUT_FILE_NAME_IMPL);

    assertTrue(generatedFiles.isEmpty());
  }

  @Test
  public void generateCodeWithEmptyModel() {
    cppModel.members.clear();

    List<GeneratedFile> generatedFiles =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME_HEADER, OUTPUT_FILE_NAME_IMPL);

    assertTrue(generatedFiles.isEmpty());
  }

  @Test
  public void generateCodeWithNonEmptyModel() {
    List<GeneratedFile> generatedFiles =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME_HEADER, OUTPUT_FILE_NAME_IMPL);

    assertFalse(generatedFiles.isEmpty());
  }

  @Test
  public void generateCodeFiltersOutSelfIncludes() {
    Include nonsenseInclude = Include.createInternalInclude("nonsense");
    Include selfInclude =
        Include.createInternalInclude(OUTPUT_FILE_NAME_HEADER + CppNameRules.HEADER_FILE_SUFFIX);
    cppModel.includes.add(nonsenseInclude);
    cppModel.includes.add(selfInclude);

    cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME_HEADER, OUTPUT_FILE_NAME_IMPL);

    assertTrue(cppModel.includes.contains(nonsenseInclude));
    assertFalse(cppModel.includes.contains(selfInclude));
  }

  @Test
  public void generateCodeGeneratesHeaderAndImplementationForInstantiableClass() {
    List<GeneratedFile> generatedFiles =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME_HEADER, OUTPUT_FILE_NAME_IMPL);

    assertEquals(2, generatedFiles.size());
    assertTrue(
        generatedFiles.get(1).content.contains("#include \"" + OUTPUT_FILE_NAME_HEADER + ".h\""));
  }

  @Test
  public void generateCodeGeneratesHeaderAndImplementationForInstantiableClassWithStaticMethods() {
    cppMethod.specifiers.add(CppMethod.Specifier.STATIC);
    cppClass.methods.add(new CppMethod.Builder("non_static_methodical").build());

    List<GeneratedFile> generatedFiles =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME_HEADER, OUTPUT_FILE_NAME_IMPL);

    assertEquals(2, generatedFiles.size());
    assertTrue(
        generatedFiles.get(1).content.contains("#include \"" + OUTPUT_FILE_NAME_HEADER + ".h\""));
  }
}
