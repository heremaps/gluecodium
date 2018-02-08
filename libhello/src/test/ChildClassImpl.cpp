// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "ChildClassImpl.h"

namespace test
{

std::shared_ptr< ChildClass >
ChildClass::create_child_class( )
{
    return std::make_shared< ChildClassImpl >( );
}

ChildClassImpl::ChildClassImpl( )
    : m_lucky_number(7)
{
}

std::shared_ptr< ParentInterface >
ChildClassImpl::cast_to_parent( )
{
    return shared_from_this( );
}

std::string
ChildClassImpl::get_name( )
{
    return "Johnny";
}

int32_t
ChildClassImpl::get_lucky_number( )
{
    return m_lucky_number;
}

void
ChildClassImpl::set_lucky_number( const int32_t number )
{
    m_lucky_number = number;
}

void
ChildClassImpl::do_something_to_child_class( const ::std::shared_ptr< ::test::ChildClass >& input )
{
    // Do nothing
}

}
