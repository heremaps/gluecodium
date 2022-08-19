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

#include "test/ClassWithInternalLambda.h"
#include "test/Lambdas.h"

namespace test
{

Lambdas::Concatenator
Lambdas::get_concatenator(const std::string& delimiter)
{
    return [delimiter](const std::string& string1,
                       const std::string& string2){ return string1 + delimiter + string2; };
}

std::string
Lambdas::concatenate(const std::string& string1,
                     const std::string& string2,
                     const Lambdas::Concatenator& concatenator)
{
    return concatenator(string1, string2);
}

Lambdas::Tricatenator
Lambdas::compose_concatenators(const Lambdas::Concatenator& concatenator1,
                               const Lambdas::Concatenator& concatenator2)
{
    return [concatenator1, concatenator2](
        const std::string& string1,
        const std::string& string2,
        const std::string& string3) {
            return concatenator2(concatenator1(string1, string2), string3);
        };
}

std::string
Lambdas::concatenate_list(const std::vector<std::string>& strings,
                          const std::vector<Lambdas::Concatenator>& concatenators)
{
    std::string result = strings[0];
    for (int i = 0; i < concatenators.size(); i++)
    {
        result = concatenators[i](result, strings[i+1]);
    }
    return result;
}

Lambdas::LambdaHolder
Lambdas::get_concatenator_in_struct(const std::string& delimiter)
{
    return Lambdas::LambdaHolder{[delimiter](const std::string& string1,
                                             const std::string& string2){ return string1 + delimiter + string2; }};
}

std::string
Lambdas::concatenate_in_struct(const std::string& string1,
                     const std::string& string2,
                     const Lambdas::LambdaHolder& concatenator)
{
    return concatenator.concatenator(string1, string2);
}

std::optional<Lambdas::Concatenator>
Lambdas::get_concatenator_or_null(const std::optional<std::string>& delimiter)
{
    if (!delimiter) return {};
    return {[delimiter](const std::string& string1,
                        const std::string& string2){ return string1 + *delimiter + string2; }};
}

std::optional<std::string>
Lambdas::concatenate_or_not(const std::string& string1,
                            const std::string& string2,
                            const std::optional<Lambdas::Concatenator>& concatenator)
{
    if (!concatenator) return {};
    return (*concatenator)(string1, string2);
}

namespace
{
Lambdas::Concatenator s_real_concatenator{};
}

Lambdas::Concatenator
Lambdas::get_real_concatenator()
{
    return s_real_concatenator;
}

void
Lambdas::set_real_concatenator(const Lambdas::Concatenator& value)
{
    s_real_concatenator = value;
}

void
Lambdas::reset_real_concatenator()
{
    s_real_concatenator = {};
}

Lambdas::NullableConfuser
Lambdas::get_nullable_confuser()
{
    return [](const std::optional<std::string>& value) ->
        std::optional<StandaloneProducer>
        {
            if (value) {
                return { [value] { return *value; } };
            } else {
                return {};
            }
        };
}

std::optional<StandaloneProducer>
Lambdas::apply_nullable_confuser(const Lambdas::NullableConfuser& confuser,
                                 const std::optional<std::string>& value)
{
    return confuser(value);
}

bool
ClassWithInternalLambda::invoke_internal_lambda(const InternalLambda& lambda,
                                                const std::string& value) {
    return lambda(value);
}

}
