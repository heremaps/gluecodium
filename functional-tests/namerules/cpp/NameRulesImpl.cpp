// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

#include <namerules/customNameRules.h>

namespace {
class NameRulesImpl: public namerules::customNameRules {
public:
    ::lorem_ipsum::test::Return< double, ::std::error_code > someMethod( const ::namerules::customNameRules::exampleStruct& some_argument ) override {
        return std::error_code( exampleErrorCode::FATAL_ENTRY );
    }

    uint32_t retrieve_int_attribute(  ) const override {
        return m_int;
    }

    virtual void STORE_INT_ATTRIBUTE_NOW( const uint32_t value ) override {
        m_int = value;
    }

    bool really_boolean_attribute(  ) const override {
        return m_boolean;
    }

    void STORE_BOOLEAN_ATTRIBUTE_NOW( const bool value ) override {
        m_boolean = value;
    }

    ::namerules::customNameRules::exampleStruct retrieve_struct_attribute(  ) const override {
        return m_struct;
    }

    void STORE_STRUCT_ATTRIBUTE_NOW( const ::namerules::customNameRules::exampleStruct& value ) override {
        m_struct = value;
    }

private:
    uint32_t m_int;
    bool m_boolean;
    exampleStruct m_struct;
};
}

namespace namerules {

std::shared_ptr<customNameRules>
customNameRules::create() {
    return std::make_shared<NameRulesImpl>();
}

}