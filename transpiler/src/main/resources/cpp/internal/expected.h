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

#include <iostream>

namespace here
{
namespace internal
{
/**
 * A generic result holder.
 *
 * Can wrap error & multiple result types.
 * To be used by generated code.
 */
template < typename E, typename T >
struct Expected
{
public:
    /**
     * Creates a new successful result with the given value.
     *
     * @param value The value to hold as result
     * @return The created result object
     */
    static Expected
    result( const T& value )
    {
        return Expected( value );
    }

    /**
     * Creates a new successful result with the given value.
     *
     * @param value The value to hold as result
     * @return The created result object
     */
    static Expected
    result( T&& value )
    {
        return Expected( std::move( value ) );
    }

    /**
     * Creates a new failed result with the given error.
     *
     * @param error The error
     * @return The created failure object
     */
    static Expected
    fail( const E& error )
    {
        return Expected( error );
    }

    /**
     * Checks whether the Expected is an error or a success.
     * @return true when the result succeeded, false if there was an error
     */
    inline explicit operator bool( ) const
    {
        return heldType == TypeIndex::Result;
    }

    /**
     * Retrieves the error value.
     *
     * @return The error type
     * @note will abort if there was no error
     */
    inline E
    get_error( ) const
    {
        if ( heldType != TypeIndex::Error )
        {
            std::cerr << "Do not read an error from a valid object!"
                      << std::endl;  // TODO switch to logging
            std::terminate( );       // fail here, this is an error in the generated code
        }
        return m_error;
    }

    /**
     * Retrieves the value from the result as a reference.
     *
     * @return A reference of the expected value
     * @note will abort if there was an error
     */
    inline const T&
    get_result( )
    {
        if ( heldType != TypeIndex::Result )
        {
            std::cerr << "Do not read a result from a invalid object!"
                      << std::endl;  // TODO switch to logging
            std::terminate( );       // fail here, this is an error in the generated code
        }
        return m_result;
    }

    /**
     * Takes the value from the result.
     * This transfers the ownership of the result to the caller.
     * After this call the result must not be used again.
     *
     * @return The value, moved out of this object.
     * @note will abort if there was an error
     */
    inline T
    take_result( )
    {
        if ( heldType != TypeIndex::Result )
        {
            std::cerr << "Do not take a result from a invalid object!"
                      << std::endl;  // TODO switch to logging
            std::terminate( );       // fail here, this is an error in the generated code
        }
        T rv = std::move( m_result );
        heldType = TypeIndex::None;
        return rv;
    }

    Expected( Expected&& rhs )
        : heldType( rhs.heldType )
    {
        if ( heldType == TypeIndex::Error )
        {
            new ( &m_error ) E( std::move( rhs.m_error ) );
        }
        else
        {
            new ( &m_result ) T( std::move( rhs.m_result ) );
        }
    }

    ~Expected( )
    {
        if ( heldType == TypeIndex::Error )
        {
            m_error.~E( );
        }
        else
        {
            m_result.~T( );
        }
    }

private:
    /// Creates failed instance
    Expected( const E& error )
        : heldType( TypeIndex::Error )
        , m_error( error )
    {
    }

    /// Creates successful instance by copying
    Expected( const T& result )
        : heldType( TypeIndex::Result )
        , m_result( result )
    {
    }

    /// Creates successful instance by moving
    Expected( T&& result )
        : heldType( TypeIndex::Result )
        , m_result( std::move( result ) )
    {
    }

    enum class TypeIndex
    {
        None,
        Result,
        Error
    };

    TypeIndex heldType;
    union {
        E m_error;
        T m_result;
    };
};

}  // internal

}  // here
