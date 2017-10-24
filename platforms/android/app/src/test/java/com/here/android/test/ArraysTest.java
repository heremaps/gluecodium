package com.here.android.test;


import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public class ArraysTest {
    private static final String STRING_LIST_ITEM_1 = "Item1";
    private static final String STRING_LIST_ITEM_2 = "Item2";
    private static final String STRING_LIST_ITEM_3 = "Item3";
    private static final float FLOAT_VALUE_1 = 42.0f;
    private static final float FLOAT_VALUE_2 = 43.0f;
    private static final double DOUBLE_VALUE_1 = 42.0;
    private static final double DOUBLE_VALUE_2 = 43.0;
    private static final double DOUBLE_VALUE_3 = 44.0;
    private static final double DOUBLE_VALUE_4 = 45.0;
    private static final long LONG_VALUE_1 = 44L;
    private static final long LONG_VALUE_2 = 45L;
    private static final long LONG_VALUE_3 = 46L;
    private static final long LONG_VALUE_4 = 47L;
    private static final Byte BYTE_ITEM_1 = new Byte((byte) 4);
    private static final Byte BYTE_ITEM_2 = new Byte((byte) 5);
    private static final Short SHORT_ITEM_1 = new Short((short) 4);
    private static final Short SHORT_ITEM_2 = new Short((short) 5);

    @Test
    public void methodWithStringArray() {
        List<String> stringList = java.util.Arrays.asList(
                STRING_LIST_ITEM_1,
                STRING_LIST_ITEM_2);

        List<String> resultsList = Arrays.methodWithStringArray(stringList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(STRING_LIST_ITEM_2, resultsList.get(0));
        assertEquals(STRING_LIST_ITEM_1, resultsList.get(1));
    }

    @Test
    public void methodWithStringArray_useLinkedList() {
        List<String> stringList = new LinkedList<>();
        stringList.add(STRING_LIST_ITEM_1);
        stringList.add(STRING_LIST_ITEM_2);

        List<String> resultsList = Arrays.methodWithStringArray(stringList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(STRING_LIST_ITEM_2, resultsList.get(0));
        assertEquals(STRING_LIST_ITEM_1, resultsList.get(1));
    }

    @Test
    public void methodWithInlineArray() {
        List<Short> shortList = java.util.Arrays.asList(SHORT_ITEM_1, SHORT_ITEM_2);

        List<Short> resultsList = Arrays.methodWithArrayInline(shortList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(SHORT_ITEM_2, resultsList.get(0));
        assertEquals(SHORT_ITEM_1, resultsList.get(1));
    }

    @Test
    public void methodWithInt8Array() {
        List<Byte> byteList = java.util.Arrays.asList(BYTE_ITEM_1, BYTE_ITEM_2);

        List<Byte> resultsList = Arrays.methodWithInt8Array(byteList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(BYTE_ITEM_2, resultsList.get(0));
        assertEquals(BYTE_ITEM_1, resultsList.get(1));
    }

    @Test
    public void methodWithInt16Array() {
        List<Short> shortList = java.util.Arrays.asList(SHORT_ITEM_1, SHORT_ITEM_2);

        List<Short> resultsList = Arrays.methodWithInt16Array(shortList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(SHORT_ITEM_2, resultsList.get(0));
        assertEquals(SHORT_ITEM_1, resultsList.get(1));
    }

    @Test
    public void methodWithInt32Array() {
        List<Integer> intList = java.util.Arrays.asList(6, 7);

        List<Integer> resultsList = Arrays.methodWithInt32Array(intList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(7, resultsList.get(0).intValue());
        assertEquals(6, resultsList.get(1).intValue());
    }

    @Test
    public void methodWithInt64Array() {
        List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

        List<Long> resultsList = Arrays.methodWithInt64Array(longList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
        assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
    }

    @Test
    public void methodWithUInt16Array() {
        List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

        List<Long> resultsList = Arrays.methodWithUInt16Array(longList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
        assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
    }

    @Test
    public void methodWithUInt32Array() {
        List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

        List<Long> resultsList = Arrays.methodWithUInt32Array(longList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
        assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
    }

    @Test
    public void methodWithUInt64Array() {
        List<Long> longList = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);

        List<Long> resultsList = Arrays.methodWithUInt64Array(longList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(LONG_VALUE_2, resultsList.get(0).longValue());
        assertEquals(LONG_VALUE_1, resultsList.get(1).longValue());
    }

    @Test
    public void methodWithFloatArray() {
        List<Float> floatList = java.util.Arrays.asList(FLOAT_VALUE_1, FLOAT_VALUE_2);

        List<Float> resultsList = Arrays.methodWithFloatArray(floatList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(FLOAT_VALUE_2, resultsList.get(0));
        assertEquals(FLOAT_VALUE_1, resultsList.get(1));
    }

    @Test
    public void methodWithDoubleArray() {
        List<Double> doubleList = java.util.Arrays.asList(DOUBLE_VALUE_1, DOUBLE_VALUE_2);

        List<Double> resultsList = Arrays.methodWithDoubleArray(doubleList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(DOUBLE_VALUE_2, resultsList.get(0));
        assertEquals(DOUBLE_VALUE_1, resultsList.get(1));
    }

    @Test
    public void methodWithBooleanArray() {
        List<Boolean> booleanList = java.util.Arrays.asList(true, true, false);

        List<Boolean> resultsList = Arrays.methodWithBoolArray(booleanList);

        assertNotNull(resultsList);
        assertEquals(3, resultsList.size());
        assertEquals(false, resultsList.get(0).booleanValue());
        assertEquals(true, resultsList.get(1).booleanValue());
        assertEquals(true, resultsList.get(2).booleanValue());
    }

    @Test
    public void methodWithStructArray() {
        Arrays.BasicStruct struct1 = new Arrays.BasicStruct();
        Arrays.BasicStruct struct2 = new Arrays.BasicStruct();
        struct1.value = DOUBLE_VALUE_1;
        struct2.value = DOUBLE_VALUE_2;
        List<Arrays.BasicStruct> structList = java.util.Arrays.asList(struct1, struct2);

        List<Arrays.BasicStruct> resultsList = Arrays.methodWithStructArray(structList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(DOUBLE_VALUE_2, resultsList.get(0).value);
        assertEquals(DOUBLE_VALUE_1, resultsList.get(1).value);
    }

    @Test
    public void methodWithInstanceArray() {
        SimpleInstantiableOne instance1 = InstancesFactory.createSimpleInstantiableOne();
        SimpleInstantiableOne instance2 = InstancesFactory.createSimpleInstantiableOne();
        instance1.setStringValue(STRING_LIST_ITEM_1);
        instance2.setStringValue(STRING_LIST_ITEM_2);
        List<SimpleInstantiableOne> instancesArray = java.util.Arrays.asList(instance1, instance2);

        List<SimpleInstantiableOne> resultsList = Arrays.methodWithInstancesArray(instancesArray);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        assertEquals(STRING_LIST_ITEM_2, resultsList.get(0).getStringValue());
        assertEquals(STRING_LIST_ITEM_1, resultsList.get(1).getStringValue());
    }

    @Test
    public void methodWithNestedPrimitiveArray() {
        List<List<Double>> nestedDoubleList = java.util.Arrays.asList(
                java.util.Arrays.asList(DOUBLE_VALUE_1, DOUBLE_VALUE_2),
                java.util.Arrays.asList(DOUBLE_VALUE_3, DOUBLE_VALUE_4));

        List<List<Double>> resultsList = Arrays.methodWithNestedPrimitiveArray(nestedDoubleList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        List<Double> firstResult = resultsList.get(0);
        List<Double> secondResult = resultsList.get(1);
        assertEquals(2, firstResult.size());
        assertEquals(2, secondResult.size());
        assertEquals(DOUBLE_VALUE_4, firstResult.get(0));
        assertEquals(DOUBLE_VALUE_3, firstResult.get(1));
        assertEquals(DOUBLE_VALUE_2, secondResult.get(0));
        assertEquals(DOUBLE_VALUE_1, secondResult.get(1));
    }

    @Test
    public void methodWithNestedStructArray() {
        Arrays.BasicStruct struct1 = new Arrays.BasicStruct();
        Arrays.BasicStruct struct2 = new Arrays.BasicStruct();
        Arrays.BasicStruct struct3 = new Arrays.BasicStruct();
        Arrays.BasicStruct struct4 = new Arrays.BasicStruct();
        struct1.value = DOUBLE_VALUE_1;
        struct2.value = DOUBLE_VALUE_2;
        struct3.value = DOUBLE_VALUE_3;
        struct4.value = DOUBLE_VALUE_4;
        List<List<Arrays.BasicStruct>> nestedStructList = java.util.Arrays.asList(
                java.util.Arrays.asList(struct1, struct2),
                java.util.Arrays.asList(struct3, struct4));

        List<List<Arrays.BasicStruct>> resultsList =
                Arrays.methodWithNestedStructArray(nestedStructList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        List<Arrays.BasicStruct> firstResult = resultsList.get(0);
        List<Arrays.BasicStruct> secondResult = resultsList.get(1);
        assertEquals(2, firstResult.size());
        assertEquals(2, secondResult.size());
        assertEquals(DOUBLE_VALUE_4, firstResult.get(0).value);
        assertEquals(DOUBLE_VALUE_3, firstResult.get(1).value);
        assertEquals(DOUBLE_VALUE_2, secondResult.get(0).value);
        assertEquals(DOUBLE_VALUE_1, secondResult.get(1).value);
    }

    @Test
    public void methodWithNestedArraysInline() {
        List<List<Long>> nestedLongList = java.util.Arrays.asList(
                java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2),
                java.util.Arrays.asList(LONG_VALUE_3, LONG_VALUE_4));

        List<List<Long>> resultsList = Arrays.methodWithNestedArraysInline(nestedLongList);

        assertNotNull(resultsList);
        assertEquals(2, resultsList.size());
        List<Long> firstResult = resultsList.get(0);
        List<Long> secondResult = resultsList.get(1);
        assertEquals(2, firstResult.size());
        assertEquals(2, secondResult.size());
        assertEquals(LONG_VALUE_4, firstResult.get(0).longValue());
        assertEquals(LONG_VALUE_3, firstResult.get(1).longValue());
        assertEquals(LONG_VALUE_2, secondResult.get(0).longValue());
        assertEquals(LONG_VALUE_1, secondResult.get(1).longValue());
    }

    @Test
    public void mergeArraysOfStructsWithArrays() {
        SimpleInstantiableOne instance = InstancesFactory.createSimpleInstantiableOne();
        SimpleInstantiableOne otherInstance = InstancesFactory.createSimpleInstantiableOne();
        instance.setStringValue(STRING_LIST_ITEM_1);
        otherInstance.setStringValue(STRING_LIST_ITEM_2);
        List<SimpleInstantiableOne> instancesArray1 =
                java.util.Arrays.asList(instance, otherInstance);
        SimpleInstantiableOne instance2 = InstancesFactory.createSimpleInstantiableOne();
        instance2.setStringValue(STRING_LIST_ITEM_3);
        List<SimpleInstantiableOne> instancesArray2 = Collections.singletonList(instance2);
        Arrays.FancyStruct struct1 = new Arrays.FancyStruct();
        Arrays.FancyStruct struct2 = new Arrays.FancyStruct();
        Arrays.FancyStruct struct3 = new Arrays.FancyStruct();
        struct1.messages = java.util.Arrays.asList("struct", "1");
        struct1.numbers = java.util.Arrays.asList(LONG_VALUE_1, LONG_VALUE_2);
        struct1.instances = instancesArray1;
        struct2.messages = java.util.Arrays.asList("struct", "2");
        struct2.numbers = java.util.Arrays.asList(LONG_VALUE_3, LONG_VALUE_3);
        struct2.instances = instancesArray2;
        struct3.messages = java.util.Arrays.asList("struct", "3");
        struct3.numbers = java.util.Arrays.asList(LONG_VALUE_4, LONG_VALUE_4);
        List<Arrays.FancyStruct> fancyStructList1 = java.util.Arrays.asList(struct1, struct2);
        List<Arrays.FancyStruct> fancyStructList2 = Collections.singletonList(struct3);

        List<Arrays.FancyStruct> resultsList =
                Arrays.mergeArraysOfStructsWithArrays(fancyStructList1, fancyStructList2);

        assertEquals(3, resultsList.size());
        assertEquals("struct", resultsList.get(0).messages.get(0));
        assertEquals("3", resultsList.get(0).messages.get(1));
        assertTrue(resultsList.get(0).instances.isEmpty());
        assertTrue(resultsList.get(1).messages.get(1).contains("2"));
        assertEquals(1, resultsList.get(1).instances.size());
        assertEquals(STRING_LIST_ITEM_3, resultsList.get(1).instances.get(0).getStringValue());
        assertTrue(resultsList.get(2).messages.get(1).contains("1"));
        assertEquals(2, resultsList.get(2).instances.size());
        assertEquals(STRING_LIST_ITEM_1, resultsList.get(2).instances.get(0).getStringValue());
        assertEquals(STRING_LIST_ITEM_2, resultsList.get(2).instances.get(1).getStringValue());
    }
}
