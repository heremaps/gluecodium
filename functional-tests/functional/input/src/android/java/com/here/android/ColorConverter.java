/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */
package com.here.android.test;

class ColorConverter {
  static Integer convertFromInternal(SystemColor internalColor) {
    return android.graphics.Color.argb(
        Math.round(internalColor.alpha * 255),
        Math.round(internalColor.red * 255),
        Math.round(internalColor.green * 255),
        Math.round(internalColor.blue * 255));
  }

  static SystemColor convertToInternal(Integer systemColor) {
    return new SystemColor(
        android.graphics.Color.red(systemColor) / 255.0f,
        android.graphics.Color.green(systemColor) / 255.0f,
        android.graphics.Color.blue(systemColor) / 255.0f,
        android.graphics.Color.alpha(systemColor) / 255.0f);
  }
}
