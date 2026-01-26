/*

 *
 */

@file:JvmName("EquatableExtensions")


package com.example.smoke


class Equatable {

    enum class SomeEnum(@JvmField val value: Int) {
        FOO(0),
        BAR(1);
    }
    class EquatableStruct {
        @JvmField var boolField: Boolean
        @JvmField var intField: Int
        @JvmField var longField: Long
        @JvmField var floatField: Float
        @JvmField var doubleField: Double
        @JvmField var stringField: String
        @JvmField var structField: Equatable.NestedEquatableStruct
        @JvmField var enumField: Equatable.SomeEnum
        @JvmField var arrayField: List<String>
        @JvmField var mapField: Map<Int, String>



        constructor(boolField: Boolean, intField: Int, longField: Long, floatField: Float, doubleField: Double, stringField: String, structField: Equatable.NestedEquatableStruct, enumField: Equatable.SomeEnum, arrayField: List<String>, mapField: Map<Int, String>) {
            this.boolField = boolField
            this.intField = intField
            this.longField = longField
            this.floatField = floatField
            this.doubleField = doubleField
            this.stringField = stringField
            this.structField = structField
            this.enumField = enumField
            this.arrayField = arrayField
            this.mapField = mapField
        }

        override fun equals(other: Any?) : Boolean {
            if (other === this) {
                return true
            }

            if (other !is EquatableStruct) {
                return false
            }

            return this.boolField == other.boolField &&
                   this.intField == other.intField &&
                   this.longField == other.longField &&
                   (this.floatField.compareTo(other.floatField) == 0) &&
                   (this.doubleField.compareTo(other.doubleField) == 0) &&
                   java.util.Objects.equals(this.stringField, other.stringField) &&
                   java.util.Objects.equals(this.structField, other.structField) &&
                   java.util.Objects.equals(this.enumField, other.enumField) &&
                   java.util.Objects.equals(this.arrayField, other.arrayField) &&
                   java.util.Objects.equals(this.mapField, other.mapField)
        }

        override fun hashCode(): Int {
            var hash: Int = 7
            hash = 31 * hash + (if(this.boolField) 79 else 97)
            hash = 31 * hash + this.intField
            hash = 31 * hash + (this.longField xor (this.longField ushr 32)).toInt()
            hash = 31 * hash + this.floatField.toBits()
            hash = 31 * hash + (this.doubleField.toBits() xor (this.doubleField.toBits() ushr 32)).toInt()
            hash = 31 * hash + this.stringField.hashCode()
            hash = 31 * hash + this.structField.hashCode()
            hash = 31 * hash + this.enumField.hashCode()
            hash = 31 * hash + this.arrayField.hashCode()
            hash = 31 * hash + this.mapField.hashCode()
            return hash
        }





    }

    class EquatableNullableStruct {
        @JvmField var boolField: Boolean?
        @JvmField var intField: Int?
        @JvmField var uintField: Int?
        @JvmField var floatField: Float?
        @JvmField var stringField: String?
        @JvmField var structField: Equatable.NestedEquatableStruct?
        @JvmField var enumField: Equatable.SomeEnum?
        @JvmField var arrayField: List<String>?
        @JvmField var mapField: Map<Int, String>?



        constructor() {
            this.boolField = null
            this.intField = null
            this.uintField = null
            this.floatField = null
            this.stringField = null
            this.structField = null
            this.enumField = null
            this.arrayField = null
            this.mapField = null
        }

        override fun equals(other: Any?) : Boolean {
            if (other === this) {
                return true
            }

            if (other !is EquatableNullableStruct) {
                return false
            }

            return java.util.Objects.equals(this.boolField, other.boolField) &&
                   java.util.Objects.equals(this.intField, other.intField) &&
                   java.util.Objects.equals(this.uintField, other.uintField) &&
                   java.util.Objects.equals(this.floatField, other.floatField) &&
                   java.util.Objects.equals(this.stringField, other.stringField) &&
                   java.util.Objects.equals(this.structField, other.structField) &&
                   java.util.Objects.equals(this.enumField, other.enumField) &&
                   java.util.Objects.equals(this.arrayField, other.arrayField) &&
                   java.util.Objects.equals(this.mapField, other.mapField)
        }

        override fun hashCode(): Int {
            var hash: Int = 7
            hash = 31 * hash + (this.boolField?.hashCode() ?: 0)
            hash = 31 * hash + (this.intField?.hashCode() ?: 0)
            hash = 31 * hash + (this.uintField?.hashCode() ?: 0)
            hash = 31 * hash + (this.floatField?.hashCode() ?: 0)
            hash = 31 * hash + (this.stringField?.hashCode() ?: 0)
            hash = 31 * hash + (this.structField?.hashCode() ?: 0)
            hash = 31 * hash + (this.enumField?.hashCode() ?: 0)
            hash = 31 * hash + (this.arrayField?.hashCode() ?: 0)
            hash = 31 * hash + (this.mapField?.hashCode() ?: 0)
            return hash
        }





    }

    class NestedEquatableStruct {
        @JvmField var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }

        override fun equals(other: Any?) : Boolean {
            if (other === this) {
                return true
            }

            if (other !is NestedEquatableStruct) {
                return false
            }

            return java.util.Objects.equals(this.fooField, other.fooField)
        }

        override fun hashCode(): Int {
            var hash: Int = 7
            hash = 31 * hash + this.fooField.hashCode()
            return hash
        }





    }








}

