/*

 *
 */

@file:JvmName("InternalClassWithNestedElementsExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This is a class, which contains multiple nested elements.
 * It has internal visibility because 'Internal' is used.
 * Each element inside should be treated as internal.
 */
internal class InternalClassWithNestedElements : NativeBase {

    /**
     * This is an enumeration nested in internal class.
     * It should be annotated as internal.
     * Its value field should be synthetic to disallow accessing it from Java.
     */
    internal enum class NestedEnum(@JvmField @JvmSynthetic internal val value: Int) {
        OPTION_1(0),
        OPTION_2(1);
    }
    /**
     * This is an exception nested in internal class.
     * It should be annotated as internal.
     * Its error field should be internal and synthetic to disallow accessing it from Java.
     */
    internal class NestedExceptionException(@JvmField val error: InternalClassWithNestedElements.NestedEnum) : Exception(error.toString())


    /**
     * This is a structure nested in internal class.
     * It should be annotated as internal.
     * Its fields should be internal and synthetic.
     * Its functions should be internal and synthetic.
     * Its constructors should be internal (sadly, they cannot be synthetic).
     */
    internal class NestedStruct {
        /**
         * This is a field of structure, which is nested in internal class.
         * It should use 'internal' and synthetic.
         */
        @JvmField @JvmSynthetic internal var firstField: Int
        /**
         * This is a field of structure, which is nested in internal class.
         * It should use 'internal' and synthetic.
         */
        @JvmField @JvmSynthetic internal var secondField: String


        /**
         * This is a constructor of structure, and the structure is nested in internal class.
         * It should be explicitly annotated as internal.
         * Unfortunately, it cannot use synthetic, because constructor is not allowed target.
         * @param x
         * @param y
         */


       internal constructor(x: Int, y: Int) {
            val _other = constructorOfStruct(x, y)
            this.firstField = _other.firstField
            this.secondField = _other.secondField
        }

        /**
         * This is a field constructor of structure. The structure is nested in internal class.
         * It should be explicitly internal. Sadly, it cannot be synthetic.
         * @param firstField This is a field of structure, which is nested in internal class.
         * It should use 'internal' and synthetic.
         * @param secondField This is a field of structure, which is nested in internal class.
         * It should use 'internal' and synthetic.
         */

        internal constructor(firstField: Int, secondField: String) {
            this.firstField = firstField
            this.secondField = secondField
        }



        /**
         * This is a function in structure nested inside internal class.
         * It should be explicitly annotated as internal.
         * And use synthetic annotation to hide it from Java.
         * @return
         */

        @JvmSynthetic @JvmName("nestedStructFunction") internal external fun nestedStructFunction() : Double


        companion object {

            @JvmStatic @JvmSynthetic @JvmName("constructorOfStruct") private external fun constructorOfStruct(x: Int, y: Int) : NestedStruct
            /**
             * This is a static function in structure nested in internal class.
             * It should be explicitly annotated as internal.
             * And use synthetic annotation to hide it from Java.
             * @return
             */

            @JvmStatic @JvmSynthetic @JvmName("nestedStructStaticFunction") internal external fun nestedStructStaticFunction() : String
        }
    }

    /**
     * This is a class nested inside internal class.
     * It should be generated with explicit 'internal' keyword.
     * Each element nested inside this class should also have explicit internal visibility.
     */
    internal class NestedClassLevelOne : NativeBase {

        /**
         * This is a class nested inside class, that is nested in internal class.
         * It should be generated with explicit 'internal' keyword.
         * Each element nested inside this class should also have explicit internal visibility.
         */
        internal class NestedClassLevelTwo : NativeBase {


            /**
             * This is a constructor of class, that is nested in class, that is nested in internal class.
             * It should be explicitly annotated as internal.
             * Unfortunately, it cannot use synthetic, because constructor is not allowed target.
             * @param x
             * @param y
             */

            internal constructor(x: Int, y: Int) : this(doubleNestedConstructor(x, y), null as Any?) {
                cacheThisInstance();
            }

            /**
             * For internal use only.
             * @suppress
             * @param nativeHandle The handle to resources on C++ side.
             * @param tag Tag used by callers to avoid overload resolution problems.
             */
            protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
                : super(nativeHandle, { disposeNativeHandle(it) }) {}

            private external fun cacheThisInstance()


            /**
             * This is a function in class, that is nested in class, that is nested in internal class.
             * It should be explicitly annotated as internal.
             * And use synthetic annotation to hide it from Java.
             * @return
             */

            @JvmSynthetic @JvmName("doubleNestedFunction") internal external fun doubleNestedFunction() : Double

            /**
             * This is a property in class, that is nested in class, that is nested in internal class.
             * It should be explicitly annotated as internal.
             * And use synthetic for get/set functions to hide them from Java.
             */
            internal var doubleNestedProperty: Long
                @JvmSynthetic @JvmName("getDoubleNestedProperty") external get
                @JvmSynthetic @JvmName("setDoubleNestedProperty") external set




            companion object {
                @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

                @JvmStatic @JvmSynthetic @JvmName("doubleNestedConstructor") private external fun doubleNestedConstructor(x: Int, y: Int) : Long
                /**
                 * This is a static function in class, that is nested in class, that is nested in internal class.
                 * It should be explicitly annotated as internal.
                 * And use synthetic annotation to hide it from Java.
                 * @return
                 */

                @JvmStatic @JvmSynthetic @JvmName("doubleNestedStaticFunction") internal external fun doubleNestedStaticFunction() : String
                /**
                 *
                 * @return This is a static property in class, that is nested in class, that is nested in internal class.
                 *     It is represented as static get/set functions pair.
                 *     They should be explicitly annotated as internal and use JvmStatic to hide them from Java.
                 */

                @JvmStatic @JvmSynthetic @JvmName("getDoubleNestedStaticProperty") internal external fun getDoubleNestedStaticProperty() : Long/**
                 *
                 * @param value This is a static property in class, that is nested in class, that is nested in internal class.
                 *     It is represented as static get/set functions pair.
                 *     They should be explicitly annotated as internal and use JvmStatic to hide them from Java.
                 */

                @JvmStatic @JvmSynthetic @JvmName("setDoubleNestedStaticProperty") internal external fun setDoubleNestedStaticProperty(value: Long) : Unit
            }
        }


        /**
         * This is a constructor of class nested in internal class.
         * It should be explicitly annotated as internal.
         * Unfortunately, it cannot use synthetic, because constructor is not allowed target.
         * @param x
         * @param y
         */

        internal constructor(x: Int, y: Int) : this(someNestedConstructor(x, y), null as Any?) {
            cacheThisInstance();
        }

        /**
         * For internal use only.
         * @suppress
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        private external fun cacheThisInstance()


        /**
         * This is a function in class nested inside internal class.
         * It should be explicitly annotated as internal.
         * And use synthetic annotation to hide it from Java.
         * @return
         */

        @JvmSynthetic @JvmName("someNestedFunction") internal external fun someNestedFunction() : Double

        /**
         * This is a property in class nested in internal class.
         * It should be explicitly annotated as internal.
         * And use synthetic for get/set functions to hide them from Java.
         */
        internal var someNestedProperty: Long
            @JvmSynthetic @JvmName("getSomeNestedProperty") external get
            @JvmSynthetic @JvmName("setSomeNestedProperty") external set




        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

            @JvmStatic @JvmSynthetic @JvmName("someNestedConstructor") private external fun someNestedConstructor(x: Int, y: Int) : Long
            /**
             * This is a static function in class nested in internal class.
             * It should be explicitly annotated as internal.
             * And use synthetic annotation to hide it from Java.
             * @return
             */

            @JvmStatic @JvmSynthetic @JvmName("someNestedStaticFunction") internal external fun someNestedStaticFunction() : String
            /**
             *
             * @return This is a static property in class nested in internal class.
             *     It is represented as static get/set functions pair.
             *     They should be explicitly annotated as internal and use JvmStatic to hide them from Java.
             */

            @JvmStatic @JvmSynthetic @JvmName("getSomeNestedStaticProperty") internal external fun getSomeNestedStaticProperty() : Long/**
             *
             * @param value This is a static property in class nested in internal class.
             *     It is represented as static get/set functions pair.
             *     They should be explicitly annotated as internal and use JvmStatic to hide them from Java.
             */

            @JvmStatic @JvmSynthetic @JvmName("setSomeNestedStaticProperty") internal external fun setSomeNestedStaticProperty(value: Long) : Unit
        }
    }

    /**
     * This is an interface nested in internal class.
     * It should be annotated as internal.
     * Its fields should be synthetic --> sadly, Kotlin does not allow 'internal' keyword in interfaces.
     * But from Kotlin language POV elements are not accessible, because interface itself is internal.
     * The elements should not be accessible in Java because of synthetic attribute.
     */
    internal interface NestedInterface {

        /**
         * This is a function in interface nested inside internal class.
         * It must use synthetic annotation.
         * Sadly, it cannot use 'internal' keyword.
         * @return
         */

        @JvmSynthetic fun nestedInterfaceFunction() : Double

        /**
         * This is a property in interface nested in internal class.
         * It must use synthetic annotation for get/set functions.
         * Sadly, it cannot use 'internal' keyword.
         */
        var nestedInterfaceProperty: Long
            @JvmSynthetic get
            @JvmSynthetic set


        companion object {
            /**
             * This is a static function in interface nested in internal class.
             * Sadly, it cannot use 'internal' keyword.
             * @return
             */

            @JvmStatic @JvmSynthetic fun nestedInterfaceStaticFunction() : String {
                return NestedInterfaceImpl.nestedInterfaceStaticFunction()
            }

            /**
             *
             * @return This is a static property in class nested in internal class.
             *     It must use synthetic annotation for get/set functions.
             *     Sadly, it cannot use 'internal' keyword.
             */

            @JvmStatic @JvmSynthetic fun getNestedInterfaceStaticProperty() : Long {
                return NestedInterfaceImpl.getNestedInterfaceStaticProperty()
            }

            /**
             *
             * @param value This is a static property in class nested in internal class.
             *     It must use synthetic annotation for get/set functions.
             *     Sadly, it cannot use 'internal' keyword.
             */

            @JvmStatic @JvmSynthetic fun setNestedInterfaceStaticProperty(value: Long) : Unit {
                NestedInterfaceImpl.setNestedInterfaceStaticProperty(value)
            }

        }
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class NestedInterfaceImpl : NativeBase, NestedInterface {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * This is a function in interface nested inside internal class.
         * It must use synthetic annotation.
         * Sadly, it cannot use 'internal' keyword.
         * @return
         */

        @JvmSynthetic override external fun nestedInterfaceFunction() : Double

        /**
         * This is a property in interface nested in internal class.
         * It must use synthetic annotation for get/set functions.
         * Sadly, it cannot use 'internal' keyword.
         */
        override var nestedInterfaceProperty: Long
            @JvmSynthetic external get
            @JvmSynthetic external set



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
            /**
             * This is a static function in interface nested in internal class.
             * Sadly, it cannot use 'internal' keyword.
             * @return
             */

            @JvmStatic @JvmSynthetic external fun nestedInterfaceStaticFunction() : String
            /**
             *
             * @return This is a static property in class nested in internal class.
             *     It must use synthetic annotation for get/set functions.
             *     Sadly, it cannot use 'internal' keyword.
             */

            @JvmStatic @JvmSynthetic @JvmName("getNestedInterfaceStaticProperty") internal external fun getNestedInterfaceStaticProperty() : Long/**
             *
             * @param value This is a static property in class nested in internal class.
             *     It must use synthetic annotation for get/set functions.
             *     Sadly, it cannot use 'internal' keyword.
             */

            @JvmStatic @JvmSynthetic @JvmName("setNestedInterfaceStaticProperty") internal external fun setNestedInterfaceStaticProperty(value: Long) : Unit
        }
    }
    /**
     * This is a lambda nested in internal class.
     * It should be annotated as internal.
     * Its 'call()' function should be synthetic to disallow accessing it from Java.
     */
    internal fun interface NestedLambda {
        /**
         * This is a lambda nested in internal class.
         * It should be annotated as internal.
         * Its 'call()' function should be synthetic to disallow accessing it from Java.
         */

        @JvmSynthetic fun apply() : Unit
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class NestedLambdaImpl : NativeBase, NestedLambda {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * This is a lambda nested in internal class.
         * It should be annotated as internal.
         * Its 'call()' function should be synthetic to disallow accessing it from Java.
         */

        @JvmSynthetic override external fun apply() : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }

    /**
     * This is a constructor in internal class. It should be explicitly annotated as internal.
     * Unfortunately, it cannot use synthetic, because constructor is not allowed target.
     * @param x
     * @param y
     */

    internal constructor(x: Int, y: Int) : this(someConstructor(x, y), null as Any?) {
        cacheThisInstance();
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()


    /**
     * This is a function in internal class. It should be explicitly annotated as internal.
     * And use synthetic annotation to hide it from Java.
     * @return
     */

    @JvmSynthetic @JvmName("someFunction") internal external fun someFunction() : Double

    /**
     * This is a property in internal class. It should be explicitly annotated as internal.
     * And use synthetic for get/set functions to hide them from Java.
     */
    internal var someProperty: Long
        @JvmSynthetic @JvmName("getSomeProperty") external get
        @JvmSynthetic @JvmName("setSomeProperty") external set




    companion object {
        /**
         * This is a constant nested in internal class.
         * It should be generated as internal and synthetic.
         */
        @JvmSynthetic internal @JvmField final val SOME_CONSTANT: Int = 2026
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic @JvmSynthetic @JvmName("someConstructor") private external fun someConstructor(x: Int, y: Int) : Long
        /**
         * This is a static function in internal class. It should be explicitly annotated as internal.
         * And use synthetic annotation to hide it from Java.
         * @return
         */

        @JvmStatic @JvmSynthetic @JvmName("someStaticFunction") internal external fun someStaticFunction() : String
        /**
         *
         * @return This is a static property in internal class.
         *     It is represented as static get/set functions pair.
         *     They should be explicitly annotated as internal and use JvmStatic to hide them from Java.
         */

        @JvmStatic @JvmSynthetic @JvmName("getSomeStaticProperty") internal external fun getSomeStaticProperty() : Long/**
         *
         * @param value This is a static property in internal class.
         *     It is represented as static get/set functions pair.
         *     They should be explicitly annotated as internal and use JvmStatic to hide them from Java.
         */

        @JvmStatic @JvmSynthetic @JvmName("setSomeStaticProperty") internal external fun setSomeStaticProperty(value: Long) : Unit
    }
}

