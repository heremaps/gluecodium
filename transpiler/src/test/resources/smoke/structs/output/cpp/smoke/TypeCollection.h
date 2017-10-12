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
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>
#include <limits>
#include <string>
#include <vector>

namespace smoke {

struct Point {
    double x = std::numeric_limits< double >::quiet_NaN( );
    double y = std::numeric_limits< double >::quiet_NaN( );
};
using PointTypedef = ::smoke::Point;
struct Color {
    uint8_t red = 0;
    uint8_t green = 0;
    uint8_t blue = 0;
};
struct Line {
    ::smoke::Point a;
    ::smoke::Point b;
};
struct ColoredLine {
    ::smoke::Line line;
    ::smoke::Color color;
};
struct AllTypesStruct {
    int8_t int8Field = 0;
    uint8_t uint8Field = 0;
    int16_t int16Field = 0;
    uint16_t uint16Field = 0;
    int32_t int32Field = 0;
    uint32_t uint32Field = 0;
    int64_t int64Field = 0;
    uint64_t uint64Field = 0;
    float floatField = std::numeric_limits< float >::quiet_NaN( );
    double doubleField = std::numeric_limits< double >::quiet_NaN( );
    ::std::string stringField;
    bool booleanField = false;
    ::std::vector< uint8_t > bytesField;
    ::smoke::Point pointField;
};

}
