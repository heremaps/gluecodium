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

#include "test/EnumsTypeCollectionMethods.h"

namespace
{
::test::InternalErrorTypeCollection
flip_enum( const ::test::InternalErrorTypeCollection val )
{
    return val == ::test::InternalErrorTypeCollection::ERROR_NONE
               ? ::test::InternalErrorTypeCollection::ERROR_FATAL
               : ::test::InternalErrorTypeCollection::ERROR_NONE;
}
}

namespace test
{
::test::InternalErrorTypeCollection
EnumsTypeCollectionMethods::flip_enum_value( const ::test::InternalErrorTypeCollection input )
{
    return flip_enum( input );
}

::test::InternalErrorTypeCollection
EnumsTypeCollectionMethods::extract_enum_from_struct( const ::test::ErrorStructTypeCollection& input )
{
    return flip_enum( input.type );
}

::test::ErrorStructTypeCollection
EnumsTypeCollectionMethods::create_struct_with_enum_inside(
    const ::test::InternalErrorTypeCollection type, const ::std::string& message )
{
   return {flip_enum( type ), message};
}

}