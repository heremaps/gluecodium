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

#include "hello/HelloWorldFactory.h"

#include "HelloWorldInstances.h"
#include "HelloWorldAttributesImpl.h"

namespace hello
{

::std::shared_ptr< SimpleInstantiable >
HelloWorldFactory::create_simple( )
{
    return ::std::make_shared< HelloWorldSimpleInstantiable >( );
}

::std::shared_ptr< NestedInstantiable >
HelloWorldFactory::create_nested( const ::std::shared_ptr< SimpleInstantiable >& simple_instance_ref )
{
    return ::std::make_shared< HelloWorldNestedInstantiable >( simple_instance_ref );
}

::std::shared_ptr< HelloWorldAttributes >
HelloWorldFactory::create_attributes( )
{
    return ::std::make_shared< HelloWorldAttributesImpl >( );
}

}
