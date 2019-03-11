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

#include "hello/HelloWorldPlainDataStructures.h"

namespace hello
{
HelloWorldPlainDataStructures::SyncResult
HelloWorldPlainDataStructures::method_with_non_nested_type(
    const HelloWorldPlainDataStructures::SyncResult& input )
{
    HelloWorldPlainDataStructures::SyncResult output = input;
    ++output.number_of_changes;

    return output;
}

HelloWorldPlainDataStructures::IdentifiableSyncResult
HelloWorldPlainDataStructures::method_with_nested_type(
    const HelloWorldPlainDataStructures::IdentifiableSyncResult& input )
{
    HelloWorldPlainDataStructures::IdentifiableSyncResult output = input;
    ++output.sync_result.number_of_changes;

    return output;
}

HelloWorldPlainDataStructures::NumericSyncResult
HelloWorldPlainDataStructures::method_with_inherited_struct(
    const HelloWorldPlainDataStructures::NumericSyncResult& input )
{
    HelloWorldPlainDataStructures::NumericSyncResult output = input;
    ++output.number_of_changes;

    return output;
}
}
