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

#include "test/InstanceInStruct.h"
#include <memory>

namespace test
{

class InstanceInStructImpl: public InstanceInStruct {
public:
    ~InstanceInStructImpl() = default;

    virtual void set_string_value( const ::std::string& string_value ) {
        m_value = string_value;
    }

    virtual ::std::string get_string_value(  ) {
        return m_value;
    }

private:
    std::string m_value;
};

std::shared_ptr<InstanceInStruct>
InstanceInStruct::create() {
    return std::make_shared<InstanceInStructImpl>();
}

InstanceInStruct::SelfHolder
InstanceInStruct::create_in_struct() {
    return {std::make_shared<InstanceInStructImpl>()};
}

}
