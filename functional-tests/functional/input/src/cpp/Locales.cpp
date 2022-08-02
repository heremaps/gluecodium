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

#include "test/Locales.h"
#include "test/LocaleDefaults.h"
#include "test/LocaleGenerics.h"
#include "test/LocalesStruct.h"

namespace test
{
using namespace lorem_ipsum::test;

Locale s_locale = Locale(std::string{"foo"}, "bar", "baz");
std::string nonsense = "@#$%";

// Locales

Locale
Locales::locale_round_trip(const Locale& input) {
    return input;
}

Locale
Locales::locale_round_trip_strip_tag(const Locale& input) {
    return Locale(input.language_code, input.country_code, input.script_code);
}

std::optional<Locale>
Locales::locale_round_trip_nullable(const std::optional<Locale>& input) {
    return input;
}

Locale
Locales::get_locale_property() {
    return s_locale;
}

void
Locales::set_locale_property(const Locale& value) {
    s_locale = value;
}

Locale
Locales::get_locale_with_malformed_tag() {
    return Locale(nonsense);
}

Locale
Locales::get_locale_with_malformed_language() {
    return Locale(nonsense, "bar", "baz");
}

Locale
Locales::get_locale_with_malformed_country() {
    return Locale("foo", nonsense, "baz");
}

Locale
Locales::get_locale_with_malformed_script() {
    return Locale("foo", "bar", nonsense);
}

// LocalesStruct

LocalesStruct
LocalesStruct::locales_struct_round_trip(const LocalesStruct& input) {
    return input;
}

// LocaleGenerics

std::vector<Locale>
LocaleGenerics::locale_list_round_trip(const std::vector<Locale>& input) {
    return input;
}

std::unordered_set<Locale, hash<Locale>>
LocaleGenerics::locale_set_round_trip(const std::unordered_set<Locale, hash<Locale>>& input) {
    return input;
}

std::unordered_map<Locale, std::string, hash<Locale>>
LocaleGenerics::locale_keys_map_round_trip(
    const std::unordered_map<Locale, std::string, hash<Locale>>& input) {
    return input;
}

std::unordered_map<std::string, Locale>
LocaleGenerics::locale_values_map_round_trip(const std::unordered_map<std::string, Locale>& input) {
    return input;
}

// LocaleDefaults

LocaleDefaults
LocaleDefaults::get_cpp_defaults() { return {}; }

}
