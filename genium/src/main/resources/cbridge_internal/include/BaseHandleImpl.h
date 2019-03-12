// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

#include "cbridge/include/BaseHandle.h"
#include <memory>

template < typename T >
inline static T*
get_pointer( _baseRef handle )
{
    return reinterpret_cast< T* >( handle );
}

template < typename T >
inline static std::shared_ptr< T >*
checked_pointer_copy( std::shared_ptr< T >&& pointer )
{
    return !pointer ? nullptr : new std::shared_ptr< T >( std::move( pointer ) );
}

template < typename T >
inline static std::shared_ptr< T >*
checked_pointer_copy( const std::shared_ptr< T >& pointer )
{
    return !pointer ? nullptr : new std::shared_ptr< T >( pointer );
}

template<typename T>
struct Conversion
{
    static _baseRef toBaseRef( const T& t )
    {
        return reinterpret_cast<_baseRef>( new T( t ) );
    }

    static _baseRef toBaseRef( T&& t )
    {
        return reinterpret_cast<_baseRef>( new T( std::forward<T>( t ) ) );
    }

    static _baseRef referenceBaseRef( T& t )
    {
        return reinterpret_cast<_baseRef>( &t );
    }

    static T& toCpp( _baseRef ref )
    {
        return *reinterpret_cast<T*>( ref );
    }

    static T toCppReturn( _baseRef ref )
    {
        auto ptr = reinterpret_cast<T*>( ref );
        T value(*ptr);
        delete ptr;
        return value;
    }
};

template<class T>
struct Conversion<std::shared_ptr<T> >
{
    static _baseRef toBaseRef( std::shared_ptr<T> ptr )
    {
        return !ptr ? 0 : reinterpret_cast<_baseRef>( new std::shared_ptr<T>( std::move( ptr ) ) );
    }

    static _baseRef referenceBaseRef( std::shared_ptr<T>& t )
    {
        return reinterpret_cast<_baseRef>( &t );
    }

    static std::shared_ptr<T> toCpp( _baseRef ref )
    {
        if ( ref == 0 ) {
            return {};
        }
        return *reinterpret_cast<std::shared_ptr<T>*>( ref );
    }

    static std::shared_ptr<T> toCppReturn( _baseRef ref )
    {
        if ( ref == 0 ) {
            return {};
        }
        auto ptr_ptr = reinterpret_cast<std::shared_ptr<T>*>( ref );
        std::shared_ptr<T> ptr( std::move( *ptr_ptr ) );
        delete ptr_ptr;
        return ptr;
    }
};
