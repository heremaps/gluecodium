// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
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
            auto cached = cached_weak->second.first.lock( );
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
            s_cache[ key ] = std::make_pair(proxy, proxy.get());
            s_reverse_cache[ proxy.get() ] = key;
        }
        return proxy;
    }

    static const void* get_swift_object(const void* proxy) {
        std::lock_guard< std::mutex > cache_lock( s_cache_mutex );
        auto it = s_reverse_cache.find( proxy );
        if ( it != s_reverse_cache.end( ) ) {
            return it->second;
        }
        return nullptr;
    }

    virtual ~CachedProxyBase( )
    {
        std::lock_guard< std::mutex > cache_lock( s_cache_mutex );
        s_reverse_cache.erase( s_cache[ m_key ].second );
        s_cache.erase( m_key );
    }

private:
    const void* m_key;

private:
    using CacheEntryType = std::pair< std::weak_ptr< ProxyType >, void* >;
    static std::unordered_map< const void*,  CacheEntryType > s_cache;
    static std::unordered_map< const void*, const void* > s_reverse_cache;
    static std::mutex s_cache_mutex;
};

template < class ProxyType >
std::unordered_map< const void*, typename CachedProxyBase< ProxyType >::CacheEntryType > CachedProxyBase< ProxyType >::s_cache;

template < class ProxyType >
std::unordered_map< const void*, const void* > CachedProxyBase< ProxyType >::s_reverse_cache;

template < class ProxyType >
std::mutex CachedProxyBase< ProxyType >::s_cache_mutex;
