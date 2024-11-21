/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.HashMapBuilder;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class TypesWithDefaults {
    public static final class StructWithDefaults {
        public int intField;
        public long uintField;
        public float floatField;
        public double doubleField;
        public boolean boolField;
        @NonNull
        public String stringField;

        public StructWithDefaults() {
            this.intField = 42;
            this.uintField = 4294967295L;
            this.floatField = 3.14f;
            this.doubleField = -1.4142;
            this.boolField = true;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
        }


    }

    public static final class ImmutableStructWithDefaults {
        public final int intField;
        public final long uintField;
        public final float floatField;
        public final double doubleField;
        public final boolean boolField;
        @NonNull
        public final String stringField;

        public ImmutableStructWithDefaults(final long uintField, final boolean boolField) {
            this.intField = 42;
            this.uintField = uintField;
            this.floatField = 3.14f;
            this.doubleField = -1.4142;
            this.boolField = boolField;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
        }

        public ImmutableStructWithDefaults(final int intField, final long uintField, final float floatField, final double doubleField, final boolean boolField, @NonNull final String stringField) {
            this.intField = intField;
            this.uintField = uintField;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.boolField = boolField;
            this.stringField = stringField;
        }


    }

    public static final class ImmutableStructWithCollections {
        @Nullable
        public final List<Integer> nullableListField;
        @NonNull
        public final List<Integer> emptyListField;
        @NonNull
        public final List<Integer> valuesListField;
        @Nullable
        public final Map<Integer, String> nullableMapField;
        @NonNull
        public final Map<Integer, String> emptyMapField;
        @NonNull
        public final Map<Integer, String> valuesMapField;
        @Nullable
        public final Set<String> nullableSetField;
        @NonNull
        public final Set<String> emptySetField;
        @NonNull
        public final Set<String> valuesSetField;

        public ImmutableStructWithCollections() {
            this.nullableListField = null;
            this.emptyListField = new ArrayList<>();
            this.valuesListField = new ArrayList<>(Arrays.asList(1, 2, 3));
            this.nullableMapField = null;
            this.emptyMapField = new HashMap<>();
            this.valuesMapField = new HashMapBuilder<Integer, String>().put(9, "baz").put(27, "bar").build();
            this.nullableSetField = null;
            this.emptySetField = new HashSet<>();
            this.valuesSetField = new HashSet<>(Arrays.asList("bar", "baz"));
        }

        public ImmutableStructWithCollections(@Nullable final List<Integer> nullableListField, @NonNull final List<Integer> emptyListField, @NonNull final List<Integer> valuesListField, @Nullable final Map<Integer, String> nullableMapField, @NonNull final Map<Integer, String> emptyMapField, @NonNull final Map<Integer, String> valuesMapField, @Nullable final Set<String> nullableSetField, @NonNull final Set<String> emptySetField, @NonNull final Set<String> valuesSetField) {
            this.nullableListField = nullableListField;
            this.emptyListField = emptyListField;
            this.valuesListField = valuesListField;
            this.nullableMapField = nullableMapField;
            this.emptyMapField = emptyMapField;
            this.valuesMapField = valuesMapField;
            this.nullableSetField = nullableSetField;
            this.emptySetField = emptySetField;
            this.valuesSetField = valuesSetField;
        }


    }

    public static final class ImmutableStructWithFieldConstructorAndCollections {
        @Nullable
        public final List<Integer> nullableListField;
        @NonNull
        public final List<Integer> emptyListField;
        @NonNull
        public final List<Integer> valuesListField;
        @Nullable
        public final Map<Integer, String> nullableMapField;
        @NonNull
        public final Map<Integer, String> emptyMapField;
        @NonNull
        public final Map<Integer, String> valuesMapField;
        @Nullable
        public final Set<String> nullableSetField;
        @NonNull
        public final Set<String> emptySetField;
        @NonNull
        public final Set<String> valuesSetField;
        public final int someField;
        public final int anotherField;

        public ImmutableStructWithFieldConstructorAndCollections(@Nullable final List<Integer> nullableListField, @NonNull final List<Integer> emptyListField, @NonNull final List<Integer> valuesListField, @Nullable final Map<Integer, String> nullableMapField, @NonNull final Map<Integer, String> emptyMapField, @NonNull final Map<Integer, String> valuesMapField, @Nullable final Set<String> nullableSetField, @NonNull final Set<String> emptySetField, @NonNull final Set<String> valuesSetField, final int someField, final int anotherField) {
            this.nullableListField = nullableListField;
            this.emptyListField = emptyListField;
            this.valuesListField = valuesListField;
            this.nullableMapField = nullableMapField;
            this.emptyMapField = emptyMapField;
            this.valuesMapField = valuesMapField;
            this.nullableSetField = nullableSetField;
            this.emptySetField = emptySetField;
            this.valuesSetField = valuesSetField;
            this.someField = someField;
            this.anotherField = anotherField;
        }

        public ImmutableStructWithFieldConstructorAndCollections(final int someField, final int anotherField) {
            this.someField = someField;
            this.anotherField = anotherField;
            this.nullableListField = null;
            this.emptyListField = new ArrayList<>();
            this.valuesListField = new ArrayList<>(Arrays.asList(1, 2, 3));
            this.nullableMapField = null;
            this.emptyMapField = new HashMap<>();
            this.valuesMapField = new HashMapBuilder<Integer, String>().put(9, "baz").put(27, "bar").build();
            this.nullableSetField = null;
            this.emptySetField = new HashSet<>();
            this.valuesSetField = new HashSet<>(Arrays.asList("bar", "baz"));
        }


    }



}

