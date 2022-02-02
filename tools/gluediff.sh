#!/bin/bash
#
# Copyright (C) 2016-2022 HERE Europe B.V.
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

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

USAGE="Usage: $ ${0} FILE1 FILE2 DIFF_TOOL [ADDITIONAL_GLUECODIUM_OPTIONS]"

if [[ $# -lt 3 ]]; then
    echo ${USAGE}
    exit 2
fi

FILE1=${1}
FILE2=${2}
DIFF_TOOL=${3}
shift 3 # Use the rest of args verbatim with $* below.

TMP_DIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'tmpdir')
mkdir "${TMP_DIR}/1"
mkdir "${TMP_DIR}/2"

pushd "${SCRIPT_DIR}/launcher" > /dev/null
gradle run --args="-input '${FILE1}' -output '${TMP_DIR}/1' $*"
gradle run --args="-input '${FILE2}' -output '${TMP_DIR}/2' $*"
popd > /dev/null

${DIFF_TOOL} "${TMP_DIR}/1" "${TMP_DIR}/2"
rm -rf ${TMP_DIR}
