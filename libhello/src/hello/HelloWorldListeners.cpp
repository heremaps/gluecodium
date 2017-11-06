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
HelloCalculatorListener::on_calculation_result( const double calculation_result )
{
    std::stringstream log_stream;
    log_stream << __PRETTY_FUNCTION__ << " called with result = " << calculation_result << std::endl;
    HelloWorldStaticLogger::append(log_stream.str());
}

void
HelloCalculatorListener::on_calculation_in_background_result( const double calculation_result )
{
    std::stringstream log_stream;
    log_stream << __PRETTY_FUNCTION__ << " called with result = " << calculation_result << std::endl;
    HelloWorldStaticLogger::append(log_stream.str());
}

::std::shared_ptr< ::hello::Calculator >
CalculatorFactory::create_calculator( )
{
    return ::std::make_shared< ::hello::HelloCalculator >( );
}

void
HelloCalculator::register_listener(
    const ::std::shared_ptr< ::hello::CalculatorListener >& listener )
{
    ::std::lock_guard< ::std::mutex > lock( m_listeners_mutex );

    bool registered
        = std::find( m_listeners.begin( ), m_listeners.end( ), listener ) != m_listeners.end( );
    std::string log_message;
    if ( registered )
    {
        log_message = " listener had been already registered before";
    }
    else
    {
        m_listeners.push_back( listener );
        log_message = " new registration for the listener";
    }

    std::stringstream log_stream;
    log_stream << __PRETTY_FUNCTION__ << log_message << std::endl;
    HelloWorldStaticLogger::append(log_stream.str());
}

void
HelloCalculator::unregister_listener(
    const ::std::shared_ptr< ::hello::CalculatorListener >& listener )
{
    ::std::lock_guard< ::std::mutex > lock( m_listeners_mutex );

    const auto iterator = std::find( m_listeners.begin( ), m_listeners.end( ), listener );
    std::string log_message;
    if ( iterator == m_listeners.end( ) )
    {
        log_message = " listener had not been registered before";
    }
    else
    {
        m_listeners.erase( iterator );
        log_message = " removed registration for the listener";
    }

    std::stringstream log_stream;
    log_stream << __PRETTY_FUNCTION__ << log_message << std::endl;
    HelloWorldStaticLogger::append(log_stream.str());
}

void
HelloCalculator::calculate( const ::hello::Calculator::Position& from_position,
                            const ::hello::Calculator::Position& to_position,
                            const ::std::shared_ptr< ::hello::CalculatorListener >& listener )
{
    double result = do_calculate( from_position, to_position );
    listener->on_calculation_result( result );
}

void
HelloCalculator::calculate_in_background( const ::hello::Calculator::Position& from_position,
                                        const ::hello::Calculator::Position& to_position )
{
    double result = do_calculate( from_position, to_position );

    ::std::vector< ::std::shared_ptr< ::hello::CalculatorListener > > listeners;
    {
        ::std::lock_guard< ::std::mutex > lock( m_listeners_mutex );
        listeners = m_listeners;
    }

    for ( const auto& listener : listeners )
    {
        listener->on_calculation_in_background_result( result );
    }
}
}
