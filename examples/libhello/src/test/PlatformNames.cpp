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

#include "test/fooInterface.h"
#include "test/fooListener.h"
#include "test/PlatformNamesNotifier.h"
#include "test/PlatformNamesEngine.h"
#include "test/PlatformNamesEngineFactory.h"

namespace test
{
namespace
{
PlatformNamesEngineFactory s_factory;
}

fooStruct
fooInterface::FooMethod( const std::string& FooParameter )
{
    return {FooParameter};
}

std::shared_ptr< fooInterface >
fooInterface::make( const std::string& makeParameter )
{
    return {};
}

fooStruct
fooStruct::create( const std::string& FooParameter )
{
    return {};
}

void
PlatformNamesNotifier::notify_directly(const std::shared_ptr<fooListener>& listener) {
    listener->FooMethod("42");
}

void
PlatformNamesNotifier::set_factory(const PlatformNamesEngineFactory& factory) {
    s_factory = factory;
}

std::shared_ptr<PlatformNamesEngine>
PlatformNamesNotifier::get_engine() { return s_factory(); }

}
