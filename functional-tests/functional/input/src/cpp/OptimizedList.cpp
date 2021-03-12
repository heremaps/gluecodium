// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

#include "test/VeryBigStruct.h"
#include "test/UnreasonablyLazyClass.h"
#include "test/UseOptimizedList.h"
#include "test/UseOptimizedListStruct.h"

namespace test
{
class UnreasonablyLazyClassImpl: public UnreasonablyLazyClass {
public:
    ~UnreasonablyLazyClassImpl( ) override = default;
};

std::vector<std::shared_ptr<VeryBigStruct>>
UseOptimizedList::fetch_the_big_ones() {
    return std::vector<std::shared_ptr<VeryBigStruct>>{
        std::make_shared<VeryBigStruct>("foo"),
        std::make_shared<VeryBigStruct>("bar")
    };
}

std::vector<std::shared_ptr<UnreasonablyLazyClass>>
UseOptimizedList::get_lazy_ones() {
    return std::vector<std::shared_ptr<UnreasonablyLazyClass>>{
        std::make_shared<UnreasonablyLazyClassImpl>(),
        std::make_shared<UnreasonablyLazyClassImpl>()
    };
}

UseOptimizedListStruct
UseOptimizedList::get_struct() {
    return UseOptimizedListStruct{
        std::vector<std::shared_ptr<VeryBigStruct>>{
            std::make_shared<VeryBigStruct>("foo"),
            std::make_shared<VeryBigStruct>("bar")
        },
        std::vector<std::shared_ptr<UnreasonablyLazyClass>>{
            std::make_shared<UnreasonablyLazyClassImpl>(),
            std::make_shared<UnreasonablyLazyClassImpl>()
        }
    };
}

}
