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

#include "HelloWorldListeners.h"
#include "hello/CalculatorFactory.h"
#include "hello/HelloWorldStaticLogger.h"

#include <cmath>

#include <algorithm>
#include <iostream>
#include <sstream>

namespace
{
double
do_calculate( const ::hello::Calculator::Position& fromPosition,
              const ::hello::Calculator::Position& toPosition )
{
    auto deltaX = static_cast< double >( fromPosition.x - toPosition.x );
    auto deltaY = static_cast< double >( fromPosition.y - toPosition.y );
    auto deltaZ = static_cast< double >( fromPosition.z - toPosition.z );
    auto euclideanDistance = std::sqrt( deltaX * deltaX + deltaY * deltaY  + deltaZ * deltaZ );

    return euclideanDistance;
}
}

namespace hello
{
void
HelloCalculatorListener::onCalculationResult( const double calculationResult )
{
    std::stringstream logStream;
    logStream << __PRETTY_FUNCTION__ << " called with result = " << calculationResult << std::endl;
    HelloWorldStaticLogger::append(logStream.str());
}

void
HelloCalculatorListener::onCalculationInBackgroundResult( const double calculationResult )
{
    std::stringstream logStream;
    logStream << __PRETTY_FUNCTION__ << " called with result = " << calculationResult << std::endl;
    HelloWorldStaticLogger::append(logStream.str());
}

::std::shared_ptr< ::hello::Calculator >
CalculatorFactory::createCalculator( )
{
    return ::std::make_shared< ::hello::HelloCalculator >( );
}

void
HelloCalculator::registerListener(
    const ::std::shared_ptr< ::hello::CalculatorListener >& listener )
{
    ::std::lock_guard< ::std::mutex > lock( m_listeners_mutex );

    bool registered
        = std::find( m_listeners.begin( ), m_listeners.end( ), listener ) != m_listeners.end( );
    std::string logMessage;
    if ( registered )
    {
        logMessage = " listener had been already registered before";
    }
    else
    {
        m_listeners.push_back( listener );
        logMessage = " new registration for the listener";
    }

    std::stringstream logStream;
    logStream << __PRETTY_FUNCTION__ << logMessage << std::endl;
    HelloWorldStaticLogger::append(logStream.str());
}

void
HelloCalculator::unregisterListener(
    const ::std::shared_ptr< ::hello::CalculatorListener >& listener )
{
    ::std::lock_guard< ::std::mutex > lock( m_listeners_mutex );

    const auto iterator = std::find( m_listeners.begin( ), m_listeners.end( ), listener );
    std::string logMessage;
    if ( iterator == m_listeners.end( ) )
    {
        logMessage = " listener had not been registered before";
    }
    else
    {
        m_listeners.erase( iterator );
        logMessage = " removed registration for the listener";
    }

    std::stringstream logStream;
    logStream << __PRETTY_FUNCTION__ << logMessage << std::endl;
    HelloWorldStaticLogger::append(logStream.str());
}

void
HelloCalculator::calculate( const ::hello::Calculator::Position& fromPosition,
                            const ::hello::Calculator::Position& toPosition,
                            const ::std::shared_ptr< ::hello::CalculatorListener >& listener )
{
    double result = do_calculate( fromPosition, toPosition );
    listener->onCalculationResult( result );
}

void
HelloCalculator::calculateInBackground( const ::hello::Calculator::Position& fromPosition,
                                        const ::hello::Calculator::Position& toPosition )
{
    double result = do_calculate( fromPosition, toPosition );

    ::std::vector< ::std::shared_ptr< ::hello::CalculatorListener > > listeners;
    {
        ::std::lock_guard< ::std::mutex > lock( m_listeners_mutex );
        listeners = m_listeners;
    }

    for ( const auto& listener : listeners )
    {
        listener->onCalculationInBackgroundResult( result );
    }
}
}
