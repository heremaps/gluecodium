// Copyright (c) 2017 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef HELLO_GEOLOCATION_H
#define HELLO_GEOLOCATION_H

#include "hello/config.h"
#include <iostream>

namespace hello
{

// Forward declarations
class GeoLocationImpl;

class HELLO_API GeoLocation
{
public:
    /**
     * @brief GeoLocation constructor
     */
    GeoLocation();
    virtual ~GeoLocation() = default;
};

} // namespace hello

#endif // HELLO_GEOLOCATION_H

