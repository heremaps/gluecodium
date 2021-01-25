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

cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/gluecodium/CheckArguments)

set(_test_prefix_TEST_ARGUMENT_NAME ON)
gluecodium_require_argument(_test_prefix TEST_ARGUMENT_NAME test_function_name)
gluecodium_check_no_unparsed_arguments(_test_prefix test_function_name)
gluecodium_deprecate_argument(_test_prefix TEST_ARGUMENT_NAME test_function_name)
gluecodium_deprecate_argument_renamed(_test_prefix TEST_ARGUMENT_NAME TEST_NEW_ARGUMENT_NAME
                                      test_function_name)
