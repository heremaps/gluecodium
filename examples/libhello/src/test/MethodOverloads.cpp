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

#include "test/ChildConstructorOverloads.h"
#include "test/ConstructorOverloads.h"
#include "test/MethodOverloads.h"

namespace test
{
bool
MethodOverloads::is_boolean( const bool input )
{
    return true;
}

bool
MethodOverloads::is_boolean( const int8_t input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const ::std::string& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::Point& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const bool input1,
                             const int8_t input2,
                             const ::std::string& input3,
                             const MethodOverloads::Point& input4 )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::StringArray& input )
{
    return false;
}

bool
MethodOverloads::is_boolean( const MethodOverloads::IntArray& input )
{
    return false;
}

class ConstructorOverloadsImpl: public ConstructorOverloads
{
public:
    virtual ~ConstructorOverloadsImpl( ) = default;
};

std::shared_ptr< ConstructorOverloads >
ConstructorOverloads::create( )
{
    return std::make_shared< ConstructorOverloadsImpl >( );
}

std::shared_ptr< ConstructorOverloads >
ConstructorOverloads::create( const std::string& input )
{
    return std::make_shared< ConstructorOverloadsImpl >( );
}

std::shared_ptr< ConstructorOverloads >
ConstructorOverloads::create( bool input )
{
    return std::make_shared< ConstructorOverloadsImpl >( );
}

std::shared_ptr< ConstructorOverloads >
ConstructorOverloads::create( const std::string& string_input, bool boolean_input )
{
    return std::make_shared< ConstructorOverloadsImpl >( );
}

lorem_ipsum::Return< std::shared_ptr< ConstructorOverloads >, std::error_code >
ConstructorOverloads::create( double input )
{
    return lorem_ipsum::Return< std::shared_ptr< ConstructorOverloads >, std::error_code >(
        std::make_shared< ConstructorOverloadsImpl >( ) );
}

std::shared_ptr< ConstructorOverloads >
ConstructorOverloads::create( const std::vector< double >& input )
{
    return std::make_shared< ConstructorOverloadsImpl >( );
}


class ChildConstructorOverloadsImpl: public ChildConstructorOverloads
{
public:
    virtual ~ChildConstructorOverloadsImpl( ) = default;
};

std::shared_ptr< ChildConstructorOverloads >
ChildConstructorOverloads::create( )
{
    return std::make_shared< ChildConstructorOverloadsImpl >( );
}

lorem_ipsum::Return< std::shared_ptr< ChildConstructorOverloads >, std::error_code >
ChildConstructorOverloads::create( double input )
{
    return lorem_ipsum::Return< std::shared_ptr< ChildConstructorOverloads >, std::error_code >(
        std::make_shared< ChildConstructorOverloadsImpl >( ) );
}

}  // namespace test
