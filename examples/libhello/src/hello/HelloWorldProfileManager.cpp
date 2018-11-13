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

#include "HelloWorldProfileManager.h"
#include "hello/HelloWorldStaticLogger.h"
#include <memory>
#include <string>

namespace hello
{
// ProfileManager destruction is logged to static logger to allow verification
// of correct instance disposal
HelloWorldProfileManager::~HelloWorldProfileManager( )
{
    HelloWorldStaticLogger::append( "ProfileManager::destructor" );
}

void
HelloWorldProfileManager::create_profile( const ::std::string& username )
{
    m_profile_name = username;
}

::std::string
HelloWorldProfileManager::change_profile( const ::std::string& username )
{
    std::string old = m_profile_name;
    m_profile_name = username;
    return old;
}

::std::string
HelloWorldProfileManager::delete_profile( )
{
    std::string old = m_profile_name;
    m_profile_name = "";
    return old;
}
}  // namespace hello
