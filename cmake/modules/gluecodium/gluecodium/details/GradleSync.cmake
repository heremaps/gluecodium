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

if(NOT GLUECODIUM_GRADLE_SYNCHRONISATION_DIR)
  message(FATAL_ERROR "GLUECODIUM_GRADLE_SYNCHRONISATION_DIR must be specified")
endif()

set(_lock_file "${GLUECODIUM_GRADLE_SYNCHRONISATION_DIR}/gluecodium-gradle-lock.cmake")

if(GLUECODIUM_VERBOSE)
  message("Using locking file to invocate gradle: ${_lock_file}")
endif()
file(LOCK ${_lock_file} TIMEOUT 600)
