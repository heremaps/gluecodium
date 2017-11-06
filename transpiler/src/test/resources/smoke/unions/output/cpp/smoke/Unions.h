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
        ERROR_MESSAGE,
        ERROR_NUMBER
    };
    const VariantType type;
    union {
        ::std::string error_message;
        int32_t error_number;
    };
    NavigationError(const ::std::string& error_message)
        : type(ERROR_MESSAGE)
        , error_message(error_message) {};
    NavigationError(const int32_t& error_number)
        : type(ERROR_NUMBER)
        , error_number(error_number) {};
    NavigationError(const NavigationError& other)
        : type(other.type)
    {
        switch (other.type) {
        case ERROR_MESSAGE:
            new (&error_message) ::std::string(other.error_message);
            break;
        case ERROR_NUMBER:
            new (&error_number) int32_t(other.error_number);
            break;
        };
    };
    ~NavigationError()
    {
        switch (type) {
        case ERROR_MESSAGE:
            error_message.~basic_string< char >();
            break;
        case ERROR_NUMBER:
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
        VALUE_OR_FLAG
    };
    const VariantType type;
    union {
        ::std::string text;
        ::smoke::Unions::InternalUnion value_or_flag;
    };
    NestedUnion(const ::std::string& text)
        : type(TEXT)
        , text(text) {};
    NestedUnion(const ::smoke::Unions::InternalUnion& value_or_flag)
        : type(VALUE_OR_FLAG)
        , value_or_flag(value_or_flag) {};
    NestedUnion(const NestedUnion& other)
        : type(other.type)
    {
        switch (other.type) {
        case TEXT:
            new (&text) ::std::string(other.text);
            break;
        case VALUE_OR_FLAG:
            new (&value_or_flag) ::smoke::Unions::InternalUnion(other.value_or_flag);
            break;
        };
    };
    ~NestedUnion()
    {
        switch (type) {
        case TEXT:
            text.~basic_string< char >();
            break;
        case VALUE_OR_FLAG:
            value_or_flag.~InternalUnion();
            break;
        };
    };
};
struct StructWithUnion {
    ::smoke::Unions::InternalUnion value_or_flag;
    ::std::string text;
};
struct InternalStruct {
    uint8_t value = 0;
    bool flag = false;
};
struct UnionWithStruct {
    enum VariantType {
        VALUE_AND_FLAG,
        TEXT
    };
    const VariantType type;
    union {
        ::smoke::Unions::InternalStruct value_and_flag;
        ::std::string text;
    };
    UnionWithStruct(const ::smoke::Unions::InternalStruct& value_and_flag)
        : type(VALUE_AND_FLAG)
        , value_and_flag(value_and_flag) {};
    UnionWithStruct(const ::std::string& text)
        : type(TEXT)
        , text(text) {};
    UnionWithStruct(const UnionWithStruct& other)
        : type(other.type)
    {
        switch (other.type) {
        case VALUE_AND_FLAG:
            new (&value_and_flag) ::smoke::Unions::InternalStruct(other.value_and_flag);
            break;
        case TEXT:
            new (&text) ::std::string(other.text);
            break;
        };
    };
    ~UnionWithStruct()
    {
        switch (type) {
        case VALUE_AND_FLAG:
            value_and_flag.~InternalStruct();
            break;
        case TEXT:
            text.~basic_string< char >();
            break;
        };
    };
};
public:
static ::smoke::Unions::NavigationError method_with_union( const ::smoke::Unions::NavigationError& input );
static ::smoke::Unions::NestedUnion method_with_nested_union( const ::smoke::Unions::NestedUnion& input );
static ::smoke::Unions::StructWithUnion method_with_struct_with_union( const ::smoke::Unions::StructWithUnion& input );
static ::smoke::Unions::StructWithUnion method_with_union_with_struct( const ::smoke::Unions::StructWithUnion& input );
};
}