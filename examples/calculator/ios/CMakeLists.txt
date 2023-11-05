# Copyright (C) 2016-2023 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# License-Filename: LICENSE

cmake_minimum_required(VERSION 3.12)

project(gluecodium.calculator.app VERSION "1.0.0" LANGUAGES Swift)

set (APP_BUNDLE_IDENTIFIER "com.gluecodium.calculator.app")

set (PRODUCT_NAME "Gluecodium test app")
set (MACOSX_BUNDLE_EXECUTABLE_NAME gluecodium-calculator-app)
set (MACOSX_BUNDLE_INFO_STRING ${APP_BUNDLE_IDENTIFIER})
set (MACOSX_BUNDLE_GUI_IDENTIFIER ${APP_BUNDLE_IDENTIFIER})
set (MACOSX_BUNDLE_BUNDLE_NAME ${APP_BUNDLE_IDENTIFIER})
set (MACOSX_BUNDLE_ICON_FILE icon.icns)
set (MACOSX_BUNDLE_LONG_VERSION_STRING ${PROJECT_VERSION})
set (MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION})
set (MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})

add_executable (gluecodium-calculator-app MACOSX_BUNDLE
    "ContentView.swift"
    "gluecodium_calculator_appApp.swift")

set_target_properties (
    gluecodium-calculator-app
    PROPERTIES XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "${CMAKE_BINARY_DIR}/Debug-iphonesimulator"
               XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "/usr/lib/swift @executable_path/Frameworks"
               XCODE_GENERATE_SCHEME YES
               XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "$<IF:$<CONFIG:Debug>,-Onone,-O>"
               XCODE_EMBED_FRAMEWORKS_CODE_SIGN_ON_COPY TRUE)

add_dependencies (gluecodium-calculator-app mylibrary)
