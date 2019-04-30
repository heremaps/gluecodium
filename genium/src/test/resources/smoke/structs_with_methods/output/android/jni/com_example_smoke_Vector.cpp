/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/StructsWithMethods.h"
#include "com_example_smoke_Vector.h"
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
jdouble
Java_com_example_smoke_Vector_distanceTo(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto _ninstance = ::genium::jni::convert_from_jni(_jenv,
        ::genium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::Vector*)nullptr);
    auto result = _ninstance.distance_to(other);
    return result;
}
jobject
Java_com_example_smoke_Vector_add(JNIEnv* _jenv, jobject _jinstance, jobject jother)
{
    ::smoke::Vector other = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jother),
            (::smoke::Vector*)nullptr);
    auto _ninstance = ::genium::jni::convert_from_jni(_jenv,
        ::genium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::Vector*)nullptr);
    auto result = _ninstance.add(other);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
}
