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
#include "ChildClassImpl.h"

#include <memory>

namespace
{
class RootInterfaceImpl: public ::test::RootInterface
{
public:
    RootInterfaceImpl( ) = default;
    ~RootInterfaceImpl( ) = default;

    void
    root_method( const std::string& s ) override
    {
    }
};

class ChildInterfaceImpl : public ::test::ChildInterface
{
public:
    ChildInterfaceImpl( ) = default;
    ~ChildInterfaceImpl( ) = default;

    void
    root_method( const std::string& s ) override
    {
        data = "C++ Child data is '" + s + "'";
    }

    ::std::string
    get_data( ) override
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
    root_method( const std::string& s ) override
    {
        data = "C++ AnotherChild data is '" + s + "'";
    }

    ::std::string
    get_data( ) override
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
    root_method( const std::string& s ) override
    {
        data = "C++ ConcreteChild data is '" + s + "'";
    }

    ::std::string
    get_data( ) override
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
    root_method( const std::string& s ) override
    {
        data = "C++ AnotherConcreteChild data is '" + s + "'";
    }

    ::std::string
    get_data( ) override
    {
        return data;
    }

private:
    std::string data;
};

class ConjoinedConcreteChildImpl: public ConcreteChildImpl, public AnotherConcreteChildImpl { };
class DisjoinedChildImpl: public ConcreteChildImpl, public test::ChildClassImpl { };

class ConcreteGrandChildImpl : public ::test::ConcreteGrandChild
{
public:
    ConcreteGrandChildImpl( ) = default;
    ~ConcreteGrandChildImpl( ) = default;

    void
    root_method( const std::string& s ) override
    {
        m_data = "C++ ConcreteGrandChild data is '" + s + "'";
    }

    ::std::string
    get_data( ) override
    {
        return m_data;
    }

    void
    set_text( const std::string& text ) override
    {
        m_text = text;
    }

    ::std::string
    get_text( ) const override
    {
        return m_text;
    }

private:
    std::string m_data;
    std::string m_text;
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

::std::shared_ptr< RootInterface >
InheritanceTestHelper::create_root( )
{
    return ::std::make_shared< RootInterfaceImpl >( );
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

::std::shared_ptr< RootInterface >
InheritanceTestHelper::create_child_as_root_interface( )
{
    return ::std::make_shared< ChildInterfaceImpl >( );
}

::std::shared_ptr< ChildInterface >
InheritanceTestHelper::create_concrete_child_as_child_interface( )
{
    return ::std::make_shared< ConcreteChildImpl >( );
}

::std::shared_ptr< ConcreteChild >
InheritanceTestHelper::create_grandchild_class_as_child_class( )
{
    return ::std::make_shared< ConcreteGrandChildImpl >( );
}

::std::shared_ptr< ChildInterface >
InheritanceTestHelper::create_conjoined_children_as_child_interface( )
{
    return ::std::make_shared< ConjoinedConcreteChildImpl >( );
}

::std::shared_ptr< AnotherChildInterface >
InheritanceTestHelper::create_conjoined_children_as_another_child_interface( )
{
    return ::std::make_shared< ConjoinedConcreteChildImpl >( );
}

::std::shared_ptr< RootInterface >
InheritanceTestHelper::create_disjoined_children_as_root_interface( )
{
    return ::std::make_shared< DisjoinedChildImpl >( );
}

::std::shared_ptr< ParentInterface >
InheritanceTestHelper::create_disjoined_children_as_parent_interface( )
{
    return ::std::make_shared< DisjoinedChildImpl >( );
}

::std::vector< std::shared_ptr< RootInterface > >
InheritanceTestHelper::create_family_list( )
{
    return {
        ::std::make_shared< ChildInterfaceImpl >( ),
        ::std::make_shared< ConcreteChildImpl >( ),
        ::std::make_shared< AnotherChildInterfaceImpl >( ),
        ::std::make_shared< AnotherConcreteChildImpl >( ),
        ::std::make_shared< ConcreteGrandChildImpl >( ),
        ::std::make_shared< AnotherConcreteGrandChildImpl >( )
    };
}


}  // namespace test
