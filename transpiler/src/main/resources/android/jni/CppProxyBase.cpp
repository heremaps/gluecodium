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

#include "CppProxyBase.h"

static inline void
callJavaMethodVaList( JNIEnv* _jEnv, jobject _jObj, jmethodID _jmid, va_list iParams )
{
    _jEnv->CallVoidMethodV( _jObj, _jmid, iParams );
}

void::here::internal::CppProxyBase::callJavaMethod( jmethodID _jmid, ... )
{
    va_list vaList;
    va_start( vaList, _jmid );
    ::callJavaMethodVaList( _jEnvironment, _jObject, _jmid, vaList );
    va_end( vaList );
}

::here::internal::CppProxyBase::CppProxyBase( JNIEnv* _jenv, jobject _jobj )
    : _jEnvironment( _jenv )
{
    _jObject = _jEnvironment->NewGlobalRef( _jobj );
    jclass tmp = _jEnvironment->GetObjectClass( _jObject );
    _jClass = static_cast< jclass >( _jEnvironment->NewGlobalRef( tmp ) );
}

::here::internal::CppProxyBase::~CppProxyBase( )
{
    _jEnvironment->DeleteGlobalRef( _jObject );
    _jEnvironment->DeleteGlobalRef( _jClass );
}
