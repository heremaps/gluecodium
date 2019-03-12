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
    auto euclideanDistance = std::sqrt( deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ );

    return euclideanDistance;
}

static int
get_instance_id( )
{
    static int id = 0;
    return ++id;
}
}  // namespace

namespace hello
{
HelloCalculatorListener::HelloCalculatorListener( )
    : m_instance_id( get_instance_id( ) )
{
}

void
HelloCalculatorListener::on_calculation_result( const double calculation_result )
{
    std::stringstream log_stream;
    log_stream << "C++ listener " << m_instance_id << " synchronous: " << calculation_result
               << std::endl;
    HelloWorldStaticLogger::append( log_stream.str( ) );
}

void
HelloCalculatorListener::on_calculation_in_background_result( const double calculation_result )
{
    std::stringstream log_stream;
    log_stream << "C++ listener " << m_instance_id << " background: " << calculation_result
               << std::endl;
    HelloWorldStaticLogger::append( log_stream.str( ) );
}

::std::shared_ptr<::hello::Calculator >
CalculatorFactory::create_calculator( )
{
    return ::std::make_shared<::hello::HelloCalculator >( );
}

void
HelloCalculator::register_listener(
    const ::std::shared_ptr<::hello::CalculatorListener >& listener )
{
    ::std::lock_guard<::std::mutex > lock( m_listeners_mutex );

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
    HelloWorldStaticLogger::append( log_stream.str( ) );
}

void
HelloCalculator::unregister_listener(
    const ::std::shared_ptr<::hello::CalculatorListener >& listener )
{
    ::std::lock_guard<::std::mutex > lock( m_listeners_mutex );

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
    HelloWorldStaticLogger::append( log_stream.str( ) );
}

void
HelloCalculator::remove_all_listeners( )
{
    ::std::lock_guard<::std::mutex > lock( m_listeners_mutex );
    m_listeners.clear( );
    std::stringstream log_stream;
    log_stream << __PRETTY_FUNCTION__ << " removed registration for all listeners" << std::endl;
    HelloWorldStaticLogger::append( log_stream.str( ) );
}

void
HelloCalculator::calculate( const ::hello::Calculator::Position& from_position,
                            const ::hello::Calculator::Position& to_position,
                            const ::std::shared_ptr<::hello::CalculatorListener >& listener )
{
    double result = do_calculate( from_position, to_position );
    listener->on_calculation_result( result );
}

void
HelloCalculator::calculate_in_background( const ::hello::Calculator::Position& from_position,
                                          const ::hello::Calculator::Position& to_position )
{
    double result = do_calculate( from_position, to_position );

    ::std::vector<::std::shared_ptr<::hello::CalculatorListener > > listeners;
    {
        ::std::lock_guard<::std::mutex > lock( m_listeners_mutex );
        listeners = m_listeners;
    }

    for ( const auto& listener : listeners )
    {
        listener->on_calculation_in_background_result( result );
    }
}
}  // namespace hello
