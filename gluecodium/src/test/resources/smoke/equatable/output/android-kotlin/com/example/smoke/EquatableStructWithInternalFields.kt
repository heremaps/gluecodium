/*

 *
 */

@file:JvmName("EquatableStructWithInternalFieldsExtensions")

package com.example.smoke


class EquatableStructWithInternalFields {
    @JvmField var publicField: String
    @JvmField internal var internalField: String
    @JvmField internal var internalListField: List<String>
    @JvmField internal var internalMapField: Map<String, String>
    @JvmField internal var internalSetField: Set<String>



    internal constructor(publicField: String, internalField: String, internalListField: List<String>, internalMapField: Map<String, String>, internalSetField: Set<String>) {
        this.publicField = publicField
        this.internalField = internalField
        this.internalListField = internalListField
        this.internalMapField = internalMapField
        this.internalSetField = internalSetField
    }

    override fun equals(other: Any?) : Boolean {
        if (other === this) {
            return true
        }

        if (other !is EquatableStructWithInternalFields) {
            return false
        }

        return java.util.Objects.equals(this.publicField, other.publicField) &&
               java.util.Objects.equals(this.internalField, other.internalField) &&
               java.util.Objects.equals(this.internalListField, other.internalListField) &&
               java.util.Objects.equals(this.internalMapField, other.internalMapField) &&
               java.util.Objects.equals(this.internalSetField, other.internalSetField)
    }

    override fun hashCode(): Int {
        var hash: Int = 7
        hash = 31 * hash + this.publicField.hashCode()
        hash = 31 * hash + this.internalField.hashCode()
        hash = 31 * hash + this.internalListField.hashCode()
        hash = 31 * hash + this.internalMapField.hashCode()
        hash = 31 * hash + this.internalSetField.hashCode()
        return hash
    }





}

