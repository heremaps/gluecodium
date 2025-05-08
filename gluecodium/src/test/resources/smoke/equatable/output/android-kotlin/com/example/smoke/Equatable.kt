/*

 *
 */

@file:JvmName("Equatable")

package com.example.smoke


class Equatable {

    enum class SomeEnum(private val value: Int) {
        FOO(0),
        BAR(1);
    }
    class EquatableStruct {
        var boolField: Boolean
        var intField: Int
        var longField: Long
        var floatField: Float
        var doubleField: Double
        var stringField: String
        var structField: Equatable.NestedEquatableStruct
        var enumField: Equatable.SomeEnum
        var arrayField: MutableList<String>
        var mapField: MutableMap<Int, String>



        constructor(boolField: Boolean, intField: Int, longField: Long, floatField: Float, doubleField: Double, stringField: String, structField: Equatable.NestedEquatableStruct, enumField: Equatable.SomeEnum, arrayField: MutableList<String>, mapField: MutableMap<Int, String>) {
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

        override fun equals(obj: Any?) : Boolean {
            if (obj === this) {
                return true
            }

            if (obj !is EquatableStruct) {
                return false
            }

            val other = obj as EquatableStruct
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
        var boolField: Boolean?
        var intField: Int?
        var uintField: Int?
        var floatField: Float?
        var stringField: String?
        var structField: Equatable.NestedEquatableStruct?
        var enumField: Equatable.SomeEnum?
        var arrayField: MutableList<String>?
        var mapField: MutableMap<Int, String>?



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

        override fun equals(obj: Any?) : Boolean {
            if (obj === this) {
                return true
            }

            if (obj !is EquatableNullableStruct) {
                return false
            }

            val other = obj as EquatableNullableStruct
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
        var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }

        override fun equals(obj: Any?) : Boolean {
            if (obj === this) {
                return true
            }

            if (obj !is NestedEquatableStruct) {
                return false
            }

            val other = obj as NestedEquatableStruct
            return java.util.Objects.equals(this.fooField, other.fooField)
        }

        override fun hashCode(): Int {
            var hash: Int = 7
            hash = 31 * hash + this.fooField.hashCode()
            return hash
        }





    }








}

