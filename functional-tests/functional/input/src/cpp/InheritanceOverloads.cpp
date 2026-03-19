// -------------------------------------------------------------------------------------------------
// Copyright (C) 2026 HERE Europe B.V.
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

#include "test/ChildClassDerivedFromParentType.h"
#include "test/ChildClassImplementingInterfaceType.h"
#include "test/ChildClassImplementingMultipleInterfaceTypes.h"

namespace test {

class ChildClassImplementingInterfaceTypeImpl : public ChildClassImplementingInterfaceType {
public:
    ~ChildClassImplementingInterfaceTypeImpl() override = default;

    int refresh(const ::test::MagicHandle& handle, const ::std::string& label) override {
        return 1;
    }

    int refresh( const ::test::ParentMethodParameters& handles, const ::std::string& label) override {
        return 3;
    }
};

::std::shared_ptr<ChildClassImplementingInterfaceType> ChildClassImplementingInterfaceType::make() {
    return std::make_shared<ChildClassImplementingInterfaceTypeImpl>();
}

class ChildClassDerivedFromParentTypeImpl : public ChildClassDerivedFromParentType {
public:
    ~ChildClassDerivedFromParentTypeImpl() override = default;

    int refresh(const ::test::MagicHandle& handle, const ::std::string& label) override {
        return 111;
    }

    int refresh( const ::test::ParentMethodParameters& handles, const ::std::string& label) override {
        return 333;
    }
};

::std::shared_ptr<ChildClassDerivedFromParentType> ChildClassDerivedFromParentType::make() {
    return std::make_shared<ChildClassDerivedFromParentTypeImpl>();
}

class ChildClassImplementingMultipleInterfaceTypesImpl : public ChildClassImplementingMultipleInterfaceTypes {
public:
    ~ChildClassImplementingMultipleInterfaceTypesImpl() override = default;

    int refresh(const std::string& label) override {
        return 777;
    }

    int refresh(const ::test::MagicHandle& handle, const ::std::string& label) override {
        return 666;
    }

    int refresh( const ::test::ParentMethodParameters& handles, const ::std::string& label) override {
        return 555;
    }
};

::std::shared_ptr<ChildClassImplementingMultipleInterfaceTypes> ChildClassImplementingMultipleInterfaceTypes::make() {
    return std::make_shared<ChildClassImplementingMultipleInterfaceTypesImpl>();
}

}