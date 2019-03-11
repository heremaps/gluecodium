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

package com.here.genium.generator.jni;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.jni.JniContainer;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(TemplateEngine.class)
public final class JniTemplatesTest {

  private static final int MAIN_FILES_COUNT = 2;
  private static final int MAIN_FILES_WITH_INSTANCES_COUNT = 9;
  private static final String PROXY_HEADER_NAME = "classyCppProxy.h";
  private static final String PROXY_IMPLEMENTATION_NAME = "classyCppProxy.cpp";

  private final JniContainer jniContainer =
      JniContainer.builder(Collections.emptyList(), Collections.emptyList())
          .javaName("classy")
          .javaInterfaceName("classy")
          .cppName("classy")
          .isFrancaInterface(true)
          .build();

  private final JniTemplates templates = new JniTemplates(null, null, "");

  @Before
  public void setUp() {
    PowerMockito.mockStatic(TemplateEngine.class);
  }

  @Test
  public void isInterfaceProxyIsGenerated() {
    JniContainer instantiableJniContainer =
        JniContainer.builder(Collections.emptyList(), Collections.emptyList())
            .javaName("classy")
            .javaInterfaceName("classy")
            .cppName("classy")
            .isFrancaInterface(true)
            .build();
    instantiableJniContainer.isInterface = true;

    List<GeneratedFile> files =
        templates.generateConversionFiles(Collections.singletonList(instantiableJniContainer));
    assertTrue(
        "Must generate proxy header file",
        files
            .stream()
            .anyMatch(file -> Objects.equals(file.targetFile.getName(), PROXY_HEADER_NAME)));
    assertTrue(
        "Must generate proxy implementation file",
        files
            .stream()
            .anyMatch(
                file -> Objects.equals(file.targetFile.getName(), PROXY_IMPLEMENTATION_NAME)));
  }

  @Test
  public void isNoInterfaceProxyIsNotGenerated() {
    JniContainer instantiableJniContainer =
        JniContainer.builder(Collections.emptyList(), Collections.emptyList())
            .javaName("classy")
            .javaInterfaceName("classy")
            .cppName("classy")
            .isFrancaInterface(true)
            .build();
    instantiableJniContainer.isInterface = false;

    List<GeneratedFile> files =
        templates.generateConversionFiles(Collections.singletonList(instantiableJniContainer));
    assertFalse(
        "Must not generate proxy header file",
        files
            .stream()
            .anyMatch(file -> Objects.equals(file.targetFile.getName(), PROXY_HEADER_NAME)));
    assertFalse(
        "Must not generate proxy implementation file",
        files
            .stream()
            .anyMatch(
                file -> Objects.equals(file.targetFile.getName(), PROXY_IMPLEMENTATION_NAME)));
  }

  @Test
  public void generateFilesWithNullModel() {
    List<GeneratedFile> files = templates.generateFiles(null);
    assertTrue(files.isEmpty());
  }

  @Test
  public void generateFilesWithNonNullModel() {
    List<GeneratedFile> result = templates.generateFiles(jniContainer);

    assertEquals(MAIN_FILES_COUNT, result.size());

    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/Header"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/Implementation"), any());
  }

  @Test
  public void generateConversionFiles() {
    JniContainer instantiableJniContainer =
        JniContainer.builder(Collections.emptyList(), Collections.emptyList())
            .javaName("classy")
            .javaInterfaceName("classy")
            .cppName("classy")
            .isFrancaInterface(true)
            .build();
    instantiableJniContainer.isInterface = true;

    List<GeneratedFile> result =
        templates.generateConversionFiles(Collections.singletonList(instantiableJniContainer));

    assertEquals(MAIN_FILES_WITH_INSTANCES_COUNT, result.size());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/StructConversionHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/StructConversionImplementation"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/InstanceConversionHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/InstanceConversionImplementation"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/CppProxyHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/CppProxyImplementation"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/ProxyGeneratorHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/EnumConversionHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/EnumConversionImplementation"), any());
  }
}
