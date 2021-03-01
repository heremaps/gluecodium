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
#include "test/LocalesStruct.h"

namespace test
{
lorem_ipsum::test::Locale s_locale = lorem_ipsum::test::Locale(std::string{"foo"}, "bar", "baz");
std::string nonsense = "@#$%";

lorem_ipsum::test::Locale
Locales::locale_round_trip(const lorem_ipsum::test::Locale& input) {
    return input;
}

lorem_ipsum::test::Locale
Locales::locale_round_trip_strip_tag(const lorem_ipsum::test::Locale& input) {
    return lorem_ipsum::test::Locale(input.language_code, input.country_code, input.script_code);
}

lorem_ipsum::test::optional<lorem_ipsum::test::Locale>
Locales::locale_round_trip_nullable(
    const lorem_ipsum::test::optional<lorem_ipsum::test::Locale>& input) {
    return input;
}

lorem_ipsum::test::Locale
Locales::get_locale_property() {
    return s_locale;
}

void
Locales::set_locale_property(const lorem_ipsum::test::Locale& value) {
    s_locale = value;
}

lorem_ipsum::test::Locale
Locales::get_locale_with_malformed_tag() {
    return lorem_ipsum::test::Locale(nonsense);
}

lorem_ipsum::test::Locale
Locales::get_locale_with_malformed_language() {
    return lorem_ipsum::test::Locale(nonsense, "bar", "baz");
}

lorem_ipsum::test::Locale
Locales::get_locale_with_malformed_country() {
    return lorem_ipsum::test::Locale("foo", nonsense, "baz");
}

lorem_ipsum::test::Locale
Locales::get_locale_with_malformed_script() {
    return lorem_ipsum::test::Locale("foo", "bar", nonsense);
}

LocalesStruct
LocalesStruct::locales_struct_round_trip(const LocalesStruct& input) {
    return input;
}

}
