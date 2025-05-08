/*

 *
 */

@file:JvmName("EquatableClass")

package com.example.smoke

import com.example.NativeBase

class EquatableClass : NativeBase {

    class EquatableStruct {
        var intField: Int
        var stringField: String
        var nestedEquatableInstance: EquatableClass
        var nestedPointerEquatableInstance: PointerEquatableClass



        constructor(intField: Int, stringField: String, nestedEquatableInstance: EquatableClass, nestedPointerEquatableInstance: PointerEquatableClass) {
            this.intField = intField
            this.stringField = stringField
            this.nestedEquatableInstance = nestedEquatableInstance
            this.nestedPointerEquatableInstance = nestedPointerEquatableInstance
        }

        override fun equals(obj: Any?) : Boolean {
            if (obj === this) {
                return true
            }

            if (obj !is EquatableStruct) {
                return false
            }

            val other = obj as EquatableStruct
            return this.intField == other.intField &&
                   java.util.Objects.equals(this.stringField, other.stringField) &&
                   java.util.Objects.equals(this.nestedEquatableInstance, other.nestedEquatableInstance) &&
                   java.util.Objects.equals(this.nestedPointerEquatableInstance, other.nestedPointerEquatableInstance)
        }

        override fun hashCode(): Int {
            var hash: Int = 7
            hash = 31 * hash + this.intField
            hash = 31 * hash + this.stringField.hashCode()
            hash = 31 * hash + this.nestedEquatableInstance.hashCode()
            hash = 31 * hash + this.nestedPointerEquatableInstance.hashCode()
            return hash
        }





    }



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    override external fun equals(obj: Any?) : Boolean
    override external fun hashCode(): Int






    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
