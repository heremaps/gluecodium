// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

#include "test/ComplexNotifier.h"
#include "test/DistanceMetric.h"

namespace test
{
class ManhattanMetric : public DistanceMetric
{
public:

    ManhattanMetric( ) = default;

    ~ManhattanMetric( ) = default;

    double get_length( const ::std::vector< ::test::NamedPoint3D >& input ) override;
};

class ComplexNotifierImpl : public ComplexNotifier
{
public:

    ComplexNotifierImpl( )  = default;
    ~ComplexNotifierImpl( ) = default;

    void trajectory_completed(
        const ::std::vector< ::test::NamedPoint3D >& trajectory,
        const ::test::TrajectoryQuality quality,
        const ::std::shared_ptr< ::std::vector< uint8_t > >& image,
        const ::std::shared_ptr< ::test::ComplexListener >& listener ) override;
};

} // namespace test
