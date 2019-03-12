// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

#include "ComplexListener.h"
#include "test/ComplexListenerFactory.h"
#include <cmath>

namespace test
{
double
ManhattanMetric::get_length( const ::std::vector<::test::NamedPoint3D >& input )
{
    double length_total = 0;
    for ( int i = 1; i < input.size( ); ++i )
    {
        length_total += fabs( input[ i - 1 ].pt.x - input[ i ].pt.x )
                        + fabs( input[ i - 1 ].pt.y - input[ i ].pt.y )
                        + fabs( input[ i - 1 ].pt.z - input[ i ].pt.z );
    }

    return length_total;
}

void
ComplexNotifierImpl::trajectory_completed(

    const ::std::vector<::test::NamedPoint3D >& trajectory,
    const ::test::TrajectoryQuality quality,
    const ::std::shared_ptr<::std::vector< uint8_t > >& image,
    const ::std::shared_ptr<::test::ComplexListener >& listener )
{
    listener->on_trajectory_completed( ComplexListenerFactory::create_distance_metric( ),
                                       trajectory, quality, image );
}

::std::shared_ptr<::test::ComplexNotifier >
ComplexListenerFactory::create_complex_notifier( )
{
    return ::std::make_shared<::test::ComplexNotifierImpl >( );
}

::std::shared_ptr<::test::DistanceMetric >
ComplexListenerFactory::create_distance_metric( )
{
    return ::std::make_shared<::test::ManhattanMetric >( );
}
}  // namespace test
