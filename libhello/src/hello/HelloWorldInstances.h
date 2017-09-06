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

#include "stub/hello/SimpleInstantiable.h"
#include "stub/hello/NestedInstantiable.h"

namespace hello
{
class HelloWorldSimpleInstantiable : public SimpleInstantiable
{
public:
    virtual void setStringValue( const ::std::string& stringValue ) override;
    virtual ::std::string getStringValue( ) override;

private:
    ::std::string m_string_value = "";
};

class HelloWorldNestedInstantiable : public NestedInstantiable
{
public:
    HelloWorldNestedInstantiable(
        const ::std::shared_ptr< ::hello::SimpleInstantiable >& instance );

    virtual void setInstantiable(
        const ::std::shared_ptr< ::hello::SimpleInstantiable >& instance ) override;
    virtual ::std::shared_ptr< ::hello::SimpleInstantiable > getInstantiable( ) override;

private:
    ::std::shared_ptr< ::hello::SimpleInstantiable > m_instance = nullptr;
};
}
