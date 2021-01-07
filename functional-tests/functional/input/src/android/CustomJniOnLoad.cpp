/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
 *
 *
 *
 */

// Include JniBase to have the renamed generated method declared
#include "JniBase.h"

int
JNI_OnLoad( JavaVM* vm, void* ptr )
{
    // Custom on load behaviour can go here

    // Make sure Gluecodiums JNI_OnLoad is called!
    // Just use the define instead of hardcoding the name here.
    GLUECODIUM_JNI_ONLOAD( vm, ptr );

    return JNI_VERSION_1_6;
}

