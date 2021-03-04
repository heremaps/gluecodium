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

import "test/string.dart";

class SeasonConverter {
  static String convertFromInternal(String_internal internalSeason) {
    switch (internalSeason) {
      case String_internal.winter:
        return "winter";
      case String_internal.spring:
        return "spring";
      case String_internal.summer:
        return "summer";
      case String_internal.autumn:
        return "autumn";
      default:
        return "";
    }
  }

  static String_internal convertToInternal(String systemSeason) {
    switch (systemSeason) {
      case "winter":
        return String_internal.winter;
      case "spring":
        return String_internal.spring;
      case "summer":
        return String_internal.summer;
      case "autumn":
        return String_internal.autumn;
      default:
        return String_internal.winter;
    }
  }
}
