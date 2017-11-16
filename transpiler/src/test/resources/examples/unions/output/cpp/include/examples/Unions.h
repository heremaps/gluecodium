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
#include <string>

namespace examples {

struct ExampleUnion {
    enum VariantType {
        NAME,
        ID
    };
    const VariantType type;
    union {
        ::std::string name;
        uint64_t id;
    };

    ExampleUnion(const ::std::string& name)
        : type(NAME)
        , name(name) {};

    ExampleUnion(const uint64_t& id)
        : type(ID)
        , id(id) {};

    ExampleUnion(const ExampleUnion& other)
        : type(other.type)
    {
        switch (other.type) {
        case NAME:
            new (&name) ::std::string(other.name);
            break;
        case ID:
            new (&id) uint64_t(other.id);
            break;
        };
    };

    ~ExampleUnion()
    {
        switch (type) {
        case NAME:
            name.~basic_string< char >();
            break;
        case ID:
            break;
        };
    };
};

}
