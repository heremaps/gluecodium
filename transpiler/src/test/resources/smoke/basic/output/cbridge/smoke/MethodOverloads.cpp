//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "smoke/MethodOverloads.h"
#include "cbridge/smoke/MethodOverloads.h"
#include "cbridge_internal/smoke/MethodOverloadsImpl.h"
#include <memory>
#include <string>

void smoke_MethodOverloads_release(smoke_MethodOverloadsRef handle) {
    delete get_pointer(handle);
}

smoke_MethodOverloads_PointRef smoke_MethodOverloads_Point_create() {
    return {new smoke::MethodOverloads::Point()};
}

void smoke_MethodOverloads_Point_release(smoke_MethodOverloads_PointRef handle) {
    delete get_pointer(handle);
}

double smoke_MethodOverloads_Point_x_get(smoke_MethodOverloads_PointRef handle) {
    return get_pointer(handle)->x;
}

void smoke_MethodOverloads_Point_x_set(smoke_MethodOverloads_PointRef handle, double x) {
    get_pointer(handle)->x = x;
}
double smoke_MethodOverloads_Point_y_get(smoke_MethodOverloads_PointRef handle) {
    return get_pointer(handle)->y;
}

void smoke_MethodOverloads_Point_y_set(smoke_MethodOverloads_PointRef handle, double y) {
    get_pointer(handle)->y = y;
}




bool smoke_MethodOverloads_isBoolean_boolOverload(smoke_MethodOverloadsRef _instance, bool input) {
    return get_pointer(_instance)->get()->is_boolean(input);
}


bool smoke_MethodOverloads_isBoolean_intOverload(smoke_MethodOverloadsRef _instance, int8_t input) {
    return get_pointer(_instance)->get()->is_boolean(input);
}


bool smoke_MethodOverloads_isBoolean_stringOverload(smoke_MethodOverloadsRef _instance, const char* input) {
    return get_pointer(_instance)->get()->is_boolean(std::string(input));
}


bool smoke_MethodOverloads_isBoolean_structOverload(smoke_MethodOverloadsRef _instance, smoke_MethodOverloads_PointRef input) {
    return get_pointer(_instance)->get()->is_boolean(*get_pointer(input));
}


bool smoke_MethodOverloads_isBoolean_everythingOverload(smoke_MethodOverloadsRef _instance, bool input1, int8_t input2, const char* input3, smoke_MethodOverloads_PointRef input4) {
    return get_pointer(_instance)->get()->is_boolean(input1, input2, std::string(input3), *get_pointer(input4));
}

