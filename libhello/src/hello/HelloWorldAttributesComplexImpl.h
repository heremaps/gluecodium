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

#include "hello/HelloWorldAttributesComplex.h"

namespace hello
{
class HelloWorldAttributesComplexImpl : public HelloWorldAttributesComplex
{
public:
    ~HelloWorldAttributesComplexImpl( ) override;

public:
    ::std::vector< ::std::string > get_array_attribute( ) override;
    void set_array_attribute( const ::std::vector< ::std::string >& value ) override;
    ::hello::HelloWorldAttributesComplex::InternalError get_complex_type_attribute( ) override;
    void set_complex_type_attribute(
        const ::hello::HelloWorldAttributesComplex::InternalError value ) override;

private:
    ::std::vector< ::std::string > m_array_attribute;
    ::hello::HelloWorldAttributesComplex::InternalError m_complex_type_attribute
        = ::hello::HelloWorldAttributesComplex::InternalError::ERROR_NONE;
};
}
