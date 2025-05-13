/*

 *
 */

@file:JvmName("SimpleEquatableStruct")

package com.example.smoke


class SimpleEquatableStruct {
    @JvmField var classField: NonEquatableClass
    @JvmField var interfaceField: NonEquatableInterface
    @JvmField var nullableClassField: NonEquatableClass?
    @JvmField var nullableInterfaceField: NonEquatableInterface?



    constructor(classField: NonEquatableClass, interfaceField: NonEquatableInterface) {
        this.classField = classField
        this.interfaceField = interfaceField
        this.nullableClassField = null
        this.nullableInterfaceField = null
    }

    override fun equals(other: Any?) : Boolean {
        if (other === this) {
            return true
        }

        if (other !is SimpleEquatableStruct) {
            return false
        }

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

