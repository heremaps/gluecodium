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

#include "test/InterfacesFactory.h"
#include "Interfaces.h"
#include <memory>

namespace test
{
::std::shared_ptr< SimpleInterfaceOne >
InterfacesFactory::create_simple_interface_one( )
{
    return ::std::make_shared< SimpleInterfaceOneImpl >( );
}

::std::shared_ptr< SimpleInterfaceTwo >
InterfacesFactory::create_simple_interface_two( )
{
    return ::std::make_shared< SimpleInterfaceTwoImpl >( );
}

::std::shared_ptr< NestedInterfaceOne >
InterfacesFactory::create_nested_interface_one( )
{
    return ::std::make_shared< NestedInterfaceOneImpl >( );
}

::std::shared_ptr< NestedInterfaceTwo >
InterfacesFactory::create_nested_interface_two( )
{
    return ::std::make_shared< NestedInterfaceTwoImpl >( );
}

}  // namespace test
