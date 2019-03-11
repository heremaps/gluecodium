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

#include <memory>
#include "Instances.h"
#include "Interfaces.h"
#include "test/InstancesFactory.h"

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
