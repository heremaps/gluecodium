/*
 *
 */
#pragma once
#include "smoke/ErrorsInterface.h"
#include "CppProxyBase.h"
#include "JniReference.h"
namespace gluecodium
{
namespace jni
{
class com_example_smoke_ErrorsInterfaceImpl_CppProxy : public CppProxyBase, public ::smoke::ErrorsInterface {
public:
    com_example_smoke_ErrorsInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    ::std::error_code method_with_errors(  ) override;
    ::std::error_code method_with_external_errors(  ) override;
    ::gluecodium::Return< ::std::string, ::std::error_code > method_with_errors_and_return_value(  ) override;
    ::gluecodium::Return< void, ::smoke::Payload > method_with_payload_error(  ) override;
    ::gluecodium::Return< ::std::string, ::smoke::Payload > method_with_payload_error_and_return_value(  ) override;
};
}
}
