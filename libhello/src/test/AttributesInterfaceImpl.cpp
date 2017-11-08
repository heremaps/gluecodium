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

#include "AttributesInterfaceImpl.h"

namespace test
{

AttributesInterfaceImpl::~AttributesInterfaceImpl( ) = default;

uint32_t
AttributesInterfaceImpl::get_built_in_type_attribute( )
{
    return m_build_in_type_attribute;
}

void
AttributesInterfaceImpl::set_built_in_type_attribute( const uint32_t value )
{
    m_build_in_type_attribute = value;
}

::test::AttributesInterface::ExampleStruct
AttributesInterfaceImpl::get_struct_attribute( )
{
    return m_struct_attribute;
}

void
AttributesInterfaceImpl::set_struct_attribute(
    const ::test::AttributesInterface::ExampleStruct& value )
{
    m_struct_attribute = value;
}

}
