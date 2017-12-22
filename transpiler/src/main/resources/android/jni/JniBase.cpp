// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "JniBase.h"

namespace
{
static JavaVM* jvm;

}  // namespace

// JNI_OnLoad() gets automatically called by java vm while loading the library.
// To make this work neither 'static' keyword (causes "static declaration of 'JNI_OnLoad' follows
// non-static declaration" - error) nor adding to anonymous namespace (prevents method from being
// called) is allowed.
jint
JNI_OnLoad( JavaVM* vm, void* )
{
    JNIEnv* env = nullptr;
    if ( vm->GetEnv( (void**)&env, JNI_VERSION_1_6 ) != JNI_OK )
    {
        return 0;
    }

    jvm = vm;
    return JNI_VERSION_1_6;
}

namespace here
{
namespace internal
{
namespace jni
{
JavaVM*
get_java_vm( )
{
    return jvm;
}

}  // namespace jni
}  // namespace internal
}  // namespace here
