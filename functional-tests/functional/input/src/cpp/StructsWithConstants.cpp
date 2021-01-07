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

#include "test/StructsWithConstants.h"
#include "test/StructsWithConstantsInterface.h"
#include "test/ValidationUtils.h"

namespace test
{
std::string
SimpleRoute::get_default_description( )
{
    return SimpleRoute::DEFAULT_DESCRIPTION;
}

std::string
StructsWithConstantsInterface::MultiRoute::get_default_description( )
{
    return StructsWithConstantsInterface::MultiRoute::DEFAULT_DESCRIPTION;
}

}  // namespace test
