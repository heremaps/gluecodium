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

#include "test/SimpleInstantiableOne.h"
#include "test/SimpleInstantiableTwo.h"
#include "test/NestedInstantiableOne.h"
#include "test/NestedInstantiableTwo.h"

namespace test
{

class SimpleInstanceOne : public SimpleInstantiableOne {

public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value(  ) override;

private:
    std::string m_value;

};

class SimpleInstanceTwo : public SimpleInstantiableTwo {

public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value(  ) override;

private:
    std::string m_value;
};

class NestedInstanceOne : public NestedInstantiableOne
{

public:
    void set_same_type_instances(
        const std::shared_ptr< SimpleInstantiableOne >& instance_one,
        const std::shared_ptr< SimpleInstantiableOne >& instance_two ) override;
    std::shared_ptr< SimpleInstantiableOne > get_instance_one(  ) override;
    std::shared_ptr< SimpleInstantiableOne > get_instance_two(  ) override;

private:
    std::shared_ptr< SimpleInstantiableOne > m_instance_one;
    std::shared_ptr< SimpleInstantiableOne > m_instance_two;
};

class NestedInstanceTwo : public NestedInstantiableTwo
{

public:
    void set_multiple_type_instances(
        const std::shared_ptr< SimpleInstantiableOne >& instance_one,
        const std::shared_ptr< SimpleInstantiableTwo >& instance_two,
        const std::shared_ptr< NestedInstantiableOne >& nested_instantiable ) override;
    void set_self_instantiable(
        const ::std::shared_ptr< NestedInstantiableTwo >& self_instance ) override;
    std::shared_ptr< NestedInstantiableTwo > get_self_instantiable(  ) override;
    std::shared_ptr< SimpleInstantiableOne > get_instantiable_one(  ) override;
    std::shared_ptr< SimpleInstantiableTwo > get_instantiable_two(  ) override;
    std::shared_ptr< NestedInstantiableOne > get_nested_instantiable(  ) override;

private:
    std::shared_ptr< NestedInstantiableTwo > m_instance_self;
    std::shared_ptr< SimpleInstantiableOne > m_instance_one;
    std::shared_ptr< SimpleInstantiableTwo > m_instance_two;
    std::shared_ptr< NestedInstantiableOne > m_nested_instance;
};

}
