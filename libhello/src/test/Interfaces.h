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

#include "test/SimpleInterfaceOne.h"
#include "test/SimpleInterfaceTwo.h"
#include "test/NestedInterfaceOne.h"
#include "test/NestedInterfaceTwo.h"

namespace test
{

class SimpleInterfaceOneImpl : public SimpleInterfaceOne {

public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value(  ) override;

private:
    std::string m_value;

};

class SimpleInterfaceTwoImpl : public SimpleInterfaceTwo {

public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value(  ) override;

private:
    std::string m_value;
};

class NestedInterfaceOneImpl : public NestedInterfaceOne
{

public:
    void set_same_type_interfaces(
        const std::shared_ptr< SimpleInterfaceOne >& interface_one,
        const std::shared_ptr< SimpleInterfaceOne >& interface_two ) override;
    std::shared_ptr< SimpleInterfaceOne > get_interface_one(  ) override;
    std::shared_ptr< SimpleInterfaceOne > get_interface_two(  ) override;

private:
    std::shared_ptr< SimpleInterfaceOne > m_interface_one;
    std::shared_ptr< SimpleInterfaceOne > m_interface_two;
};

class NestedInterfaceTwoImpl : public NestedInterfaceTwo
{

public:
    void set_multiple_type_interfaces(
        const std::shared_ptr< SimpleInterfaceOne >& interface_one,
        const std::shared_ptr< SimpleInterfaceTwo >& interface_two,
        const std::shared_ptr< NestedInterfaceOne >& nested_interface ) override;
    void set_self_interface(
        const ::std::shared_ptr< NestedInterfaceTwo >& self_interface ) override;
    std::shared_ptr< NestedInterfaceTwo > get_self_interface(  ) override;
    std::shared_ptr< SimpleInterfaceOne > get_interface_one(  ) override;
    std::shared_ptr< SimpleInterfaceTwo > get_interface_two(  ) override;
    std::shared_ptr< NestedInterfaceOne > get_nested_interface(  ) override;

private:
    std::shared_ptr< NestedInterfaceTwo > m_interface_self;
    std::shared_ptr< SimpleInterfaceOne > m_interface_one;
    std::shared_ptr< SimpleInterfaceTwo > m_interface_two;
    std::shared_ptr< NestedInterfaceOne > m_nested_interface;
};

}
