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

#include <chrono>
#include <string>
#include <system_error>
#include <vector>

namespace external
{
namespace even_more_external
{
enum class AlienEnum
{
    Foo,
    Bar
};

enum class AlienErrorCode
{
    NONE,
    BOOM
};

/// An enum that intentionally violates naming conventions for its values.
enum class VeryAlienEnum
{
    One_Value,
    Another_Value
};

struct AlienStructure
{
    int32_t int_field;
};

std::error_code make_error_code( AlienErrorCode value ) noexcept;
}  // namespace even_more_external

enum class Very_External_Enum
{
    FOO,
    BAR
};

class ExternalStruct
{
public:
    std::string get_some_string( ) const;
    void set_some_string( const std::string& value );
    std::vector< int32_t > getSomeArray( ) const;
    void setSomeArray( const std::vector< int32_t >& value );
    even_more_external::AlienStructure aStruct( ) const;
    void _set_aStruct( const even_more_external::AlienStructure& value );

public:
    std::string string_field;

private:
    std::string m_some_string;
    std::vector< int32_t > m_some_array;
    even_more_external::AlienStructure m_some_struct;
};

struct Yet_Another_External_Struct
{
public:
    std::string string_Field;
};

class fOo_iTnerface
{
public:
    struct some_Struct
    {
        std::string some_Field;
    };

    enum class some_Enum
    {
        some_Value
    };

    virtual std::string get_Me( ) = 0;

    virtual void set_Me( const std::string& ) = 0;

    virtual void some_Method( uint8_t ) = 0;
};

class ClassWithOverloads {
public:
    struct StructWithOverloads {
        const std::string& overloadedMethod( );
        std::string overloadedMethod( const std::string& input );
        std::string overloadedMethod( const std::string&, const bool );

        void overloadedAccessors( int32_t value );
        const int32_t& overloadedAccessors( ) const;
    private:
        int32_t m_someField;
    };

    virtual std::string oneOverloadNotExposed( ) = 0;
    virtual std::string oneOverloadNotExposed( const std::string& ) = 0;

    virtual const std::string& allOverloadsExposed( const std::string& ) = 0;
    virtual std::string allOverloadsExposed( const std::vector<std::string>& ) = 0;
    virtual std::string allOverloadsExposed( const std::string&, const bool ) = 0;
};

class external_Interface
{
public:
    struct some_Struct
    {
        std::string some_Field;
    };

    enum class some_Enum
    {
        some_Value
    };

    virtual std::string get_Me( ) = 0;

    virtual void some_Method( uint8_t ) = 0;
};

enum StandaloneExternalEnum {
    foo
};
}

namespace std
{
template <>
struct is_error_code_enum< external::even_more_external::AlienErrorCode > : public std::true_type
{
};
}
