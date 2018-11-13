// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

#include "test/AttributesInterface.h"

namespace test
{
class AttributesInterfaceImpl : public AttributesInterface
{
public:
    ~AttributesInterfaceImpl( ) override;

public:
    uint32_t get_built_in_type_attribute( ) const override;
    void set_built_in_type_attribute( const uint32_t value ) override;
    ::test::AttributesInterface::ExampleStruct get_struct_attribute( ) const override;
    void set_struct_attribute( const ::test::AttributesInterface::ExampleStruct& value ) override;

private:
    uint32_t m_build_in_type_attribute = 0;
    ::test::AttributesInterface::ExampleStruct m_struct_attribute;
};
}  // namespace test
