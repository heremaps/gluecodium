/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.java;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.java.JavaExceptionType;
import com.here.genium.model.java.JavaImport;
import com.here.genium.model.java.JavaPackage;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({DefinedBy.class})
public final class JavaTypeMapperEnumTypeTest {

  private static final List<String> MY_PACKAGE_NAMES = Collections.singletonList("enumPckg");
  private static final JavaPackage MY_PACKAGE = new JavaPackage(MY_PACKAGE_NAMES);

  private static final String INTERFACE_NAME = "MyEnumIface";
  private static final String TYPE_COLLECTION_NAME = "MyEnumTC";
  private static final String ENUMERATION_NAME_INTERFACE = "MyEnumDefinedInInterface";
  private static final String ENUMERATION_NAME_TYPE_COLLECTION = "MyEnumDefinedInTypeCollection";
  private static final String EXCEPTION_NAME_INTERFACE =
      INTERFACE_NAME + "." + ENUMERATION_NAME_INTERFACE + "Exception";
  private static final String EXCEPTION_NAME_TYPE_COLLECTION =
      ENUMERATION_NAME_TYPE_COLLECTION + "Exception";

  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FTypeCollection fTypeCollection;
  @Mock private FInterface fInterface;

  private final JavaTypeMapper typeMapper =
      new JavaTypeMapper(new JavaPackage(Collections.emptyList()), null, null, null);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(DefinedBy.class);
    MockitoAnnotations.initMocks(this);
    when(fInterface.getName()).thenReturn(INTERFACE_NAME);
    when(fTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(DefinedBy.getPackages(fInterface)).thenReturn(MY_PACKAGE_NAMES);
    when(DefinedBy.getPackages(fTypeCollection)).thenReturn(MY_PACKAGE_NAMES);
  }

  @Test
  public void mapFrancaEnumerationTypeToJavaExceptionTypeInInterface() {

    when(DefinedBy.findDefiningTypeCollection(francaEnumerationType)).thenReturn(fInterface);
    when(francaEnumerationType.getName()).thenReturn(ENUMERATION_NAME_INTERFACE);
    when(francaEnumerationType.eContainer()).thenReturn(fInterface);

    // act
    JavaExceptionType javaExceptionType = typeMapper.mapExceptionType(francaEnumerationType);

    // assert
    assertEquals(EXCEPTION_NAME_INTERFACE, javaExceptionType.name);
    assertEquals(
        Arrays.asList(INTERFACE_NAME, ENUMERATION_NAME_INTERFACE + "Exception"),
        javaExceptionType.classNames);
    assertEquals(MY_PACKAGE_NAMES, javaExceptionType.packageNames);
    assertEquals(1, javaExceptionType.imports.size());
    assertEquals(
        new JavaImport(INTERFACE_NAME, MY_PACKAGE), javaExceptionType.imports.iterator().next());
  }

  @Test
  public void mapFrancaEnumerationTypeToJavaExceptionTypeInTypeCollection() {

    when(DefinedBy.findDefiningTypeCollection(francaEnumerationType)).thenReturn(fTypeCollection);
    when(francaEnumerationType.getName()).thenReturn(ENUMERATION_NAME_TYPE_COLLECTION);
    when(francaEnumerationType.eContainer()).thenReturn(fTypeCollection);

    // act
    JavaExceptionType javaExceptionType = typeMapper.mapExceptionType(francaEnumerationType);

    // assert
    assertEquals(EXCEPTION_NAME_TYPE_COLLECTION, javaExceptionType.name);
    assertEquals(Arrays.asList(EXCEPTION_NAME_TYPE_COLLECTION), javaExceptionType.classNames);
    assertEquals(MY_PACKAGE_NAMES, javaExceptionType.packageNames);
    assertEquals(1, javaExceptionType.imports.size());
    assertEquals(
        new JavaImport(EXCEPTION_NAME_TYPE_COLLECTION, MY_PACKAGE),
        javaExceptionType.imports.iterator().next());
  }
}
