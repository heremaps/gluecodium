// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2023 HERE Europe B.V.
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

#include "test/CppNoexceptClass.h"
#include "test/CppNoexceptClassInherited.h"
#include "test/CppNoexceptInterface.h"
#include "test/CppNoexceptInterfaceInherited.h"
#include "test/CppNoexceptInterfaceFactory.h"

namespace test
{

namespace
{
class CppNoexceptClassImpl final : public CppNoexceptClass {
public:
    std::string get_foo() noexcept override {
      static_assert(noexcept(CppNoexceptClass::get_foo()));
      return "foo";
    }
};

class CppNoexceptClassInheritedImpl final : public CppNoexceptClassInherited {
public:
    std::string get_foo() noexcept override {
      static_assert(noexcept(CppNoexceptClassInherited::get_foo()));
      return "foo";
    }

    std::string get_bar() noexcept override {
      static_assert(noexcept(CppNoexceptClassInherited::get_bar()));
      return "bar";
    }
};

class CppNoexceptInterfaceImpl final : public CppNoexceptInterface {
public:
    std::string get_foo() noexcept override {
      static_assert(noexcept(CppNoexceptInterface::get_foo()));
      return "foo";
    }
};

class CppNoexceptInterfaceInheritedImpl final : public CppNoexceptInterfaceInherited {
public:
    std::string get_foo() noexcept override {
      static_assert(noexcept(CppNoexceptInterface::get_foo()));
      return "foo";
    }

    std::string get_bar() const noexcept override {
      static_assert(noexcept(CppNoexceptInterfaceInherited::get_bar()));
      return "bar";
    }
};
}

std::shared_ptr<CppNoexceptClass>
CppNoexceptClass::create() noexcept {
    return std::make_shared<CppNoexceptClassImpl>();
}

std::shared_ptr<CppNoexceptClassInherited>
CppNoexceptClassInherited::create() noexcept {
    return std::make_shared<CppNoexceptClassInheritedImpl>();
}

std::shared_ptr<CppNoexceptInterface>
CppNoexceptInterfaceFactory::create_cpp_noexcept_interface() noexcept {
    return std::make_shared<CppNoexceptInterfaceImpl>();
}

std::shared_ptr<CppNoexceptInterfaceInherited>
CppNoexceptInterfaceFactory::create_cpp_noexcept_inherited_interface() noexcept {
    return std::make_shared<CppNoexceptInterfaceInheritedImpl>();
}

std::string
CppNoexceptInterfaceFactory::call_get_foo(const std::shared_ptr<CppNoexceptInterface>& callback) noexcept {
    return callback->get_foo();
}

}
