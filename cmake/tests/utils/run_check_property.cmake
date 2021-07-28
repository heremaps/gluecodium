# Copyright (C) 2021 HERE Europe B.V.
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

foreach(_parameter PATH_TO_FILE_WITH_VARIABLES VARIABLE_NAME EXPECTED_VALUE)
  if(NOT ${_parameter})
    message(FATAL_ERROR "Required parameter is missing: ${_parameter}")
  endif()
endforeach()

if(NOT EXISTS ${PATH_TO_FILE_WITH_VARIABLES})
  message(FATAL_ERROR "Expected file is not found at ${PATH_TO_FILE_WITH_VARIABLES}")
endif()

include(${PATH_TO_FILE_WITH_VARIABLES})

if(NOT "${${VARIABLE_NAME}}" STREQUAL "${EXPECTED_VALUE}")
  message(
    FATAL_ERROR
      "Variable ${VARIABLE_NAME} was expected to be ${EXPECTED_VALUE}, but was ${${VARIABLE_NAME}}")
endif()
