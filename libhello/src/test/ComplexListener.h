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

#include "test/ComplexNotifier.h"
#include "test/DistanceMetric.h"

namespace test
{
class ManhattanMetric : public DistanceMetric
{
public:

    ManhattanMetric( ) = default;

    ~ManhattanMetric( ) = default;

    double getLength( const ::std::vector< ::test::NamedPoint3D >& input ) override;
};

class ComplexNotifierImpl : public ComplexNotifier
{
public:

    ComplexNotifierImpl( )  = default;
    ~ComplexNotifierImpl( ) = default;

    void trajectoryCompleted(
        const ::std::vector< ::test::NamedPoint3D >& trajectory,
        const ::std::shared_ptr< ::test::ComplexListener >& listener ) override;

};

} // namespace test
