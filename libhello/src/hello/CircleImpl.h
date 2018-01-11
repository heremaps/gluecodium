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

#pragma once

#include "hello/Circle.h"

namespace hello {
class CircleImpl : public Circle {
public:
  CircleImpl(double radius);
  ~CircleImpl() = default;

public:
  double get_radius();
  bool is_rectangle();
  ::std::string get_type();

private:
  double m_radius;
};
}
