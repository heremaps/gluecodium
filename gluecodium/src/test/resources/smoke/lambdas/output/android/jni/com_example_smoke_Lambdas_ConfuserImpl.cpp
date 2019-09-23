/*
 *
 */
#include "smoke/Lambdas.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Lambdas_ConfuserImpl.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jobject
Java_com_example_smoke_Lambdas_00024ConfuserImpl_apply(JNIEnv* _jenv, jobject _jinstance, jstring jp0)
{
    ::std::string p0 = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jp0),
            (::std::string*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<::smoke::Lambdas::Confuser*>(
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)(p0);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Lambdas_00024ConfuserImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<::smoke::Lambdas::Confuser*>(_jpointerRef);
}
}
