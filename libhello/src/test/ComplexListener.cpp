// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "ComplexListener.h"
#include "test/ComplexListenerFactory.h"
#include <cmath>

namespace test
{

double
ManhattanMetric::get_length( const ::std::vector< ::test::NamedPoint3D >& input )
{
    double length_total = 0;
    for ( int i = 1; i < input.size( ); ++i )
    {
        length_total += fabs( input[ i - 1 ].pt.x - input[ i ].pt.x ) +
                        fabs( input[ i - 1 ].pt.y - input[ i ].pt.y ) +
                        fabs( input[ i - 1 ].pt.z - input[ i ].pt.z );
    }

    return length_total;
}

void
ComplexNotifierImpl::trajectory_completed(

    const ::std::vector< ::test::NamedPoint3D >& trajectory,
    const ::test::TrajectoryQuality quality,
    const ::std::vector< uint8_t >& image,
    const ::std::shared_ptr< ::test::ComplexListener >& listener )
{
    listener->on_trajectory_completed( ComplexListenerFactory::create_distance_metric( ),
                                     trajectory,
                                     quality,
                                     image );
}

::std::shared_ptr< ::test::ComplexNotifier >
ComplexListenerFactory::create_complex_notifier( )
{
    return ::std::make_shared< ::test::ComplexNotifierImpl >( );
}

::std::shared_ptr< ::test::DistanceMetric >
ComplexListenerFactory::create_distance_metric( )
{
    return ::std::make_shared< ::test::ManhattanMetric >( );
}
} // namespace test
