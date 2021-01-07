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

internal class ColorConverter {
    static func convertFromInternal(_ internalColor: PseudoColor_internal) -> PseudoColor {
        let alpha = UInt64((internalColor.alpha * 255).rounded()) << 24
        let red = UInt64((internalColor.red * 255).rounded()) << 16
        let green = UInt64((internalColor.green * 255).rounded()) << 8
        let blue = UInt64((internalColor.blue * 255).rounded())
        return PseudoColor(alpha + red + green + blue)
    }

    static func convertToInternal(_ systemColor: PseudoColor) -> PseudoColor_internal {
        return PseudoColor_internal(
            red: Float((systemColor.value >> 16) & 0xFF) / 255.0,
            green: Float((systemColor.value >> 8) & 0xFF) / 255.0,
            blue: Float(systemColor.value & 0xFF) / 255.0,
            alpha: Float((systemColor.value >> 24) & 0xFF) / 255.0
        )
    }
}
