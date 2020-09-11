// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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

#include "test/OuterStruct.h"

namespace test
{
namespace
{
class OuterStructBuilderImpl: public OuterStruct::Builder,
                              public std::enable_shared_from_this<OuterStructBuilderImpl> {
public:
    OuterStructBuilderImpl() {}
    virtual ~OuterStructBuilderImpl() = default;

    std::shared_ptr<OuterStruct::Builder>
    field(const std::string& value) override {
        m_field = value;
        return shared_from_this();
    }

    OuterStruct
    build() { return OuterStruct(m_field); }

private:
    std::string m_field;
};
}

void
OuterStruct::do_nothing() { }

void
OuterStruct::InnerStruct::do_something() { }

std::unordered_set<int32_t>
OuterStruct::InnerClass::foo_bar() { return {42}; }

std::shared_ptr<OuterStruct::Builder>
OuterStruct::Builder::create() { return std::make_shared<OuterStructBuilderImpl>(); }

}
