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

#include "test/ForecastFactory.h"
#include "test/ForecastListener.h"
#include "test/ForecastProvider.h"

#include "hello/HelloWorldStaticLogger.h"

#include <algorithm>
#include <memory>
#include <sstream>
#include <string>
#include <vector>

namespace
{
const ::test::CityDataMap data{{"Berlin", {-2, 26}}, {"Marrakesh", {8, 40}}, {"Madrid", {1, 33}}};

class MyForecastProvider : public ::test::ForecastProvider
{
public:
    MyForecastProvider( ) = default;
    ~MyForecastProvider( ) = default;

    void
    inform( const ::std::shared_ptr<::test::ForecastListener >& listener )
    {
        listener->on_forecast_data_provided( data );
    }
};

class MyForecastListener : public ::test::ForecastListener
{
public:
    MyForecastListener( ) = default;
    ~MyForecastListener( ) = default;

    void
    on_forecast_data_provided( const ::test::CityDataMap& data )
    {
        std::vector< std::string > cities;

        for ( const auto& entry : data )
        {
            cities.push_back( entry.first );
        }

        std::sort( cities.begin( ), cities.end( ) );

        std::ostringstream stream;

        for ( const auto& city : cities )
        {
            const auto range = data.at( city );
            stream << city << " -> "
                   << "[" << range.lowest_degree << ", " << range.highest_degree << "]"
                   << std::endl;
        }

        ::hello::HelloWorldStaticLogger::append( stream.str( ) );
    }
};
}  // namespace

namespace test
{
::std::shared_ptr<::test::ForecastProvider >
ForecastFactory::create_provider( )
{
    return std::make_shared< MyForecastProvider >( );
}

::std::shared_ptr<::test::ForecastListener >
ForecastFactory::create_listener( )
{
    return std::make_shared< MyForecastListener >( );
}
}  // namespace test
