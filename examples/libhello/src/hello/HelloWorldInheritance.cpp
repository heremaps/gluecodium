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

#include "hello/Circle.h"
#include "hello/HelloWorldStaticLogger.h"
#include "hello/InheritanceHelper.h"
#include "hello/Rectangle.h"
#include "hello/Shape.h"
#include "hello/Square.h"

#include <algorithm>
#include <iterator>
#include <sstream>
#include <string>

namespace
{
class RectangleImpl : public hello::Rectangle
{
public:
    RectangleImpl( ) = default;
    ~RectangleImpl( ) = default;

public:
    void
    scale( double scale_factor )
    {
        ::std::ostringstream stream;
        stream << "Scaling Rectangle native implementation with factor=" << scale_factor
               << ::std::endl;
        ::hello::HelloWorldStaticLogger::append( stream.str( ) );
    }
};

class CircleImpl : public hello::Circle
{
public:
    CircleImpl( ) = default;
    ~CircleImpl( ) = default;

public:
    void
    scale( double scale_factor )
    {
        ::std::ostringstream stream;
        stream << "Scaling Circle native implementation with factor=" << scale_factor
               << ::std::endl;
        ::hello::HelloWorldStaticLogger::append( stream.str( ) );
    }
};

class SquareImpl : public hello::Square
{
public:
    SquareImpl( ) = default;
    ~SquareImpl( ) = default;

public:
    void
    scale( double scale_factor )
    {
        ::std::ostringstream stream;
        stream << "Scaling Square native implementation with factor=" << scale_factor
               << ::std::endl;
        ::hello::HelloWorldStaticLogger::append( stream.str( ) );
    }
};

}  // namespace

namespace hello
{
::std::shared_ptr< Circle >
InheritanceHelper::create_circle( )
{
    return std::make_shared< CircleImpl >( );
}

::std::shared_ptr< Rectangle >
InheritanceHelper::create_rectangle( )
{
    return std::make_shared< RectangleImpl >( );
}

std::shared_ptr< Square >
InheritanceHelper::create_square( )
{
    return std::make_shared< SquareImpl >( );
}

void
InheritanceHelper::apply_scale_on(
    const double scale_factor, const ::std::vector<::std::shared_ptr<::hello::Shape > >& shapes )
{
    for ( const auto& shape : shapes )
    {
        if ( shape )
        {
            shape->scale( scale_factor );
        }
        else
        {
            ::hello::HelloWorldStaticLogger::append( "Scale applied on an invalid shape\n" );
        }
    }
}

}  // namespace hello
