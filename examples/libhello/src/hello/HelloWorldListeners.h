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

#pragma once

#include "hello/Calculator.h"
#include "hello/CalculatorListener.h"

#include <mutex>
#include <vector>

namespace hello
{
class HelloCalculatorListener : public CalculatorListener
{
public:
    HelloCalculatorListener( );
    ~HelloCalculatorListener( ) = default;

public:
    /**
     * The method to call on the listener when the calculation is done
     */
    void on_calculation_result( const double calculation_result ) override;

    /**
     * The method to call on the listener when the background calculation
     * is done
     */
    void on_calculation_in_background_result( const double calculation_result ) override;

private:
    int m_instance_id;
};

class HelloCalculator : public Calculator
{
public:
    HelloCalculator( ) = default;
    ~HelloCalculator( ) = default;

    /**
     * register listener to calculateInBackground results notifications
     */
    void register_listener(
        const ::std::shared_ptr<::hello::CalculatorListener >& listener ) override;

    /**
     * unregister listener to calculateInBackground results notifications
     */
    void unregister_listener(
        const ::std::shared_ptr<::hello::CalculatorListener >& listener ) override;

    /**
     * removes all listeners to calculateInBackground results notifications
     */
    void remove_all_listeners( ) override;

    /**
     * Compute the Euclidean distance between two positions.
     *     It is guaranteed that listener will be called before method returns
     */
    void calculate( const ::hello::Calculator::Position& from_position,
                    const ::hello::Calculator::Position& to_position,
                    const ::std::shared_ptr<::hello::CalculatorListener >& listener ) override;

    /**
     * start computing the Euclidean distance between two positions and notify the
     * registered listeners when it is done
     */
    void calculate_in_background( const ::hello::Calculator::Position& from_position,
                                  const ::hello::Calculator::Position& to_position ) override;

private:
    ::std::vector<::std::shared_ptr<::hello::CalculatorListener > > m_listeners;
    ::std::mutex m_listeners_mutex;
};
}  // namespace hello
