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
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>

#include <string>
#include <vector>

namespace smoke {

class Attributes {
public:
    virtual ~Attributes() = 0;

public:
enum class InternalError {
    ERROR_NONE,
    ERROR_FATAL = 999
};

struct ExampleStruct {
    double value = 0;
};

public:
virtual uint32_t get_built_in_type_attribute(  ) = 0;
virtual void set_built_in_type_attribute( const uint32_t value ) = 0;
virtual float get_readonly_attribute(  ) = 0;
virtual ::smoke::Attributes::ExampleStruct get_struct_attribute(  ) = 0;
virtual void set_struct_attribute( const ::smoke::Attributes::ExampleStruct& value ) = 0;
virtual ::std::vector< ::std::string > get_array_attribute(  ) = 0;
virtual void set_array_attribute( const ::std::vector< ::std::string >& value ) = 0;
virtual ::smoke::Attributes::InternalError get_complex_type_attribute(  ) = 0;
virtual void set_complex_type_attribute( const ::smoke::Attributes::InternalError value ) = 0;

};

}
