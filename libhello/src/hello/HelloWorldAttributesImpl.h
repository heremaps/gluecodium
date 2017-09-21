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

#include "hello/HelloWorldAttributes.h"

namespace hello
{
class HelloWorldAttributesImpl : public HelloWorldAttributes
{
public:
    ~HelloWorldAttributesImpl( ) override;

public:
    uint32_t getBuiltInTypeAttribute( ) override;
    void setBuiltInTypeAttribute( const uint32_t value ) override;
    float getReadonlyAttribute( ) override;
    ::hello::HelloWorldAttributes::ExampleStruct getStructAttribute( ) override;
    void setStructAttribute(
        const ::hello::HelloWorldAttributes::ExampleStruct& value ) override;

private:
    uint32_t m_build_in_type_attribute = 0;
    const float m_read_only_attribute = 3.14f;
    ::hello::HelloWorldAttributes::ExampleStruct m_struct_attribute;
};
}
