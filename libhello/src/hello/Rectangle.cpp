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

#include "RectangleImpl.h"

namespace hello {

std::shared_ptr<Rectangle> Rectangle::create_rectangle(const double width,
                                                       const double heigth) {
  return std::make_shared<RectangleImpl>(width, heigth);
}
}
