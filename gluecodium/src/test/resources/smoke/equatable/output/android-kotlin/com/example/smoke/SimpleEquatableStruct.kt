/*

 *
 */

package com.example.smoke


class SimpleEquatableStruct {
    var classField: NonEquatableClass
    var interfaceField: NonEquatableInterface
    var nullableClassField: NonEquatableClass?
    var nullableInterfaceField: NonEquatableInterface?



    constructor(classField: NonEquatableClass, interfaceField: NonEquatableInterface) {
        this.classField = classField
        this.interfaceField = interfaceField
        this.nullableClassField = null
        this.nullableInterfaceField = null
    }

    override fun equals(obj: Any?) : Boolean {
        if (obj === this) {
            return true
        }

        if (obj !is SimpleEquatableStruct) {
            return false
        }

        val other = obj as SimpleEquatableStruct
        return java.util.Objects.equals(this.classField, other.classField) &&
               java.util.Objects.equals(this.interfaceField, other.interfaceField) &&
               java.util.Objects.equals(this.nullableClassField, other.nullableClassField) &&
               java.util.Objects.equals(this.nullableInterfaceField, other.nullableInterfaceField)
    }

    override fun hashCode(): Int {
        var hash: Int = 7
        hash = 31 * hash + this.classField.hashCode()
        hash = 31 * hash + this.interfaceField.hashCode()
        hash = 31 * hash + (this.nullableClassField?.hashCode() ?: 0)
        hash = 31 * hash + (this.nullableInterfaceField?.hashCode() ?: 0)
        return hash
    }



}

