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

#include "hello/Shape.h"
#include "hello/Circle.h"
#include "hello/Rectangle.h"
#include "hello/Square.h"
#include "hello/InheritanceHelper.h"
#include "hello/HelloWorldStaticLogger.h"

#include <string>
#include <algorithm>
#include <iterator>
#include <sstream>

namespace {
class RectangleImpl : public hello::Rectangle {
public:
  RectangleImpl() = default;
  ~RectangleImpl() = default;

public:
  void scale(double scale_factor) {
    ::std::ostringstream stream;
    stream << "Scaling Rectangle native implementation with factor=" << scale_factor << ::std::endl;
    ::hello::HelloWorldStaticLogger::append(stream.str());
  }
};


class CircleImpl : public hello::Circle {
public:
  CircleImpl() = default;
  ~CircleImpl() = default;

public:
  void scale(double scale_factor) {
    ::std::ostringstream stream;
    stream << "Scaling Circle native implementation with factor=" << scale_factor << ::std::endl;
    ::hello::HelloWorldStaticLogger::append(stream.str());
  }
};


class SquareImpl : public hello::Square {
public:
  SquareImpl() = default;
  ~SquareImpl() = default;

public:
  void scale(double scale_factor) {
    ::std::ostringstream stream;
    stream << "Scaling Square native implementation with factor=" << scale_factor << ::std::endl;
    ::hello::HelloWorldStaticLogger::append(stream.str());
  }
};

}

namespace hello {

::std::shared_ptr< Circle >
InheritanceHelper::create_circle() {
  return std::make_shared< CircleImpl >();
}

::std::shared_ptr< Rectangle >
InheritanceHelper::create_rectangle() {
  return std::make_shared< RectangleImpl >();
}

std::shared_ptr< Square >
InheritanceHelper::create_square() {
  return std::make_shared< SquareImpl >();
}


void InheritanceHelper::apply_scale_on(
  const double scale_factor,
  const ::std::vector< ::std::shared_ptr< ::hello::Shape > >& shapes ) {
  ::std::ostringstream oss;
  oss << "calling InheritanceHelper::apply_scale_on with factor=" << scale_factor <<
  " shapes.length = " << shapes.size() << "\n";
    ::hello::HelloWorldStaticLogger::append(oss.str());

  for (const auto& shape : shapes) {
    if (shape) {
      shape->scale(scale_factor);
    } else {
      ::hello::HelloWorldStaticLogger::append("Scale applied on an invalid shape\n");
    }
  }
}

}
