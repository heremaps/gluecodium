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

#include "ErrorCode.h"

#include <functional>
#include <memory>
#include <ostream>
#include <sstream>
#include <string>
#include <system_error>
#include <utility>

namespace hf
{
/**
 * Error code with optional human readable annotations.
 */
class Error
{
public:
    /**
     * Human readable annotations attached to an @ref Error.
     */
    struct Annotation
    {
        /// Human readable text annotation.
        std::string m_text;

        /// Creates an annotation with a human readable text.
        Annotation( const std::string& text );
    };

private:
    ErrorCode m_code = 0;

    // A structure used to implement a linked list of annotations.
    struct _AnnotationNode : public Annotation
    {
        _AnnotationNode( Annotation&& annotation );
        std::shared_ptr< _AnnotationNode > m_previous;
    };
    std::shared_ptr< _AnnotationNode > m_annotations;

public:
    /**
     * Creates an invalid error.
     *
     * Default contructed error have the following properties:
     * - attribute @ref code is zero (that is @a core::NONE).
     * - operator bool() returns false.
     * - have no annotations attached.
     */
    constexpr Error( ) = default;

    /// Copy constructor.
    Error( const Error& ) noexcept = default;

    /// Move constructor.
    Error( Error&& ) noexcept = default;

    /**
     * Converts an error code to an error.
     */
    Error( const ErrorCode& error_code );

    /**
     * Converts an error code to an error.
     */
    Error( const ErrorCode::Code& error_code );

    /// Builds a generic error with the given annotation.
    explicit Error( Annotation&& annotation );

    /// Derives an error from another, plus a newly appended annotation.
    Error( const Error& error, Annotation&& annotation );

    /**
     * Derives an error from an error code, plus a newly appended annotation.
     */
    Error( const ErrorCode& error_code, Annotation&& annotation );

    /// Destructor.
    ~Error( ) = default;

    /// Copy-assignment operator.
    Error& operator=( const Error& ) = default;

    /// Move-assignment operator.
    Error& operator=( Error&& ) = default;

    /// Returns @a true if the error is valid, that is attributr @ref code is not zero.
    explicit operator bool( ) const;

    /// Returns attribute @ref code.
    explicit operator ErrorCode( ) const;

    /**
     * A visitor for appended annotations.
     *
     * @return
     * - @a true to continue iterating.
     * - @a false to stop iterating.
     */
    using AnnotationVisitor = std::function< bool( const Annotation& ) >;

    /// Visits all annotations starting from the last.
    void visit_annotations( const AnnotationVisitor& visitor ) const;

    /**
     * Returns itself.
     *
     * This is a conveninence getter useful for templates and macros expecting to get an @ref Error
     * object from a generic parameter.
     *
     * @see
     * - HF_RETURN_ON_ERROR
     * - HF_RAISE_ON_ERROR
     */
    const Error& error( ) const;

    /// Returns the error code.
    ErrorCode code( ) const;
};

// -------------------------------------------------------------------------------------------------
// Implementation

inline Error::Error( const ErrorCode& error_code )
    : m_code( error_code )
{
}

inline Error::Error( const ErrorCode::Code& error_code )
    : m_code( ErrorCode{error_code} )
{
}

inline Error::Error( Annotation&& annotation )
    : m_code( ErrorCode( errors::GENERIC ) )
{
    m_annotations.reset( new _AnnotationNode( std::move( annotation ) ) );
}

inline Error::Error( const Error& error, Annotation&& annotation )
    : m_code( ErrorCode( error ) )
{
    m_annotations.reset( new _AnnotationNode( std::move( annotation ) ) );
    m_annotations->m_previous = error.m_annotations;
}

inline Error::Error( const ErrorCode& error_code, Annotation&& annotation )
    : m_code( error_code )
{
    m_annotations.reset( new _AnnotationNode( std::move( annotation ) ) );
}

inline Error::operator bool( ) const
{
    return m_code != 0;
}

inline Error::operator ErrorCode( ) const
{
    return m_code;
}

inline void
Error::visit_annotations( const AnnotationVisitor& visitor ) const
{
    auto node = m_annotations;
    while ( node  //
            && visitor( *node ) )
    {
        node = node->m_previous;
    }
}

inline const Error&
Error::error( ) const
{
    return *this;
}

inline ErrorCode
Error::code( ) const
{
    return m_code;
}

inline Error::Annotation::Annotation( const std::string& text )
    : m_text( text )
{
}

inline Error::_AnnotationNode::_AnnotationNode( Annotation&& annotation )
    : Annotation( std::move( annotation ) )
{
}

inline bool
operator==( const Error& a, const Error& b )
{
    return a.code( ) == b.code( );
}

inline bool
operator!=( const Error& a, const Error& b )
{
    return a.code( ) != b.code( );
}

inline bool
operator<( const Error& a, const Error& b )
{
    return a.code( ) < b.code( );
}

inline bool
operator<=( const Error& a, const Error& b )
{
    return a.code( ) <= b.code( );
}

inline bool
operator>( const Error& a, const Error& b )
{
    return a.code( ) > b.code( );
}

inline bool
operator>=( const Error& a, const Error& b )
{
    return a.code( ) >= b.code( );
}

}  // namespace hf
