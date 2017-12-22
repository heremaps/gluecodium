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
#include <memory>
#include <mutex>
#include <new>
#include <unordered_map>

template < class ProxyType >
class CachedProxyBase
{
protected:
    CachedProxyBase( ) = default;

public:
    template < class FunctionTable >
    static std::shared_ptr< ProxyType >
    get_proxy( FunctionTable&& function_table )
    {
        const void* key = function_table.swift_pointer;
        std::lock_guard< std::mutex > cache_lock( s_cache_mutex );
        auto cached_weak = s_cache.find( key );
        if ( cached_weak != s_cache.end( ) )
        {
            auto cached = cached_weak->second.lock( );
            if ( cached )
            {
                // swift pointer was retained when function table was filled, release it when no
                // proxy is created
                function_table.release( function_table.swift_pointer );
                return cached;
            }
        }
        auto proxy = std::shared_ptr< ProxyType >( new ( std::nothrow )
                                                       ProxyType( std::move( function_table ) ) );
        if ( proxy )
        {
            proxy->m_key = key;
            s_cache[ key ] = proxy;
        }
        return proxy;
    }

    virtual ~CachedProxyBase( )
    {
        std::lock_guard< std::mutex > cache_lock( s_cache_mutex );
        s_cache.erase( m_key );
    }

private:
    const void* m_key;

private:
    static std::unordered_map< const void*, std::weak_ptr< ProxyType > > s_cache;
    static std::mutex s_cache_mutex;
};

template < class ProxyType >
std::unordered_map< const void*, std::weak_ptr< ProxyType > > CachedProxyBase< ProxyType >::s_cache;

template < class ProxyType >
std::mutex CachedProxyBase< ProxyType >::s_cache_mutex;
