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

#pragma once

#include <jni.h>
#include <string>

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

namespace here
{
namespace internal
{

class CppProxyBase
{

protected:

    CppProxyBase( JNIEnv* jenv, jobject jobj );

    virtual ~CppProxyBase( );

    void callJavaMethod( ::std::string methodName, ::std::string jniSignature, ... ) const;

private:

    jobject jObject;
    jclass jClass;

private:

    JavaVM* jVM;
};

} // namespace internal
} // namespace here

#ifdef __cplusplus
}
#endif // ifdef __cplusplus
