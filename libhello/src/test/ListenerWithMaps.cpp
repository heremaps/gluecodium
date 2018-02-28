// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "test/ForecastProvider.h"
#include "test/ForecastListener.h"
#include "test/ForecastFactory.h"

#include "hello/HelloWorldStaticLogger.h"

#include <string>
#include <vector>
#include <algorithm>
#include <sstream>
#include <memory>

namespace
{
class MyForecastProvider : public ::test::ForecastProvider
{
public:
    MyForecastProvider( ) = default;
    ~MyForecastProvider( ) = default;

    void
    inform( const ::std::shared_ptr< ::test::ForecastListener >& listener )
    {
        const ::test::CityDataMap data{
            {"Berlin", {-2, 26}}, {"Marrakesh", {8, 40}}, {"Madrid", {1, 33}}};

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
}

namespace test
{
::std::shared_ptr< ::test::ForecastProvider >
ForecastFactory::create_provider( )
{
    return std::make_shared< MyForecastProvider >( );
}

::std::shared_ptr< ::test::ForecastListener >
ForecastFactory::create_listener( )
{
    return std::make_shared< MyForecastListener >( );
}
}
