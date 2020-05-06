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

#include "test/NonEquatableClass.h"
#include "test/NonEquatableFactory.h"
#include "test/NonEquatableInterface.h"

namespace test
{
namespace {
class NonEquatableClassImpl : public NonEquatableClass {
public:
    ~NonEquatableClassImpl() = default;
};

class NonEquatableInterfaceImpl : public NonEquatableInterface {
public:
    ~NonEquatableInterfaceImpl() = default;
};
}

std::shared_ptr<NonEquatableClass>
NonEquatableFactory::create_non_equatable_class() {
    return std::make_shared<NonEquatableClassImpl>();
}

std::shared_ptr<NonEquatableInterface>
NonEquatableFactory::create_non_equatable_interface() {
    return std::make_shared<NonEquatableInterfaceImpl>();
}
}
