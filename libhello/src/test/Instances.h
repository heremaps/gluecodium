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

#pragma once

#include "cpp/test/SimpleInstantiableOne.h"
#include "cpp/test/SimpleInstantiableTwo.h"
#include "cpp/test/NestedInstantiableOne.h"
#include "cpp/test/NestedInstantiableTwo.h"

namespace test
{

class SimpleInstanceOne : public SimpleInstantiableOne {

public:
    virtual void setStringValue( const std::string& stringValue ) override;
    virtual std::string getStringValue(  ) override;

private:
    std::string m_value;

};

class SimpleInstanceTwo : public SimpleInstantiableTwo {

public:
    virtual void setStringValue( const std::string& stringValue ) override;
    virtual std::string getStringValue(  ) override;

private:
    std::string m_value;
};

class NestedInstanceOne : public NestedInstantiableOne
{

public:
    virtual void setSameTypeInstances( const std::shared_ptr< SimpleInstantiableOne >& instanceOne,
       const std::shared_ptr< SimpleInstantiableOne >& instanceTwo ) override;
    virtual std::shared_ptr< SimpleInstantiableOne > getInstanceOne(  ) override;
    virtual std::shared_ptr< SimpleInstantiableOne > getInstanceTwo(  ) override;

private:
    std::shared_ptr< SimpleInstantiableOne > m_instanceOne;
    std::shared_ptr< SimpleInstantiableOne > m_instanceTwo;
};

class NestedInstanceTwo : public NestedInstantiableTwo
{

public:
    virtual void setMultipleTypeInstances( const std::shared_ptr< SimpleInstantiableOne >& instanceOne,
        const std::shared_ptr< SimpleInstantiableTwo >& instanceTwo,
        const std::shared_ptr< NestedInstantiableOne >& nestedInstantiable ) override;
    virtual void setSelfInstantiable( const ::std::shared_ptr< NestedInstantiableTwo >& selfInstance ) override;
    virtual std::shared_ptr< NestedInstantiableTwo > getSelfInstantiable(  ) override;
    virtual std::shared_ptr< SimpleInstantiableOne > getInstantiableOne(  ) override;
    virtual std::shared_ptr< SimpleInstantiableTwo > getInstantiableTwo(  ) override;
    virtual std::shared_ptr< NestedInstantiableOne > getNestedInstantiable(  ) override;
private:
    std::shared_ptr< NestedInstantiableTwo > m_instanceSelf;
    std::shared_ptr< SimpleInstantiableOne > m_instanceOne;
    std::shared_ptr< SimpleInstantiableTwo > m_instanceTwo;
    std::shared_ptr< NestedInstantiableOne > m_nestedInstance;
};

}
