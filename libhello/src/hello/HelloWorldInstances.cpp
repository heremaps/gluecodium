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

#include "HelloWorldInstances.h"

namespace hello
{
void
HelloWorldSimpleInstantiable::set_string_value( const ::std::string& string_value )
{
    m_string_value = string_value;
}

::std::string
HelloWorldSimpleInstantiable::get_string_value( )
{
    return m_string_value;
}

HelloWorldNestedInstantiable::HelloWorldNestedInstantiable(
    const ::std::shared_ptr< ::hello::SimpleInstantiable >& instance )
    : m_instance( instance )
{
}

void
HelloWorldNestedInstantiable::set_instantiable(
    const ::std::shared_ptr< ::hello::SimpleInstantiable >& instance )
{
    m_instance = instance;
}

::std::shared_ptr< ::hello::SimpleInstantiable >
HelloWorldNestedInstantiable::get_instantiable( )
{
    return m_instance;
}
}
