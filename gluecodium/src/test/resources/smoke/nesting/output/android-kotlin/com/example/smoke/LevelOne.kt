/*

 *
 */

@file:JvmName("LevelOne")

package com.example.smoke

import com.example.NativeBase

class LevelOne : NativeBase {

    class LevelTwo : NativeBase {

        class LevelThree : NativeBase {

            enum class LevelFourEnum(private val value: Int) {
                NONE(0);
            }
            class LevelFour {
                @JvmField var stringField: String



                constructor(stringField: String) {
                    this.stringField = stringField
                }





                companion object {
                    @JvmField final val FOO: Boolean = false
                    @JvmStatic external fun fooFactory() : LevelOne.LevelTwo.LevelThree.LevelFour
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



            external fun foo(input: OuterClass.InnerInterface) : OuterInterface.InnerClass




            companion object {
                @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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







        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
