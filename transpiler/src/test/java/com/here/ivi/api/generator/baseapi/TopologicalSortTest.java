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

package com.here.ivi.api.generator.baseapi;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.cppmodel.*;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
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
  private static final CppEnum ENUM = CppEnum.create(ENUM_NAME);
  private static final String TYPE_DEF_NAME = "shortcut";

  private final List<CppElement> elements;
  private final List<Integer> expectedOrder;

  public TopologicalSortTest(List<CppElement> elements, List<Integer> expectedOrder) {
    this.elements = elements;
    this.expectedOrder = expectedOrder;
  }

  @Parameterized.Parameters
  @SuppressWarnings({"PMD.ExcessiveMethodLength"})
  public static Collection<Object[]> testData() {
    return Arrays.asList(
        new Object[][] {
          // sortIndependentStructsKeepsSameOrder
          {
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)),
            Arrays.asList(0, 1)
          },
          // sortDependentStructs
          {
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, SECOND_STRUCT_NAME),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)),
            Arrays.asList(1, 0)
          },
          // sortSortedDependentStructsKeepsSameOrder
          {
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, FIRST_STRUCT_NAME)),
            Arrays.asList(0, 1)
          },
          // sortMultipleStructsWithDependencies
          {
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, SECOND_STRUCT_NAME, THIRD_STRUCT_NAME),
                createCppStruct(SECOND_STRUCT_NAME, TYPE_B, THIRD_STRUCT_NAME),
                createCppStruct(THIRD_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(2, 1, 0)
          },
          // sortEnumWithStructDependingOnIt
          {
            Arrays.asList(createCppStruct(FIRST_STRUCT_NAME, TYPE_A, ENUM_NAME), ENUM),
            Arrays.asList(1, 0)
          },
          // enumWithStructNotDependingOnItKeepsSameOrder
          {
            Arrays.asList(createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B), ENUM),
            Arrays.asList(0, 1)
          },
          // enumWithUsingDependingOnIt
          {Arrays.asList(createUsing(ENUM_NAME), ENUM), Arrays.asList(1, 0)},
          // enumWithUsingNotDependingOnItKeepsSameOrder
          {Arrays.asList(createUsing(TYPE_A), ENUM), Arrays.asList(0, 1)},
          // enumWithConstantDependingOnIt
          {Arrays.asList(createConstant(ENUM_NAME), ENUM), Arrays.asList(1, 0)},
          // enumWithConstantNotDependingOnItKeepsSameOrder
          {Arrays.asList(createConstant(TYPE_A), ENUM), Arrays.asList(0, 1)},
          // constantDependingOnStruct
          {
            Arrays.asList(
                createConstant(FIRST_STRUCT_NAME),
                createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(1, 0)
          },
          // constantNotDependingOnStructKeepsSameOrder
          {
            Arrays.asList(
                createConstant(TYPE_A), createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(0, 1)
          },
          // constantDependingOnDefinition
          {Arrays.asList(createConstant(TYPE_DEF_NAME), createUsing(TYPE_A)), Arrays.asList(1, 0)},
          // constantNotDependingOnDefinitionKeepsSameOrder
          {Arrays.asList(createConstant(TYPE_B), createUsing(TYPE_A)), Arrays.asList(0, 1)},
          // usingDependingOnUsing
          {
            Arrays.asList(createUsing("anotherShortcut", TYPE_DEF_NAME), createUsing(TYPE_A)),
            Arrays.asList(1, 0)
          },
          // usingNotDependingOnUsingKeepsSameOrder
          {
            Arrays.asList(createUsing(TYPE_A), createUsing("anotherShortcut", TYPE_B)),
            Arrays.asList(0, 1)
          },
          // usingDependingOnStruct
          {
            Arrays.asList(
                createUsing(FIRST_STRUCT_NAME), createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(1, 0)
          },
          // usingNotDependingOnStructKeepsSameOrder
          {
            Arrays.asList(createUsing(TYPE_C), createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)),
            Arrays.asList(0, 1)
          },
          // structDependingOnDefinition
          {
            Arrays.asList(
                createCppStruct(FIRST_STRUCT_NAME, TYPE_DEF_NAME, TYPE_B), createUsing(TYPE_A)),
            Arrays.asList(1, 0)
          },
          // structNotDependingOnDefinitionKeepsSameOrder
          {
            Arrays.asList(createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B), createUsing(TYPE_C)),
            Arrays.asList(0, 1)
          },
        });
  }

  private static CppComplexTypeRef createComplex(String name) {
    return new CppComplexTypeRef.Builder(name).build();
  }

  private static CppStruct createCppStruct(String name, String firstType, String secondType) {
    CppStruct cppStruct = new CppStruct(name);

    cppStruct.fields.add(new CppField(createComplex(firstType), "x"));
    cppStruct.fields.add(new CppField(createComplex(secondType), "y"));

    return cppStruct;
  }

  private static CppUsing createUsing(String typeName) {
    return createUsing(TYPE_DEF_NAME, typeName);
  }

  private static CppUsing createUsing(String name, String typeName) {
    CppTypeDefRef cppDefinition = new CppTypeDefRef(name, createComplex(typeName));
    return new CppUsing(name, cppDefinition);
  }

  private static CppConstant createConstant(String typeName) {
    String name = "fixed";
    return new CppConstant(name, createComplex(typeName), new CppValue());
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
