/*
 * Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
/**
* Cpp proxy header for class InheritanceGrandchild
*/
#pragma once
#include <jni.h>
#include "smoke/InheritanceGrandchild.h"
#include "android/jni/com_here_android_smoke_InheritanceGrandchildImpl.h"
#include "android/jni/JniCppConversionUtils.h"
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/CppProxyBase.h"
#include "android/jni/JniBase.h"
#ifdef __cplusplus
extern "C" {
#endif
namespace smoke {
class InheritanceGrandchildCppProxy : public here::internal::CppProxyBase, public InheritanceGrandchild {
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