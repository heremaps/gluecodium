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
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <string>
#include <unordered_map>
#include <vector>

namespace examples {
/**
 * This is some very useful interface.
 */
class Comments {
public:
    virtual ~Comments() = 0;
public:
/**
 * This is some very useful enum.
 */
enum class SomeEnum {
    /**
     * Not quite useful
     */
    USELESS,
    /**
     * Somewhat useful
     */
    USEFUL
};
/**
 * This is some very useful typedef.
 */
using Usefulness = bool;
/**
 * This is some very useful array.
 */
using SomeArray = ::std::vector< ::std::string >;
/**
 * This is some very useful map.
 */
using SomeMap = ::std::unordered_map< ::std::string, ::examples::Comments::Usefulness >;
/**
 * This is some very useful struct.
 */
struct SomeStruct {
    /**
     * How useful this struct is
     */
    ::examples::Comments::Usefulness some_field;
};
/**
 * This is some totally useless union.
 */
struct SomeUnion {
    enum VariantType {
        SOME_FIELD
    };
    const VariantType type;
    union {
        /**
         * How useless this union is
         */
        ::examples::Comments::Usefulness some_field;
    };
    SomeUnion(const ::examples::Comments::Usefulness& some_field)
        : type(SOME_FIELD)
        , some_field(some_field) {};
    SomeUnion(const SomeUnion& other)
        : type(other.type)
    {
        switch (other.type) {
        case SOME_FIELD:
            new (&some_field) ::examples::Comments::Usefulness(other.some_field);
            break;
        };
    };
    ~SomeUnion()
    {
        switch (type) {
        case SOME_FIELD:
            break;
        };
    };
};
public:
/**
 * This is some very useful method that measures the usefulness of its input.
 * \param[in] input Very useful input parameter
 * \return Usefulness of the input
 */
virtual ::examples::Comments::Usefulness some_method( const ::std::string& input ) = 0;
/**
 * This is some very useful attribute.
 */
virtual ::examples::Comments::Usefulness get_some_attribute(  ) = 0;
/**
 * This is some very useful attribute.
 */
virtual void set_some_attribute( const ::examples::Comments::Usefulness value ) = 0;
};
}