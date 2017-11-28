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

namespace examples {

class StructsInheritance {
public:
    virtual ~StructsInheritance() = 0;

public:
struct SyncResultInherited: public ::examples::Structs::SyncResult {
    int32_t id = 0;
};

public:
virtual ::examples::StructsInheritance::SyncResultInherited method_with_inherited_type( const ::examples::StructsInheritance::SyncResultInherited& input ) = 0;

};

}
