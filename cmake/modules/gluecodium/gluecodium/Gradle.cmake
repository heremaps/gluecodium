# Copyright (C) 2016-2020 HERE Europe B.V.
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

if (NOT APIGEN_GLUECODIUM_DIR)
    message(FATAL_ERROR "APIGEN_GLUECODIUM_DIR must be specified")
endif ()

if (NOT APIGEN_OUTPUT_DIR)
    message(FATAL_ERROR "APIGEN_OUTPUT_DIR must be specified")
endif ()

if(APIGEN_COMMON_OUTPUT_DIR)
    set(_lock_directory ${APIGEN_COMMON_OUTPUT_DIR})
else()
    set(_lock_directory ${APIGEN_OUTPUT_DIR})
endif()

message ("Using locking file to invocate gradle: ${_lock_directory}-lock.cmake")
file (LOCK ${_lock_directory}-lock.cmake TIMEOUT 600)

if(WIN32)
  set(APIGEN_GLUECODIUM_GRADLE_WRAPPER ${APIGEN_GLUECODIUM_DIR}/gradlew.bat)
else()
  set(APIGEN_GLUECODIUM_GRADLE_WRAPPER ${APIGEN_GLUECODIUM_DIR}/gradlew)
endif()
