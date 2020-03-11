#!/bin/bash
#
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

CMAKE_VERSION=3.15.7

wget -nv https://cmake.org/files/v${CMAKE_VERSION%.*}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz
tar xf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz > /dev/null
mv cmake-${CMAKE_VERSION}-Linux-x86_64 cmake-install

export PATH=${PWD}/cmake-install:${PWD}/cmake-install/bin:${PATH}
