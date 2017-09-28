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
callJavaMethodVaList( JNIEnv* jniEnv, jobject jObj, jmethodID jmid, va_list iParams )
{
    jniEnv->CallVoidMethodV( jObj, jmid, iParams );
}

static inline bool
getJniEnvironment( JavaVM* jVM, JNIEnv** jniEnv )
{
    int envState = jVM->GetEnv( reinterpret_cast< void** >( jniEnv ), JNI_VERSION_1_6 );
    if ( envState == JNI_EDETACHED )
    {
#ifdef __ANDROID__
        jVM->AttachCurrentThread( jniEnv, nullptr );
#else  // ifdef __ANDROID__
        jVM->AttachCurrentThread( reinterpret_cast< void** >( jniEnv ), nullptr );
#endif // ifdef __ANDROID__
        return true;
    }

    return false;
}

void::here::internal::CppProxyBase::callJavaMethod( ::std::string methodName,
                                                        ::std::string jniSignature,
                                                    ... ) const
{
    JNIEnv* jniEnv;
    bool attachedToThread = getJniEnvironment(jVM, &jniEnv );
    jmethodID jmethodId = jniEnv->GetMethodID( jClass, methodName.c_str( ), jniSignature.c_str( ) );
    va_list vaList;
    va_start( vaList, jniSignature );
    ::callJavaMethodVaList( jniEnv, jObject, jmethodId, vaList );
    va_end( vaList );
    if ( attachedToThread )
    {
        jVM->DetachCurrentThread( );
    }
}

::here::internal::CppProxyBase::CppProxyBase( JNIEnv* jenv, jobject jobj )
{
    jObject = jenv->NewGlobalRef( jobj );
    jclass tmp = jenv->GetObjectClass( jObject );
    jClass = static_cast< jclass >( jenv->NewGlobalRef( tmp ) );
    jint rs = jenv->GetJavaVM( &jVM );
}

::here::internal::CppProxyBase::~CppProxyBase( )
{
    JNIEnv* jniEnv;
    bool attachedToThread = getJniEnvironment( jVM, &jniEnv );
    jniEnv->DeleteGlobalRef( jObject );
    jniEnv->DeleteGlobalRef( jClass );
    if ( attachedToThread )
    {
        jVM->DetachCurrentThread( );
    }
}
