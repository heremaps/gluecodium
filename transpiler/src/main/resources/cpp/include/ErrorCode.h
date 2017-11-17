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

#pragma once

#include <cstdint>
#include <ostream>
#include <string>

namespace hf
{
class ErrorCode
{
public:
    using Code = std::uint32_t;

    constexpr ErrorCode( ) = default;
    constexpr ErrorCode( Code code );
    constexpr ErrorCode( const ErrorCode& other ) = default;

    constexpr bool operator==( const ErrorCode& other ) const;
    constexpr bool operator!=( const ErrorCode& other ) const;
    constexpr bool operator<( const ErrorCode& other ) const;
    constexpr bool operator<=( const ErrorCode& other ) const;
    constexpr bool operator>( const ErrorCode& other ) const;
    constexpr bool operator>=( const ErrorCode& other ) const;

    /**
     * Returns true if code is OK.
     */
    constexpr bool is_ok( ) const;

    /**
     * Returns true if code is not OK.
     */
    constexpr bool is_not_ok( ) const;

    /**
     * Returns code value.
     */
    constexpr Code code( ) const;

private:
    Code m_code = 0;
};

/**
 * Error codes defined for namespace hf.
 *
 * Every module should have a sub-namespace called errors defining its own error codes.
 */
namespace errors
{
const ErrorCode::Code NONE = 0;
const ErrorCode::Code GENERIC = 1;
const ErrorCode::Code NULL_VALUE = 2;

}  // namespace core

inline constexpr ErrorCode::ErrorCode( Code code )
    : m_code( code )
{
}

inline constexpr bool
ErrorCode::operator==( const ErrorCode& other ) const
{
    return m_code == other.m_code;
}

inline constexpr bool
ErrorCode::operator!=( const ErrorCode& other ) const
{
    return m_code != other.m_code;
}

inline constexpr bool
ErrorCode::operator<( const ErrorCode& other ) const
{
    return m_code < other.m_code;
}

inline constexpr bool
ErrorCode::operator<=( const ErrorCode& other ) const
{
    return m_code <= other.m_code;
}

inline constexpr bool
ErrorCode::operator>=( const ErrorCode& other ) const
{
    return m_code >= other.m_code;
}

inline constexpr bool
ErrorCode::operator>( const ErrorCode& other ) const
{
    return m_code > other.m_code;
}

inline constexpr ErrorCode::Code
ErrorCode::code( ) const
{
    return m_code;
}

inline constexpr bool
ErrorCode::is_ok( ) const
{
    return m_code == 0u;
}

inline constexpr bool
ErrorCode::is_not_ok( ) const
{
    return m_code != 0u;
}

}  // namespace hf
