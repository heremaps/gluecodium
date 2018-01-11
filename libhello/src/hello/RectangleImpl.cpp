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
RectangleImpl::RectangleImpl(double width, double height)
    : m_width(width), m_height(height) {}

bool RectangleImpl::is_rectangle() { return true; }

::std::string RectangleImpl::get_type()
{
    return "Rectangle";
}

double RectangleImpl::get_width() { return m_width; }

double RectangleImpl::get_height() { return m_height; }
}
