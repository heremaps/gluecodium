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
#include <limits>
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
    double value = std::numeric_limits< double >::quiet_NaN( );
};

public:
virtual uint32_t getBuiltInTypeAttribute(  ) = 0;
virtual void setBuiltInTypeAttribute( const uint32_t value ) = 0;
virtual float getReadonlyAttribute(  ) = 0;
virtual ::smoke::Attributes::ExampleStruct getStructAttribute(  ) = 0;
virtual void setStructAttribute( const ::smoke::Attributes::ExampleStruct& value ) = 0;
virtual ::std::vector< ::std::string > getArrayAttribute(  ) = 0;
virtual void setArrayAttribute( const ::std::vector< ::std::string >& value ) = 0;
virtual ::smoke::Attributes::InternalError getComplexTypeAttribute(  ) = 0;
virtual void setComplexTypeAttribute( const ::smoke::Attributes::InternalError value ) = 0;

};

}
