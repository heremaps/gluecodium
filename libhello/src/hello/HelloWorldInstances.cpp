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
HelloWorldSimpleInstantiable::setStringValue( const ::std::string& stringValue )
{
    m_string_value = stringValue;
}

::std::string
HelloWorldSimpleInstantiable::getStringValue( )
{
    return m_string_value;
}

HelloWorldNestedInstantiable::HelloWorldNestedInstantiable(
    const ::std::shared_ptr< ::hello::SimpleInstantiable >& instance )
    : m_instance( instance )
{
}

void
HelloWorldNestedInstantiable::setInstantiable(
    const ::std::shared_ptr< ::hello::SimpleInstantiable >& instance )
{
    m_instance = instance;
}

::std::shared_ptr< ::hello::SimpleInstantiable >
HelloWorldNestedInstantiable::getInstantiable( )
{
    return m_instance;
}
}
