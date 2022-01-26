// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2022 HERE Europe B.V.
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

#include "test/NoCacheClass.h"
#include "test/NoCacheHelper.h"
#include "test/NoCacheInterface.h"
#include <memory>

namespace test
{
namespace {

class NoCacheInterfaceImpl: public NoCacheInterface {
public:
    void foo() override { }
};

class NoCacheClassImpl: public NoCacheClass {
public:
    void foo() override { }
};

}

std::shared_ptr<NoCacheClass>
NoCacheClass::make() {
    return std::make_shared<NoCacheClassImpl>();
}

std::shared_ptr<NoCacheInterface>
NoCacheHelper::get_no_cache_interface() {
    static std::shared_ptr<NoCacheInterface> s_instance = std::make_shared<NoCacheInterfaceImpl>();
    return s_instance;
}

std::shared_ptr<NoCacheClass>
NoCacheHelper::get_no_cache_class() {
    static std::shared_ptr<NoCacheClass> s_instance = std::make_shared<NoCacheClassImpl>();
    return s_instance;
}

bool
NoCacheHelper::compare_no_cache_interface(
    const std::shared_ptr<NoCacheInterface>& instance1,
    const std::shared_ptr<NoCacheInterface>& instance2
) {
    return instance1 == instance2;
}

}
