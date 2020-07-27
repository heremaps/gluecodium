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

import "test/int.dart";

class ColorConverter {
  static int convertFromInternal(int_internal internalColor) {
    final alpha = (internalColor.alpha * 255).round() << 24;
    final red = (internalColor.red * 255).round() << 16;
    final green = (internalColor.green * 255).round() << 8;
    final blue = (internalColor.blue * 255).round();
    return alpha + red + green + blue;
  }

  static int_internal convertToInternal(int systemColor) =>
    int_internal(
        ((systemColor >> 16) & 0xFF) / 255.0,
        ((systemColor >> 8) & 0xFF) / 255.0,
        (systemColor & 0xFF) / 255.0,
        ((systemColor >> 24) & 0xFF) / 255.0
    );
}
