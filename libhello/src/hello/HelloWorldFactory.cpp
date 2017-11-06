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
