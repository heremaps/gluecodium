/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#pragma once
#include <jni.h>
#include "JniReference.h"
#include "smoke/ErrorsInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_ErrorsInterfaceImpl.h"
#ifdef __cplusplus
extern "C" {
#endif
namespace smoke {
class ErrorsInterfaceCppProxy : public ::genium::jni::CppProxyBase, public ErrorsInterface {
public:
    ErrorsInterfaceCppProxy( JNIEnv* _jenv, ::genium::jni::JniReference<jobject> globalRef, jint _jHashCode );
    ::std::error_code method_with_errors(  ) override;
    ::std::error_code method_with_external_errors(  ) override;
    ::genium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value(  ) override;
};
}
#ifdef __cplusplus
}
#endif
