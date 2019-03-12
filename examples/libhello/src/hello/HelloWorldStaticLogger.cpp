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

#include "hello/HelloWorldStaticLogger.h"

namespace hello
{
static std::string s_logger_string = "";

::std::string
HelloWorldStaticLogger::get_log( )
{
    return s_logger_string;
}

void
HelloWorldStaticLogger::append( const ::std::string& log )
{
    s_logger_string += log;
}

void
HelloWorldStaticLogger::clear_log( )
{
    s_logger_string = "";
}

}  // namespace hello
