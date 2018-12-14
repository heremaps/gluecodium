/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "foo/Bar.h"
#include "com_example_smoke_VeryExternalInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniReference.h"
extern "C" {
void
Java_com_example_smoke_VeryExternalInterface_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter)
{
    int8_t someParameter = jsomeParameter;
    auto pointerAsLong = genium::jni::get_long_field(_jenv,
            genium::jni::get_object_class(_jenv, _jinstance),
            genium::jni::make_local_ref(_jenv, _jinstance),
            "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (pointerAsLong);
    (*pInstanceSharedPointer)->some_Method(someParameter);
}
jstring
Java_com_example_smoke_VeryExternalInterface_getSomeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pointerAsLong = genium::jni::get_long_field(_jenv,
            genium::jni::get_object_class(_jenv, _jinstance),
            genium::jni::make_local_ref(_jenv, _jinstance),
            "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->get_Me();
    return genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_VeryExternalInterface_setSomeAttribute(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)
{
    ::std::string value = genium::jni::convert_from_jni( _jenv, genium::jni::make_local_ref(_jenv, jvalue), (::std::string*)nullptr );
    auto pointerAsLong = genium::jni::get_long_field(_jenv,
            genium::jni::get_object_class(_jenv, _jinstance),
            genium::jni::make_local_ref(_jenv, _jinstance),
            "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (pointerAsLong);
    (*pInstanceSharedPointer)->set_Me(value);
}
void
Java_com_example_smoke_VeryExternalInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::fire::Baz>*> (_jpointerRef);
}
}