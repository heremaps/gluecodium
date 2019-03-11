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

#include "test/Defaults.h"

namespace test
{

Defaults::StructWithDefaults
Defaults::get_default( )
{
    return Defaults::StructWithDefaults{ };
}

bool
Defaults::check_default( const Defaults::StructWithDefaults& input )
{
    Defaults::StructWithDefaults default_struct{ };
    return input.int_field == default_struct.int_field
        && input.float_field == default_struct.float_field
        && input.bool_field == default_struct.bool_field
        && input.string_field == default_struct.string_field
        && input.enum_field == default_struct.enum_field;
}

}
