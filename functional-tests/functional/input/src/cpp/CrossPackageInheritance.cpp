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

#include "foobar/CrossPackageChildClass.h"
#include "foobar/CrossPackageChildInterface.h"
#include "foobar/CrossPackageInheritanceFactory.h"
#include <memory>

namespace
{
class CrossPackageChildClassImpl: public foobar::CrossPackageChildClass,
                                  public std::enable_shared_from_this<CrossPackageChildClassImpl>
{
public:
    CrossPackageChildClassImpl( ) = default;
    ~CrossPackageChildClassImpl( ) = default;

    std::string
    get_name( ) override { return "Goody"; }

    std::shared_ptr<ParentInterface> cast_to_parent() override { return shared_from_this(); }

    int32_t get_lucky_number( ) const override { return 0; }
    void set_lucky_number( const int32_t number ) override {}
};

class CrossPackageChildInterfaceImpl: public foobar::CrossPackageChildInterface,
                                      public std::enable_shared_from_this<CrossPackageChildInterfaceImpl>
{
public:
    CrossPackageChildInterfaceImpl( ) = default;
    ~CrossPackageChildInterfaceImpl( ) = default;

    std::string
    get_name( ) override { return "Woody"; }

    std::shared_ptr<ParentInterface> cast_to_parent() override { return shared_from_this(); }

    int32_t get_lucky_number( ) const override { return 0; }
    void set_lucky_number( const int32_t number ) override {}
};

}

namespace foobar
{
std::shared_ptr<foobar::CrossPackageChildClass>
CrossPackageInheritanceFactory::create_child_class() {
    return std::make_shared<CrossPackageChildClassImpl>();
}

std::shared_ptr<foobar::CrossPackageChildInterface>
CrossPackageInheritanceFactory::create_child_interface() {
    return std::make_shared<CrossPackageChildInterfaceImpl>();
}

}
