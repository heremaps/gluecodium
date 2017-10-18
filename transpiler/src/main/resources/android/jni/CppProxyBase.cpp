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

namespace
{

inline void
callJavaMethodVaList( JNIEnv* jniEnv, jobject jObj, jmethodID jmid, va_list iParams )
{
    jniEnv->CallVoidMethodV( jObj, jmid, iParams );
}

inline bool
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

}

namespace here
{
namespace internal
{

CppProxyBase::ProxyCache CppProxyBase::sProxyCache{ };
::std::mutex CppProxyBase::sCacheMutex{ };

void
CppProxyBase::callJavaMethod(
    const ::std::string& methodName, const ::std::string& jniSignature, ... ) const
{
    JNIEnv* jniEnv;
    bool attachedToThread = getJniEnvironment( jVM, &jniEnv );
    jmethodID jmethodId = jniEnv->GetMethodID( jClass, methodName.c_str( ), jniSignature.c_str( ) );
    va_list vaList;
    va_start( vaList, jniSignature );
    ::callJavaMethodVaList( jniEnv, jGlobalRef, jmethodId, vaList );
    va_end( vaList );
    if ( attachedToThread )
    {
        jVM->DetachCurrentThread( );
    }
}

CppProxyBase::CppProxyBase( JNIEnv* jenv, jobject jGlobalRef, jint jHashCode )
    : jGlobalRef( jGlobalRef )
    , jHashCode( jHashCode )
{
    jclass tmp = jenv->GetObjectClass( jGlobalRef );
    jClass = static_cast< jclass >( jenv->NewGlobalRef( tmp ) );
    jenv->GetJavaVM( &jVM );
}

CppProxyBase::~CppProxyBase( )
{
    JNIEnv* jniEnv;
    bool attachedToThread = getJniEnvironment( jVM, &jniEnv );

    {
        ::std::lock_guard< std::mutex > lock( sCacheMutex );
        sProxyCache.erase( ProxyCacheKey{ jniEnv, jGlobalRef, jHashCode } );
    }

    jniEnv->DeleteGlobalRef( jGlobalRef );
    jniEnv->DeleteGlobalRef( jClass );
    if ( attachedToThread )
    {
        jVM->DetachCurrentThread( );
    }
}

bool
CppProxyBase::ProxyCacheKey::operator==( const CppProxyBase::ProxyCacheKey& other ) const
{
    return jHashCode == other.jHashCode && jniEnv->IsSameObject( jObject, other.jObject );
}

jint
CppProxyBase::getHashCode( JNIEnv* jniEnv, jobject jObj )
{
    static jclass jClass = jniEnv->FindClass( "java/lang/System" );
    static jmethodID jMethodId = jniEnv->GetStaticMethodID(
        jClass, "identityHashCode", "(Ljava/lang/Object;)I" );
    return jniEnv->CallStaticIntMethod( jClass, jMethodId, jObj );
}

}
}
