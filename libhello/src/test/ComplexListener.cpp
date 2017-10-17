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
ManhattanMetric::getLength( const ::std::vector< ::test::NamedPoint3D >& input )
{
    double lengthTotal = 0;
    for ( int i = 1; i < input.size( ); ++i )
    {
        lengthTotal += fabs( input[ i - 1 ].pt.x - input[ i ].pt.x ) +
                       fabs( input[ i - 1 ].pt.y - input[ i ].pt.y ) +
                       fabs( input[ i - 1 ].pt.z - input[ i ].pt.z );
    }

    return lengthTotal;
}

void
ComplexNotifierImpl::trajectoryCompleted(
    const ::std::vector< ::test::NamedPoint3D >& trajectory,
    const ::std::shared_ptr< ::test::ComplexListener >& listener )
{
    listener->onTrajectoryCompleted( ComplexListenerFactory::createDistanceMetric( ), trajectory );
}

::std::shared_ptr< ::test::ComplexNotifier >
ComplexListenerFactory::createComplexNotifier( )
{
    return ::std::make_shared< ::test::ComplexNotifierImpl >( );
}

::std::shared_ptr< ::test::DistanceMetric >
ComplexListenerFactory::createDistanceMetric( )
{
    return ::std::make_shared< ::test::ManhattanMetric >( );
}
} // namespace test
