/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

#pragma once

#include <jni.h>
#include "smoke/InheritanceChild.h"
#include "com_example_smoke_InheritanceChildImpl.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"

#ifdef __cplusplus
extern "C" {
#endif

namespace smoke {

class InheritanceChildCppProxy : public transpiler::jni::CppProxyBase, public InheritanceChild {
public:
    InheritanceChildCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode );
    void root_method(  ) override;
    ::std::string get_root_attribute(  ) override;
    void set_root_attribute( const ::std::string& nvalue ) override;
    void child_method(  ) override;
};

}

#ifdef __cplusplus
}
#endif