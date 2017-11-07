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

#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>

namespace here
{
namespace internal
{

class CppProxyBase
{
public:

    template< typename ResultType, typename ImplType >
    static void createProxy( JNIEnv* jenv, jobject jobj, ::std::shared_ptr< ResultType >& result )
    {
        jobject jGlobalRef = jenv->NewGlobalRef( jobj );
        jint jHashCode = getHashCode( jenv, jobj );
        ProxyCacheKey key{ jenv, jGlobalRef, jHashCode };

        ::std::lock_guard< ::std::mutex > lock( sCacheMutex );
        auto iterator = sProxyCache.find( key );
        if ( iterator != sProxyCache.end( ) )
        {
            auto cachedProxy = iterator->second.lock( );
            if ( cachedProxy )
            {
                jenv->DeleteGlobalRef( jGlobalRef );
                result = ::std::static_pointer_cast< ImplType >( cachedProxy );
                return;
            }
        }

        auto newProxy = ::std::make_shared< ImplType >( jenv, jGlobalRef, jHashCode );
        result = newProxy;
        sProxyCache[key] = ::std::weak_ptr< ImplType >( newProxy );
    }

protected:

    CppProxyBase( JNIEnv* jenv, jobject jGlobalRef, jint jHashCode );

    virtual ~CppProxyBase( );

    void callJavaMethod( const ::std::string& methodName,
                         const ::std::string& jniSignature,
                         JNIEnv* jniEnv,
                         ... ) const;

    bool getJniEnvironment( JNIEnv** jniEnv ) const;

private:

    struct ProxyCacheKey
    {
        JNIEnv* jniEnv;
        jobject jObject;
        jint jHashCode;

        bool operator==( const ProxyCacheKey& other ) const;
    };

    struct ProxyCacheKeyHash
    {
        inline size_t operator( )( const ProxyCacheKey& key ) const
        {
            return key.jHashCode;
        }
    };

    using ProxyCache
        = ::std::unordered_map< ProxyCacheKey, ::std::weak_ptr< CppProxyBase >, ProxyCacheKeyHash >;

    static jint getHashCode( JNIEnv* jniEnv, jobject jObj );

    jobject jGlobalRef;
    jint jHashCode;

protected:

    JavaVM* jVM;

    static ProxyCache sProxyCache;
    static ::std::mutex sCacheMutex;
};

} // namespace internal
} // namespace here
