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

#include "CachedPropertiesImpl.h"

namespace test
{
namespace
{
const std::shared_ptr<std::vector<uint8_t>> s_blob =
    std::make_shared<std::vector<uint8_t>>(std::vector<uint8_t>{0, 1, 2});
uint32_t s_static_call_count = 0;
}

CachedPropertiesImpl::CachedPropertiesImpl() : m_string_list({"foo", "bar"}), m_call_count(0) {}

CachedPropertiesImpl::~CachedPropertiesImpl() = default;

std::vector<std::string>
CachedPropertiesImpl::get_cached_property() const {
    ++m_call_count;
    return m_string_list;
}

std::vector<std::string>
CachedPropertiesImpl::get_internal_cached_property() const {
    return m_string_list;
}

uint32_t
CachedPropertiesImpl::get_call_count() const {
    return m_call_count;
}

std::shared_ptr<std::vector<uint8_t>>
CachedProperties::get_static_cached_property() {
    ++s_static_call_count;
    return s_blob;
}

std::shared_ptr<std::vector<uint8_t>>
CachedProperties::get_internal_static_cached_property() {
    return s_blob;
}

uint32_t
CachedProperties::get_static_call_count() {
    return s_static_call_count;
}

std::shared_ptr<CachedProperties>
CachedProperties::create() {
    return std::make_shared<CachedPropertiesImpl>();
}
}
