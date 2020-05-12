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

#include "test/CppConstClass.h"
#include "test/CppConstInterface.h"
#include "test/CppConstInterfaceFactory.h"

namespace test
{
namespace
{
class CppConstClassImpl : public CppConstClass {
public:
    std::string get_foo() const { return "foo"; }
};

class CppConstInterfaceImpl : public CppConstInterface {
public:
    std::string get_foo() const { return "foo"; }
};
}

std::shared_ptr<CppConstClass>
CppConstClass::create() {
    return std::make_shared<CppConstClassImpl>();
}

std::shared_ptr<CppConstInterface>
CppConstInterfaceFactory::create_cpp_const_interface() {
    return std::make_shared<CppConstInterfaceImpl>();
}

std::string
CppConstInterfaceFactory::call_get_foo(const std::shared_ptr<CppConstInterface>& callback) {
    return callback->get_foo();
}

}
