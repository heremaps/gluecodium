/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

#pragma once
#include <jni.h>
#include "smoke/InheritanceGrandchild.h"
#include "com_example_smoke_InheritanceGrandchildImpl.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#ifdef __cplusplus
extern "C" {
#endif
namespace smoke {
class InheritanceGrandchildCppProxy : public genium::jni::CppProxyBase, public InheritanceGrandchild {
public:
    InheritanceGrandchildCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode );
    void root_method(  ) override;
    ::std::string get_root_attribute(  ) override;
    void set_root_attribute( const ::std::string& nvalue ) override;
    void child_method(  ) override;
    void grandchild_method(  ) override;
};
}
#ifdef __cplusplus
}
#endif