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

import static org.junit.Assert.assertEquals;

import com.here.genium.model.cpp.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

@RunWith(Parameterized.class)
public class TopologicalSortTest {
  private static final String TYPE_A = "A";
  private static final String TYPE_B = "B";
  private static final String TYPE_C = "C";
  private static final String FIRST_STRUCT_NAME = "StructA";
  private static final String SECOND_STRUCT_NAME = "StructB";
  private static final String THIRD_STRUCT_NAME = "StructC";

  private static final String ENUM_NAME = "Kind";
  private static final String TYPE_DEF_NAME = "shortcut";

  private static final CppEnum CPP_ENUM =
      CppEnum.builder(ENUM_NAME).fullyQualifiedName(ENUM_NAME).build();
  private static final CppStruct PARENT_STRUCT = createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B);
  private static final CppStruct CHILD_STRUCT = createChild();
  private static final CppUsing CPP_USING = createUsing(TYPE_DEF_NAME, createComplex(TYPE_A));

  private final List<CppElement> elements;
  private final List<Integer> expectedOrder;

  public TopologicalSortTest(
      @SuppressWarnings("unused") final String testName,
      final List<CppElement> elements,
      final List<Integer> expectedOrder) {
    this.elements = elements;
    this.expectedOrder = expectedOrder;
  }

  @Parameterized.Parameters(name = "{0}")
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          {
            "sortIndependentStructsKeepsSameOrder",
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)),
            Arrays.asList(0, 1)
          },
          {
            "sortDependentStructs",
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, SECOND_STRUCT_NAME),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)),
            Arrays.asList(1, 0)
          },
          {
            "sortSortedDependentStructsKeepsSameOrder",
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, FIRST_STRUCT_NAME)),
            Arrays.asList(0, 1)
          },
          {
            "sortMultipleStructsWithDependencies",
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, SECOND_STRUCT_NAME, THIRD_STRUCT_NAME),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, THIRD_STRUCT_NAME),
                createCppStruct(THIRD_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(2, 1, 0)
          },
          {
            "sortEnumWithStructDependingOnIt",
            Arrays.asList(createCppStruct(FIRST_STRUCT_NAME, TYPE_A, ENUM_NAME), CPP_ENUM),
            Arrays.asList(1, 0)
          },
          {
            "enumWithStructNotDependingOnItKeepsSameOrder",
            Arrays.asList(createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B), CPP_ENUM),
            Arrays.asList(0, 1)
          },
          {
            "enumWithUsingDependingOnIt",
            Arrays.asList(createUsing(TYPE_DEF_NAME, createComplex(ENUM_NAME)), CPP_ENUM),
            Arrays.asList(1, 0)
          },
          {
            "enumWithUsingNotDependingOnItKeepsSameOrder",
            Arrays.asList(CPP_USING, CPP_ENUM),
            Arrays.asList(0, 1)
          },
          {
            "enumWithConstantDependingOnIt",
            Arrays.asList(createConstant(ENUM_NAME), CPP_ENUM),
            Arrays.asList(1, 0)
          },
          {
            "enumWithConstantNotDependingOnItKeepsSameOrder",
            Arrays.asList(createConstant(TYPE_A), CPP_ENUM),
            Arrays.asList(0, 1)
          },
          {
            "constantDependingOnStruct",
            Arrays.asList(
                createConstant(FIRST_STRUCT_NAME),
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(1, 0)
          },
          {
            "constantNotDependingOnStructKeepsSameOrder",
            Arrays.asList(
                createConstant(TYPE_A), createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(0, 1)
          },
          {
            "constantDependingOnDefinition",
            Arrays.asList(createConstantWithUsing(TYPE_DEF_NAME), CPP_USING),
            Arrays.asList(1, 0)
          },
          {
            "constantNotDependingOnDefinitionKeepsSameOrder",
            Arrays.asList(createConstant(TYPE_B), CPP_USING),
            Arrays.asList(0, 1)
          },
          {
            "usingDependingOnUsing",
            Arrays.asList(
                createUsing(
                    "anotherShortcut", new CppTypeDefRef(TYPE_DEF_NAME, createComplex(TYPE_A))),
                CPP_USING),
            Arrays.asList(1, 0)
          },
          {
            "usingNotDependingOnUsingKeepsSameOrder",
            Arrays.asList(CPP_USING, createUsing("anotherShortcut", createComplex(TYPE_B))),
            Arrays.asList(0, 1)
          },
          {
            "usingDependingOnStruct",
            Arrays.asList(
                createUsing(TYPE_DEF_NAME, createComplex(FIRST_STRUCT_NAME)),
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(1, 0)
          },
          {
            "usingNotDependingOnStructKeepsSameOrder",
            Arrays.asList(
                createUsing(TYPE_DEF_NAME, createComplex(TYPE_C)),
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(0, 1)
          },
          {
            "structDependingOnDefinition",
            Arrays.asList(createCppStruct(FIRST_STRUCT_NAME, TYPE_DEF_NAME, TYPE_B), CPP_USING),
            Arrays.asList(1, 0)
          },
          {
            "structNotDependingOnDefinitionKeepsSameOrder",
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                createUsing(TYPE_DEF_NAME, createComplex(TYPE_C))),
            Arrays.asList(0, 1)
          },
          {
            "childStructFollowedByParentStruct",
            Arrays.asList(CHILD_STRUCT, PARENT_STRUCT),
            Arrays.asList(1, 0)
          },
          {
            "parentStructFollowedByChildStruct",
            Arrays.asList(PARENT_STRUCT, CHILD_STRUCT),
            Arrays.asList(0, 1)
          }
        });
  }

  private static CppComplexTypeRef createComplex(String name) {
    return new CppComplexTypeRef.Builder(name).build();
  }

  private static CppStruct createCppStruct(String name, String firstType, String secondType) {
    CppStruct cppStruct = new CppStruct(name);

    cppStruct.fields.add(new CppField("x", createComplex(firstType)));
    cppStruct.fields.add(new CppField("y", createComplex(secondType)));

    return cppStruct;
  }

  private static CppUsing createUsing(final String name, final CppTypeRef typeRef) {
    return CppUsing.builder(name, typeRef).build();
  }

  private static CppConstant createConstant(String typeName) {
    String name = "fixed";
    return new CppConstant(name, createComplex(typeName), new CppValue());
  }

  private static CppConstant createConstantWithUsing(String typeName) {
    String name = "fixed";
    return new CppConstant(
        name, new CppTypeDefRef(typeName, createComplex("nonsense")), new CppValue());
  }

  private static CppStruct createChild() {
    CppStruct cppStruct = createCppStruct(SECOND_STRUCT_NAME, TYPE_A, TYPE_B);
    CppInheritance inheritance =
        new CppInheritance(createComplex(FIRST_STRUCT_NAME), CppInheritance.Type.Public);
    cppStruct.inheritances.add(inheritance);
    return cppStruct;
  }

  @Test
  public void checkOrder() {
    List<CppElement> sortedElements = new TopologicalSort(elements).sort();

    assertEquals(elements.size(), sortedElements.size());

    for (int i = 0; i < elements.size(); ++i) {
      int index = expectedOrder.get(i);
      assertEquals(elements.get(index), sortedElements.get(i));
    }
  }
}
