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

#pragma once

#include "ChildClassImpl.h"
#include "test/GrandchildClass.h"

namespace test
{

class GrandchildClassImpl : public GrandchildClass, public ChildClassImpl
{
public:
    GrandchildClassImpl( );
    ~GrandchildClassImpl( ) = default;
    ::std::shared_ptr< ParentInterface > cast_to_parent( ) override;
    ::std::string get_name( ) override;
    int32_t get_lucky_number( ) override;
    void set_lucky_number( const int32_t number ) override;
    void do_something( const std::string& value ) override;
};

}
