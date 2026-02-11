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

#include "test/CachedProperties.h"

namespace test
{
class CachedPropertiesImpl : public CachedProperties
{
public:
    explicit CachedPropertiesImpl();
    ~CachedPropertiesImpl( ) override;

public:
    std::vector<std::string> get_cached_property( ) const override;
    std::vector<std::string> get_internal_cached_property( ) const override;
    uint32_t get_call_count( ) const override;

private:
    const std::vector<std::string> m_string_list;
    mutable uint32_t m_call_count;
};
}  // namespace test
