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

#pragma once

#include "BaseHandle.h"
#include "Export.h"

#ifdef __cplusplus
extern "C" {
#endif

_GENIUM_C_EXPORT _baseRef chrono_time_point_create_optional_handle( double time_ns_epoch );
_GENIUM_C_EXPORT void chrono_time_point_release_optional_handle( _baseRef handle );
_GENIUM_C_EXPORT double chrono_time_point_unwrap_optional_handle( _baseRef handle );

#ifdef __cplusplus
}
#endif
