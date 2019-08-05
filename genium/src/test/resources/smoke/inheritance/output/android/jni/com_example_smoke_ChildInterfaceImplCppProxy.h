/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#pragma once
#include <jni.h>
#include "JniReference.h"
#include "smoke/ChildInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_ChildInterfaceImpl.h"
#ifdef __cplusplus
extern "C" {
#endif
namespace smoke {
class ChildInterfaceCppProxy : public ::genium::jni::CppProxyBase, public ChildInterface {
public:
    ChildInterfaceCppProxy( JNIEnv* _jenv, ::genium::jni::JniReference<jobject> globalRef, jint _jHashCode );
    void root_method(  ) override;
    ::std::string get_root_attribute(  ) const override;
    void set_root_attribute( const ::std::string& nvalue ) override;
    void child_method(  ) override;
};
}
#ifdef __cplusplus
}
#endif
