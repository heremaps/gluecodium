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

namespace smoke {

class Unions {
public:
struct NavigationError {
    enum VariantType {
        ERRORMESSAGE,
        ERRORNUMBER
    };
    const VariantType type;
    union {
        ::std::string errorMessage;
        int32_t errorNumber;
    };

    NavigationError(const ::std::string& errorMessage)
        : type(ERRORMESSAGE)
        , errorMessage(errorMessage) {};

    NavigationError(const int32_t& errorNumber)
        : type(ERRORNUMBER)
        , errorNumber(errorNumber) {};

    NavigationError(const NavigationError& other)
        : type(other.type)
    {
        switch (other.type) {
        case ERRORMESSAGE:
            new (&errorMessage) ::std::string(other.errorMessage);
            break;
        case ERRORNUMBER:
            new (&errorNumber) int32_t(other.errorNumber);
            break;
        };
    };

    ~NavigationError()
    {
        switch (type) {
        case ERRORMESSAGE:
            errorMessage.~basic_string< char >();
            break;
        case ERRORNUMBER:
            break;
        };
    };
};
struct InternalUnion {
    enum VariantType {
        VALUE,
        FLAG
    };
    const VariantType type;
    union {
        uint8_t value;
        bool flag;
    };

    InternalUnion(const uint8_t& value)
        : type(VALUE)
        , value(value) {};

    InternalUnion(const bool& flag)
        : type(FLAG)
        , flag(flag) {};

    InternalUnion(const InternalUnion& other)
        : type(other.type)
    {
        switch (other.type) {
        case VALUE:
            new (&value) uint8_t(other.value);
            break;
        case FLAG:
            new (&flag) bool(other.flag);
            break;
        };
    };

    ~InternalUnion()
    {
        switch (type) {
        case VALUE:
            break;
        case FLAG:
            break;
        };
    };
};
struct NestedUnion {
    enum VariantType {
        TEXT,
        VALUEORFLAG
    };
    const VariantType type;
    union {
        ::std::string text;
        ::smoke::Unions::InternalUnion valueOrFlag;
    };

    NestedUnion(const ::std::string& text)
        : type(TEXT)
        , text(text) {};

    NestedUnion(const ::smoke::Unions::InternalUnion& valueOrFlag)
        : type(VALUEORFLAG)
        , valueOrFlag(valueOrFlag) {};

    NestedUnion(const NestedUnion& other)
        : type(other.type)
    {
        switch (other.type) {
        case TEXT:
            new (&text) ::std::string(other.text);
            break;
        case VALUEORFLAG:
            new (&valueOrFlag) ::smoke::Unions::InternalUnion(other.valueOrFlag);
            break;
        };
    };

    ~NestedUnion()
    {
        switch (type) {
        case TEXT:
            text.~basic_string< char >();
            break;
        case VALUEORFLAG:
            valueOrFlag.~InternalUnion();
            break;
        };
    };
};
struct StructWithUnion {
    ::smoke::Unions::InternalUnion valueOrFlag;
    ::std::string text;
};
struct InternalStruct {
    uint8_t value = 0;
    bool flag = false;
};
struct UnionWithStruct {
    enum VariantType {
        VALUEANDFLAG,
        TEXT
    };
    const VariantType type;
    union {
        ::smoke::Unions::InternalStruct valueAndFlag;
        ::std::string text;
    };

    UnionWithStruct(const ::smoke::Unions::InternalStruct& valueAndFlag)
        : type(VALUEANDFLAG)
        , valueAndFlag(valueAndFlag) {};

    UnionWithStruct(const ::std::string& text)
        : type(TEXT)
        , text(text) {};

    UnionWithStruct(const UnionWithStruct& other)
        : type(other.type)
    {
        switch (other.type) {
        case VALUEANDFLAG:
            new (&valueAndFlag) ::smoke::Unions::InternalStruct(other.valueAndFlag);
            break;
        case TEXT:
            new (&text) ::std::string(other.text);
            break;
        };
    };

    ~UnionWithStruct()
    {
        switch (type) {
        case VALUEANDFLAG:
            valueAndFlag.~InternalStruct();
            break;
        case TEXT:
            text.~basic_string< char >();
            break;
        };
    };
};

public:
static ::smoke::Unions::NavigationError methodWithUnion( const ::smoke::Unions::NavigationError& input );
static ::smoke::Unions::NestedUnion methodWithNestedUnion( const ::smoke::Unions::NestedUnion& input );
static ::smoke::Unions::StructWithUnion methodWithStructWithUnion( const ::smoke::Unions::StructWithUnion& input );
static ::smoke::Unions::StructWithUnion methodWithUnionWithStruct( const ::smoke::Unions::StructWithUnion& input );

};

}
