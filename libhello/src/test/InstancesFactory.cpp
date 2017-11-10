// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
// -------------------------------------------------------------------------------------------------

#include <memory>
#include "Instances.h"
#include "Interfaces.h"
#include "cpp/test/InstancesFactory.h"

namespace test {

::std::shared_ptr< SimpleInstantiableOne >
InstancesFactory::create_simple_instantiable_one( )
{
    return ::std::make_shared< SimpleInstanceOne >( );
}

::std::shared_ptr< SimpleInstantiableTwo >
InstancesFactory::create_simple_instantiable_two( )
{
    return ::std::make_shared< SimpleInstanceTwo >( );
}

::std::shared_ptr< NestedInstantiableOne >
InstancesFactory::create_nested_instantiable_one( )
{
    return ::std::make_shared< NestedInstanceOne >( );
}

::std::shared_ptr< NestedInstantiableTwo >
InstancesFactory::create_nested_instantiable_two( )
{
    return ::std::make_shared< NestedInstanceTwo >( );
}

::std::shared_ptr< SimpleInterfaceOne >
InstancesFactory::create_simple_interface_one( )
{
    return ::std::make_shared< SimpleInterfaceOneImpl >( );
}

::std::shared_ptr< SimpleInterfaceTwo >
InstancesFactory::create_simple_interface_two( )
{
    return ::std::make_shared< SimpleInterfaceTwoImpl >( );
}

::std::shared_ptr< NestedInterfaceOne >
InstancesFactory::create_nested_interface_one( )
{
    return ::std::make_shared< NestedInterfaceOneImpl >( );
}

::std::shared_ptr< NestedInterfaceTwo >
InstancesFactory::create_nested_interface_two( )
{
    return ::std::make_shared< NestedInterfaceTwoImpl >( );
}

}
