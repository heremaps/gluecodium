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

#include "test/InstancesFactory.h"
#include "test/ImplementableInstance.h"
#include "test/CachedRefInstance.h"
#include "Instances.h"
#include <memory>
#include <string>
#include <thread>
#include <vector>

namespace test
{
class NativeCachedRefInstance final : public CachedRefInstance
{
public:
    const std::vector<std::string>& get_items() const override { return items; }
    const std::string& get_label() const override { return label; }

private:
    const std::vector<std::string> items{"native", "items"};
    const std::string label{"native label"};
};

namespace
{
std::string join(const std::vector<std::string>& values)
{
    std::string result;
    for (const auto& value : values) result += (result.empty() ? "" : ",") + value;
    return result;
}

std::string read_cached_ref(const std::shared_ptr<CachedRefInstance>& instance)
{
    const auto& first_items = instance->get_items();
    const auto& second_items = instance->get_items();
    const auto& first_label = instance->get_label();
    const auto& second_label = instance->get_label();
    const bool stable = &first_items == &second_items && &first_label == &second_label;
    return std::string(stable ? "stable" : "unstable") + "|" + join(first_items) + "|" + first_label;
}

std::shared_ptr<CachedRefInstance> retained_cached_ref;
const std::vector<std::string>* retained_items = nullptr;
}
class NativeImplementableInstance final : public ImplementableInstance
{
public:
    std::string get_title() const override { return "native"; }
    std::string describe() override { return "native description"; }
    ::lorem_ipsum::test::Return<std::string, std::error_code> get_message() override { return std::string("native message"); }
    std::shared_ptr<ImplementableInstance> echo(const std::shared_ptr<ImplementableInstance>& other) override { return other; }
};

std::string ImplementableInstance::default_title()
{
    return "default";
}

std::shared_ptr<CachedRefInstance> InstancesFactory::create_cached_ref_instance()
{
    return std::make_shared<NativeCachedRefInstance>();
}

std::string InstancesFactory::read_cached_ref_instance(const std::shared_ptr<CachedRefInstance>& instance)
{
    return read_cached_ref(instance);
}

std::string InstancesFactory::read_cached_ref_instance_on_worker(const std::shared_ptr<CachedRefInstance>& instance)
{
    std::string result;
    std::thread worker([&] { result = read_cached_ref(instance); });
    worker.join();
    return result;
}

void InstancesFactory::retain_cached_ref_items(const std::shared_ptr<CachedRefInstance>& instance)
{
    retained_cached_ref = instance;
    retained_items = &instance->get_items();
}

std::string InstancesFactory::read_retained_cached_ref_items()
{
    if (retained_items == nullptr) return "none";
    const bool same = &retained_cached_ref->get_items() == retained_items;
    return std::string(same ? "same" : "moved") + "|" + join(*retained_items);
}

void InstancesFactory::clear_retained_cached_ref_items()
{
    retained_items = nullptr;
    retained_cached_ref.reset();
}

std::shared_ptr<ImplementableInstance> InstancesFactory::create_implementable_instance()
{
    return std::make_shared<NativeImplementableInstance>();
}

std::string InstancesFactory::read_implementable_instance(const std::shared_ptr<ImplementableInstance>& instance)
{
    return instance->get_title() + ":" + instance->describe();
}

std::shared_ptr<ImplementableInstance> InstancesFactory::echo_implementable_instance(
    const std::shared_ptr<ImplementableInstance>& instance,
    const std::shared_ptr<ImplementableInstance>& other)
{
    return instance->echo(other);
}

std::string InstancesFactory::read_implementable_instance_on_worker(const std::shared_ptr<ImplementableInstance>& instance)
{
    std::string result;
    std::thread worker([&] { result = read_implementable_instance(instance); });
    worker.join();
    return result;
}

namespace
{
std::shared_ptr<ImplementableInstance> retained_instance;
}

void InstancesFactory::retain_implementable_instance(const std::shared_ptr<ImplementableInstance>& instance)
{
    retained_instance = instance;
}

std::shared_ptr<ImplementableInstance> InstancesFactory::get_retained_implementable_instance()
{
    return retained_instance;
}

void InstancesFactory::clear_retained_implementable_instance()
{
    retained_instance.reset();
}

::lorem_ipsum::test::Return<std::string, std::error_code>
InstancesFactory::get_implementable_message(const std::shared_ptr<ImplementableInstance>& instance)
{
    return instance->get_message();
}

::std::shared_ptr< SimpleInstantiableOne >
InstancesFactory::create_simple_instantiable_one( )
{
    return ::std::make_shared< SimpleInstanceOne >( );
}

::std::shared_ptr< SimpleInstantiableTwo >
InstancesFactory::create_simple_instantiable_two( )
{
    return ::std::make_shared< SimpleInstanceTwo >( );
}

::std::shared_ptr< NestedInstantiableOne >
InstancesFactory::create_nested_instantiable_one( )
{
    return ::std::make_shared< NestedInstanceOne >( );
}

::std::shared_ptr< NestedInstantiableTwo >
InstancesFactory::create_nested_instantiable_two( )
{
    return ::std::make_shared< NestedInstanceTwo >( );
}

}  // namespace test
