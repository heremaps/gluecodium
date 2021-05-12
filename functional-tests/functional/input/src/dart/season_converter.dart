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
  static String convertFromInternal(StringInternal internalSeason) {
    switch (internalSeason) {
      case StringInternal.winter:
        return "winter";
      case StringInternal.spring:
        return "spring";
      case StringInternal.summer:
        return "summer";
      case StringInternal.autumn:
        return "autumn";
    }
  }

  static StringInternal convertToInternal(String systemSeason) {
    switch (systemSeason) {
      case "winter":
        return StringInternal.winter;
      case "spring":
        return StringInternal.spring;
      case "summer":
        return StringInternal.summer;
      case "autumn":
        return StringInternal.autumn;
    }
  }
}
