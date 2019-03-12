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

#include "test/AnotherChildInterface.h"
#include "test/AnotherConcreteChild.h"
#include "test/AnotherConcreteGrandChild.h"
#include "test/ChildInterface.h"
#include "test/ConcreteChild.h"
#include "test/ConcreteGrandChild.h"
#include "test/RootInterface.h"

#include "test/InheritanceTestHelper.h"

#include <memory>

namespace
{
class ChildInterfaceImpl : public ::test::ChildInterface
{
public:
    ChildInterfaceImpl( ) = default;
    ~ChildInterfaceImpl( ) = default;

    void
    root_method( const std::string& s )
    {
        data = "C++ Child data is '" + s + "'";
    }

    ::std::string
    get_data( )
    {
        return data;
    }

private:
    std::string data;
};

class AnotherChildInterfaceImpl : public ::test::AnotherChildInterface
{
public:
    AnotherChildInterfaceImpl( ) = default;
    ~AnotherChildInterfaceImpl( ) = default;

    void
    root_method( const std::string& s )
    {
        data = "C++ AnotherChild data is '" + s + "'";
    }

    ::std::string
    get_data( )
    {
        return data;
    }

private:
    std::string data;
};

class ConcreteChildImpl : public ::test::ConcreteChild
{
public:
    ConcreteChildImpl( ) = default;
    ~ConcreteChildImpl( ) = default;

    void
    root_method( const std::string& s )
    {
        data = "C++ ConcreteChild data is '" + s + "'";
    }

    ::std::string
    get_data( )
    {
        return data;
    }

private:
    std::string data;
};

class AnotherConcreteChildImpl : public ::test::AnotherConcreteChild
{
public:
    AnotherConcreteChildImpl( ) = default;
    ~AnotherConcreteChildImpl( ) = default;

    void
    root_method( const std::string& s )
    {
        data = "C++ AnotherConcreteChild data is '" + s + "'";
    }

    ::std::string
    get_data( )
    {
        return data;
    }

private:
    std::string data;
};

class ConcreteGrandChildImpl : public ::test::ConcreteGrandChild
{
public:
    ConcreteGrandChildImpl( ) = default;
    ~ConcreteGrandChildImpl( ) = default;

    void
    root_method( const std::string& s )
    {
        data = "C++ ConcreteGrandChild data is '" + s + "'";
    }

    ::std::string
    get_data( )
    {
        return data;
    }

private:
    std::string data;
};

class AnotherConcreteGrandChildImpl : public ::test::AnotherConcreteGrandChild
{
public:
    AnotherConcreteGrandChildImpl( ) = default;
    ~AnotherConcreteGrandChildImpl( ) = default;

    void
    root_method( const std::string& s )
    {
        data = "C++ AnotherConcreteGrandChild data is '" + s + "'";
    }

    ::std::string
    get_data( )
    {
        return data;
    }

private:
    std::string data;
};
}  // namespace

namespace test
{
void
InheritanceTestHelper::call_root_method( std::shared_ptr< test::RootInterface > const& object,
                                         std::string const& data )
{
    object->root_method( data );
}

::std::shared_ptr< ChildInterface >
InheritanceTestHelper::create_child( )
{
    return ::std::make_shared< ChildInterfaceImpl >( );
}

::std::shared_ptr< AnotherChildInterface >
InheritanceTestHelper::create_another_child( )
{
    return ::std::make_shared< AnotherChildInterfaceImpl >( );
}

::std::shared_ptr< ConcreteChild >
InheritanceTestHelper::create_concrete_child( )
{
    return ::std::make_shared< ConcreteChildImpl >( );
}

::std::shared_ptr< AnotherConcreteChild >
InheritanceTestHelper::create_another_concrete_child( )
{
    return ::std::make_shared< AnotherConcreteChildImpl >( );
}

::std::shared_ptr< ConcreteGrandChild >
InheritanceTestHelper::create_concrete_grand_child( )
{
    return ::std::make_shared< ConcreteGrandChildImpl >( );
}

::std::shared_ptr< AnotherConcreteGrandChild >
InheritanceTestHelper::create_another_concrete_grand_child( )
{
    return ::std::make_shared< AnotherConcreteGrandChildImpl >( );
}
}  // namespace test
