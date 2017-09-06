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

import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppStruct;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class TopologicalSortTest {
  private static final CppComplexTypeRef TYPE_A = new CppComplexTypeRef.Builder("A").build();
  private static final CppComplexTypeRef TYPE_B = new CppComplexTypeRef.Builder("B").build();
  private static final CppComplexTypeRef TYPE_C = new CppComplexTypeRef.Builder("C").build();

  private static final String FIRST_STRUCT_NAME = "StructA";
  private static final String SECOND_STRUCT_NAME = "StructB";
  private static final String THIRD_STRUCT_NAME = "StructC";
  private static final CppComplexTypeRef FIRST_STRUCT_TYPE =
      new CppComplexTypeRef.Builder(FIRST_STRUCT_NAME).build();
  private static final CppComplexTypeRef SECOND_STRUCT_TYPE =
      new CppComplexTypeRef.Builder(SECOND_STRUCT_NAME).build();
  private static final CppComplexTypeRef THIRD_STRUCT_TYPE =
      new CppComplexTypeRef.Builder(THIRD_STRUCT_NAME).build();

  private CppStruct createCppStruct(String name, List<CppField> fields) {
    CppStruct cppStruct = new CppStruct(name);
    cppStruct.fields.addAll(fields);

    return cppStruct;
  }

  @Test
  public void sortIndependentStructsKeepsSameOrder() {
    /*
      Create two structs that none of them has a field of the other struct type
      struct StructA {
        A x;
        B y;
      };

      struct StructB {
        B x;
        C y;
      };
    */

    CppStruct firstStruct =
        createCppStruct(
            FIRST_STRUCT_NAME, Arrays.asList(new CppField(TYPE_A, "x"), new CppField(TYPE_B, "y")));

    CppStruct secondStruct =
        createCppStruct(
            SECOND_STRUCT_NAME,
            Arrays.asList(new CppField(TYPE_B, "x"), new CppField(TYPE_C, "y")));

    List<CppStruct> sortedStructs = TopologicalSort.sort(Arrays.asList(firstStruct, secondStruct));

    assertEquals(2, sortedStructs.size());
    assertEquals(sortedStructs.get(0).name, FIRST_STRUCT_NAME);
    assertEquals(sortedStructs.get(1).name, SECOND_STRUCT_NAME);
  }

  @Test
  public void sortDependentStructs() {
    /*
    Create two structs such as the second has a field of the first
      struct StructA {
        A x;
        StructB y;
      };

      struct StructB {
        B x;
        C y;
      };
    */
    CppStruct firstStruct =
        createCppStruct(
            FIRST_STRUCT_NAME,
            Arrays.asList(new CppField(TYPE_A, "x"), new CppField(SECOND_STRUCT_TYPE, "y")));

    CppStruct secondStruct =
        createCppStruct(
            SECOND_STRUCT_NAME,
            Arrays.asList(new CppField(TYPE_B, "x"), new CppField(TYPE_C, "y")));

    List<CppStruct> sortedStructs = TopologicalSort.sort(Arrays.asList(firstStruct, secondStruct));

    assertEquals(2, sortedStructs.size());
    assertEquals(sortedStructs.get(0).name, SECOND_STRUCT_NAME);
    assertEquals(sortedStructs.get(1).name, FIRST_STRUCT_NAME);
  }

  @Test
  public void sortSortedDependentStructsKeepsSameOrder() {
    /*
    Create two structs such as the second has a field of the first
        struct StructA {
          A x;
          B y;
        };

        struct StructB {
          B x;
          StructA y;
        };
    */
    CppStruct firstStruct =
        createCppStruct(
            FIRST_STRUCT_NAME, Arrays.asList(new CppField(TYPE_A, "x"), new CppField(TYPE_B, "y")));

    CppStruct secondStruct =
        createCppStruct(
            SECOND_STRUCT_NAME,
            Arrays.asList(new CppField(TYPE_B, "x"), new CppField(FIRST_STRUCT_TYPE, "y")));

    List<CppStruct> sortedStructs = TopologicalSort.sort(Arrays.asList(firstStruct, secondStruct));

    assertEquals(2, sortedStructs.size());
    assertEquals(sortedStructs.get(0).name, FIRST_STRUCT_NAME);
    assertEquals(sortedStructs.get(1).name, SECOND_STRUCT_NAME);
  }

  @Test
  public void sortMultipleStructsWithDependencies() {
    /*
    Create 3 structs such as the first depend on the second and the third and
    the second depend on the third
      struct StructA {
       StructB x;
       StructC y;
      };

      struct StructB {
       B x;
       StructC y;
      };

      struct StructC {
       A x;
       B y;
      };
    */
    CppStruct firstStruct =
        createCppStruct(
            FIRST_STRUCT_NAME,
            Arrays.asList(
                new CppField(SECOND_STRUCT_TYPE, "x"), new CppField(THIRD_STRUCT_TYPE, "y")));

    CppStruct secondStruct =
        createCppStruct(
            SECOND_STRUCT_NAME,
            Arrays.asList(new CppField(TYPE_B, "x"), new CppField(THIRD_STRUCT_TYPE, "y")));

    CppStruct thirdStruct =
        createCppStruct(
            THIRD_STRUCT_NAME, Arrays.asList(new CppField(TYPE_A, "x"), new CppField(TYPE_B, "y")));

    List<CppStruct> sortedStructs =
        TopologicalSort.sort(Arrays.asList(firstStruct, secondStruct, thirdStruct));

    assertEquals(3, sortedStructs.size());
    assertEquals(sortedStructs.get(0).name, THIRD_STRUCT_NAME);
    assertEquals(sortedStructs.get(1).name, SECOND_STRUCT_NAME);
    assertEquals(sortedStructs.get(2).name, FIRST_STRUCT_NAME);
  }
}
