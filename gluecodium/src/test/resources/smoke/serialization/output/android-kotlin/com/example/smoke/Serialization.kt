/*

 *
 */

package com.example.smoke

import android.os.Parcel
import android.os.Parcelable

class Serialization {

    enum class SomeEnum(private val value: Int) {
        FOO(0),
        BAR(7);
    }
    class SerializableStruct : Parcelable {
        var boolField: Boolean
        var byteField: Byte
        var shortField: Short
        var intField: Int
        var longField: Long
        var floatField: Float
        var doubleField: Double
        var stringField: String
        var structField: Serialization.NestedSerializableStruct
        var byteBufferField: ByteArray
        var arrayField: MutableList<String>
        var structArrayField: MutableList<Serialization.NestedSerializableStruct>
        var mapField: MutableMap<Int, String>
        var setField: MutableSet<String>
        var enumSetField: MutableSet<Serialization.SomeEnum>
        var enumField: Serialization.SomeEnum



        constructor(boolField: Boolean, byteField: Byte, shortField: Short, intField: Int, longField: Long, floatField: Float, doubleField: Double, stringField: String, structField: Serialization.NestedSerializableStruct, byteBufferField: ByteArray, arrayField: MutableList<String>, structArrayField: MutableList<Serialization.NestedSerializableStruct>, mapField: MutableMap<Int, String>, setField: MutableSet<String>, enumSetField: MutableSet<Serialization.SomeEnum>, enumField: Serialization.SomeEnum) {
            this.boolField = boolField
            this.byteField = byteField
            this.shortField = shortField
            this.intField = intField
            this.longField = longField
            this.floatField = floatField
            this.doubleField = doubleField
            this.stringField = stringField
            this.structField = structField
            this.byteBufferField = byteBufferField
            this.arrayField = arrayField
            this.structArrayField = structArrayField
            this.mapField = mapField
            this.setField = setField
            this.enumSetField = enumSetField
            this.enumField = enumField
        }


        private constructor(parcel: Parcel) {
            this.boolField = parcel.readByte().toInt() != 0
            this.byteField = parcel.readByte()
            this.shortField = parcel.readInt().toShort()
            this.intField = parcel.readInt()
            this.longField = parcel.readLong()
            this.floatField = parcel.readFloat()
            this.doubleField = parcel.readDouble()
            this.stringField = parcel.readString()!!
            this.structField = parcel.readParcelable(Thread.currentThread().getContextClassLoader())!!
            this.byteBufferField = parcel.createByteArray()!!
            this.arrayField = arrayListOf()
            parcel.readList(this.arrayField, Thread.currentThread().getContextClassLoader())
            this.structArrayField = arrayListOf()
            parcel.readList(this.structArrayField, Thread.currentThread().getContextClassLoader())
            this.mapField = hashMapOf()
            parcel.readMap(this.mapField, Thread.currentThread().getContextClassLoader())
            var __setField = arrayListOf<String>()
            parcel.readList(__setField, Thread.currentThread().getContextClassLoader())
            this.setField = __setField.toMutableSet()
            var __enumSetField = arrayListOf<Serialization.SomeEnum>()
            parcel.readList(__enumSetField, Thread.currentThread().getContextClassLoader())
            this.enumSetField = __enumSetField.toMutableSet()
            this.enumField = Serialization.SomeEnum.values()[parcel.readInt()]!!
        }

        override fun describeContents() = 0

        override fun writeToParcel(parcel: Parcel, flags: Int) {
            parcel.writeByte((if(boolField) 1 else 0).toByte())
            parcel.writeByte(byteField)
            parcel.writeInt(shortField.toInt())
            parcel.writeInt(intField)
            parcel.writeLong(longField)
            parcel.writeFloat(floatField)
            parcel.writeDouble(doubleField)
            parcel.writeString(stringField)
            parcel.writeParcelable(structField, 0)
            parcel.writeByteArray(byteBufferField)
            parcel.writeList(arrayField)
            parcel.writeList(structArrayField)
            parcel.writeMap(mapField)
            parcel.writeList(setField.toList())
            parcel.writeList(enumSetField.toList())
            parcel.writeInt(enumField.ordinal)
        }




        companion object {
            @JvmField
            val CREATOR = object : Parcelable.Creator<SerializableStruct> {
                override fun createFromParcel(parcel: Parcel) = SerializableStruct(parcel)
                override fun newArray(size: Int) = arrayOfNulls<SerializableStruct?>(size)
            }

        }
    }

    class NestedSerializableStruct : Parcelable {
        var someField: String



        constructor(someField: String) {
            this.someField = someField
        }


        private constructor(parcel: Parcel) {
            this.someField = parcel.readString()!!
        }

        override fun describeContents() = 0

        override fun writeToParcel(parcel: Parcel, flags: Int) {
            parcel.writeString(someField)
        }




        companion object {
            @JvmField
            val CREATOR = object : Parcelable.Creator<NestedSerializableStruct> {
                override fun createFromParcel(parcel: Parcel) = NestedSerializableStruct(parcel)
                override fun newArray(size: Int) = arrayOfNulls<NestedSerializableStruct?>(size)
            }

        }
    }







}

