/*
 *
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
namespace gluecodium
{
namespace jni
{
class ErrorsInterfaceImpl_CppProxy : public CppProxyBase, public ::smoke::ErrorsInterface {
public:
    ErrorsInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    ::std::error_code method_with_errors(  ) override;
    ::std::error_code method_with_external_errors(  ) override;
    ::gluecodium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value(  ) override;
};
}
}
