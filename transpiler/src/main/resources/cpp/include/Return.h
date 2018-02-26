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

#include <initializer_list>
#include <ostream>
#include <type_traits>
#include <utility>
#include <sstream>
#include <system_error>

namespace hf
{

namespace errors
{
const std::error_code NULL_VALUE;
}

/**
 * Adapter to allow functions to return values or error conditions at the same time.
 *
 * @tparam Value Is the value to be returned.
 *
 * This adapter can be see as:
 * - an optional value, it implements most of the protocol of std::optional<Value>.
 * - a variant between a Value and an Error, we can have either a Value either an Error.
 *
 * @code
 * Return<Foo>
 * my_function( const std::string& question )
 * {
 *     if ( question.empty( ) )
 *     {
 *         // Generates a generic error with one text annotation:
 *         return Error{{"Empty question passed"}};
 *     }
 *
 *     Return<Bar> my_value = another_function( "some input" );
 *     if (!my_value)
 *     {
 *         std::cout << "Failed: " << to_string( my_value.error( ) );
 *
 *         // Returns the original error without annotations.
 *         return my_value.error();
 *     }
 *
 *     Return<Bar2> answer = my_value->ask( question );
 *     if ( !answer )
 *     {
 *         // Returns the original error plus one annotations.
 *         return Error{answer.error(), {"while asking", question}};
 *     }
 *
 *     return Foo{"Success!"};
 * }
 * @endcode
 */
template < class Value, class Error = std::error_code >
class Return
{
private:
    using value_type = Value;
    using error_type = Error;

    // Internal representation:
    bool m_has_value;
    union {
        Value m_value;
        Error m_error;
    };

public:
    constexpr Return( ) noexcept;
    Return( const Return& );
    Return( Return&& );
    Return( const Value& value );
    Return( Value&& value );
    Return( const Error& error );
    Return( Error&& error );
    ~Return( );

    Return& operator=( const Return& );
    Return& operator=( Return&& )                                  //
        noexcept( std::is_nothrow_move_assignable< Value >::value  //
                      && std::is_nothrow_move_constructible< Value >::value );
    Return& operator=( const Value& );
    Return& operator=( Value&& );
    Return& operator=( const Error& );
    Return& operator=( Error&& );

    template < class OtherValue,
               class _ = typename std::
                   enable_if< std::is_same< typename std::remove_reference< OtherValue >::type,
                                            value_type >::value
                              && std::is_constructible< value_type, OtherValue >::value
                              && std::is_assignable< value_type&, OtherValue >::value >::type >
    Return( OtherValue&& value );

    template < class OtherValue,
               class _ = typename std::
                   enable_if< std::is_same< typename std::remove_reference< OtherValue >::type,
                                            value_type >::value
                              && std::is_constructible< value_type, OtherValue >::value
                              && std::is_assignable< value_type&, OtherValue >::value >::type >
    Return& operator=( OtherValue&& value );

    explicit operator bool( ) const noexcept;
    Value* operator->( ) noexcept;
    Value& operator*( ) noexcept;
    const Value* operator->( ) const noexcept;
    const Value& operator*( ) const noexcept;

    bool has_value( ) const noexcept;
    Error error( ) const noexcept;

    template < class OtherValue >
    Value value_or( OtherValue&& default_value ) const &  //
        noexcept( noexcept( static_cast< Value >( default_value ) ) );

    template < class OtherValue >
        Value value_or( OtherValue&& default_value )
        && noexcept( noexcept( static_cast< Value >( default_value ) ) );

    constexpr Value safe_value( ) const &;
    Value safe_value( ) &&;

    void swap( Return& other ) noexcept;

    void reset( ) noexcept;

    template < class... Args >
    Value& emplace( Args&&... args );

    template < class OtherValue,
               class... Args,
               class _ = typename std::
                   enable_if< std::is_constructible< value_type,
                                                     std::initializer_list< OtherValue >&,
                                                     Args... >::value >::type >
    Value& emplace( std::initializer_list< OtherValue > ilist, Args&&... args );
};

template < class Value, class ErrorA, class ErrorB >
bool
operator==( const Return< Value, ErrorA >& a,
            const Return< Value, ErrorB >& b ) noexcept( noexcept( *a == *b ) )
{
    if ( a && b )
    {
        return *a == *b;
    }
    else
    {
        return bool( a ) == bool( b );
    }
}

template < class Value, class ErrorA, class ErrorB >
bool
operator!=( const Return< Value, ErrorA >& a,
            const Return< Value, ErrorB >& b ) noexcept( noexcept( *a != *b ) )
{
    if ( a && b )
    {
        return *a != *b;
    }
    else
    {
        return bool( a ) != bool( b );
    }
}

template < class Value, class Error >
bool
operator==( const Return< Value, Error >& a, const Value& b ) noexcept( noexcept( *a == b ) )
{
    if ( a )
    {
        return *a == b;
    }
    else
    {
        return false;
    }
}

template < class Value, class Error >
bool
operator!=( const Return< Value, Error >& a, const Value& b ) noexcept( noexcept( *a != b ) )
{
    if ( a )
    {
        return *a != b;
    }
    else
    {
        return true;
    }
}

template < class Value, class Error >
bool
operator==( const Value& a, const Return< Value, Error >& b ) noexcept( noexcept( a == *b ) )
{
    if ( b )
    {
        return a == *b;
    }
    else
    {
        return false;
    }
}

template < class Value, class Error >
bool
operator!=( const Value& a, const Return< Value, Error >& b ) noexcept( noexcept( a != *b ) )
{
    if ( b )
    {
        return a != *b;
    }
    else
    {
        return true;
    }
}

template < class Value, class Error >
bool
operator==( const Return< Value, Error >& a, const Error& b ) noexcept
{
    return a.error( ) == b;
}

template < class Value, class Error >
bool
operator!=( const Return< Value, Error >& a, const Error& b ) noexcept
{
    return a.error( ) != b;
}

template < class Value, class Error >
bool
operator==( const Error& a, const Return< Value, Error >& b ) noexcept
{
    return a == b.error( );
}

template < class Value, class Error >
bool
operator!=( const Error& a, const Return< Value, Error >& b ) noexcept
{
    return a != b.error( );
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator==( const Return< Value, Error >& a, OtherValue&& b )
{
    if ( a )
    {
        return *a == std::forward< OtherValue >( b );
    }
    else
    {
        return false;
    }
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator!=( const Return< Value, Error >& a, OtherValue&& b )
{
    if ( a )
    {
        return *a != std::forward< OtherValue >( b );
    }
    else
    {
        return true;
    }
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator==( OtherValue&& a, const Return< Value, Error >& b )
{
    if ( b )
    {
        return std::forward< OtherValue >( a ) == *b;
    }
    else
    {
        return false;
    }
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator!=( OtherValue&& a, const Return< Value, Error >& b )
{
    if ( b )
    {
        return std::forward< OtherValue >( a ) == *b;
    }
    else
    {
        return true;
    }
}

template < class Value, class ErrorA, class ErrorB >
bool
operator<( const Return< Value, ErrorA >& a,
           const Return< Value, ErrorB >& b ) noexcept( noexcept( *a < *b ) )
{
    if ( a && b )
    {
        return *a < *b;
    }
    else
    {
        return int( bool( a ) ) < int( bool( b ) );
    }
}

template < class Value, class ErrorA, class ErrorB >
bool
operator<=( const Return< Value, ErrorA >& a,
            const Return< Value, ErrorB >& b ) noexcept( noexcept( *a <= *b ) )
{
    if ( a && b )
    {
        return *a <= *b;
    }
    else
    {
        return int( bool( a ) ) <= int( bool( b ) );
    }
}

template < class Value, class ErrorA, class ErrorB >
bool
operator>( const Return< Value, ErrorA >& a,
           const Return< Value, ErrorB >& b ) noexcept( noexcept( *a > *b ) )
{
    if ( a && b )
    {
        return *a > *b;
    }
    else
    {
        return int( bool( a ) ) > int( bool( b ) );
    }
}

template < class Value, class ErrorA, class ErrorB >
bool
operator>=( const Return< Value, ErrorA >& a,
            const Return< Value, ErrorB >& b ) noexcept( noexcept( *a >= *b ) )
{
    if ( a && b )
    {
        return *a >= *b;
    }
    else
    {
        return int( bool( a ) ) >= int( bool( b ) );
    }
}

template < class Value, class Error >
bool
operator<( const Return< Value, Error >& a,
           const typename Return< Value, Error >::value_type& b ) noexcept( noexcept( *a < b ) )
{
    if ( a )
    {
        return *a < b;
    }
    else
    {
        return true;
    }
}

template < class Value, class Error >
bool
operator<=( const Return< Value, Error >& a,
            const typename Return< Value, Error >::value_type& b ) noexcept( noexcept( *a <= b ) )
{
    if ( a )
    {
        return *a <= b;
    }
    else
    {
        return true;
    }
}

template < class Value, class Error >
bool
operator>( const Return< Value, Error >& a,
           const typename Return< Value, Error >::value_type& b ) noexcept( noexcept( *a > b ) )
{
    if ( a )
    {
        return *a > b;
    }
    else
    {
        return false;
    }
}

template < class Value, class Error >
bool
operator>=( const Return< Value, Error >& a,
            const typename Return< Value, Error >::value_type& b ) noexcept( noexcept( *a >= b ) )
{
    if ( a )
    {
        return *a >= b;
    }
    else
    {
        return false;
    }
}

template < class Value, class Error >
bool
operator<( const typename Return< Value, Error >::value_type& a,
           const Return< Value, Error >& b ) noexcept( noexcept( a < *b ) )
{
    if ( b )
    {
        return a < *b;
    }
    else
    {
        return false;
    }
}

template < class Value, class Error >
bool
operator<=( const typename Return< Value, Error >::value_type& a,
            const Return< Value, Error >& b ) noexcept( noexcept( a <= *b ) )
{
    if ( b )
    {
        return a <= *b;
    }
    else
    {
        return false;
    }
}

template < class Value, class Error >
bool
operator>( const typename Return< Value, Error >::value_type& a,
           const Return< Value, Error >& b ) noexcept( noexcept( a > *b ) )
{
    if ( b )
    {
        return a > *b;
    }
    else
    {
        return true;
    }
}

template < class Value, class Error >
bool
operator>=( const typename Return< Value, Error >::value_type& a,
            const Return< Value, Error >& b ) noexcept( noexcept( a >= *b ) )
{
    if ( b )
    {
        return a >= *b;
    }
    else
    {
        return true;
    }
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator<( const Return< Value, Error >& a, OtherValue&& b )
{
    return *a < std::forward< OtherValue >( b );
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator<=( const Return< Value, Error >& a, OtherValue&& b )
{
    return *a <= std::forward< OtherValue >( b );
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator>( const Return< Value, Error >& a, OtherValue&& b )
{
    return *a > std::forward< OtherValue >( b );
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator>=( const Return< Value, Error >& a, OtherValue&& b )
{
    return *a >= std::forward< OtherValue >( b );
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator<( OtherValue&& a, const Return< Value, Error >& b )
{
    return std::forward< OtherValue >( a ) < *b;
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator<=( OtherValue&& a, const Return< Value, Error >& b )
{
    return std::forward< OtherValue >( a ) <= *b;
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator>( OtherValue&& a, const Return< Value, Error >& b )
{
    return std::forward< OtherValue >( a ) > *b;
}

template < class Value,
           class Error,
           class OtherValue,
           class _
           = typename std::enable_if< std::is_constructible< Value, OtherValue >::value
                                      && std::is_assignable< Value&, OtherValue >::value >::type >
bool
operator>=( OtherValue&& a, const Return< Value, Error >& b )
{
    return std::forward< OtherValue >( a ) >= *b;
}

template < class Value, class Error >
std::string
to_string( const Return< Value, Error >& value )
{
    std::stringstream out;
    out << value;
    return out.str( );
}

template < class Value, class Error >
auto
operator<<( std::ostream& out, const Return< Value, Error >& value ) -> decltype( out << *value )
{
    if ( value )
    {
        // This decoration around the value is meant to make it easy writing regular expressions
        // parsing return values from logs files or error annotations
        out << "Return{" << *value << "}";
    }
    else
    {
        out << value.error( );
    }

    return out;
}

template < class Value, class Error >
constexpr Return< Value, Error >::Return( ) noexcept
    : m_has_value( false )
    , m_error( errors::NULL_VALUE )
{
}

template < class Value, class Error >
Return< Value, Error >::Return( const Return& other )
    : m_has_value( other.m_has_value )
{
    if ( m_has_value )
    {
        new ( &m_value )( Value )( other.m_value );
    }
    else
    {
        new ( &m_error )( Error )( other.m_error );
    }
}

template < class Value, class Error >
Return< Value, Error >::Return( Return&& other )
    : m_has_value( other.m_has_value )
{
    if ( m_has_value )
    {
        new ( &m_value )( Value )( std::move( other.m_value ) );
    }
    else
    {
        new ( &m_error )( Error )( std::move( other.m_error ) );
    }

    other.reset( );
}

template < class Value, class Error >
Return< Value, Error >::Return( const Value& value )
    : m_has_value( true )
    , m_value( value )
{
}

template < class Value, class Error >
Return< Value, Error >::Return( Value&& value )
    : m_has_value( true )
    , m_value( std::move( value ) )
{
}

template < class Value, class Error >
Return< Value, Error >::Return( const Error& error )
    : m_has_value( false )
    , m_error( error )
{
}

template < class Value, class Error >
Return< Value, Error >::Return( Error&& error )
    : m_has_value( false )
    , m_error( std::move( error ) )
{
}

template < class Value, class Error >
Return< Value, Error >::~Return( )
{
    reset( );
}

template < class Value, class Error >
Return< Value, Error >&
Return< Value, Error >::operator=( const Return& other )
{
    if ( this == &other )
    {
        return *this;
    }

    reset( );
    if ( other.m_has_value )
    {
        m_has_value = true;
        new ( &m_value )( Value )( other.m_value );
    }
    else
    {
        new ( &m_error )( Error )( other.m_error );
    }
    return *this;
}

template < class Value, class Error >
Return< Value, Error >&
Return< Value, Error >::operator=( Return< Value, Error >&& other )  //
    noexcept( std::is_nothrow_move_assignable< Value >::value        //
                  && std::is_nothrow_move_constructible< Value >::value )
{
    if ( this == &other )
    {
        return *this;
    }

    reset( );
    if ( other.m_has_value )
    {
        m_has_value = true;
        new ( &m_value )( Value )( std::move( other.m_value ) );
    }
    else
    {
        new ( &m_error )( Error )( std::move( other.m_error ) );
    }

    other.reset( );
    return *this;
}

template < class Value, class Error >
Return< Value, Error >&
Return< Value, Error >::operator=( const Value& value )
{
    reset( );
    m_has_value = true;
    new ( &m_value )( Value )( value );
    return *this;
}

template < class Value, class Error >
Return< Value, Error >&
Return< Value, Error >::operator=( Value&& value )
{
    reset( );
    m_has_value = true;
    new ( &m_value )( Value )( std::move( value ) );
    return *this;
}

template < class Value, class Error >
Return< Value, Error >&
Return< Value, Error >::operator=( const Error& error )
{
    reset( );
    new ( &m_error )( Error )( error );
    return *this;
}

template < class Value, class Error >
Return< Value, Error >&
Return< Value, Error >::operator=( Error&& error )
{
    reset( );
    new ( &m_error )( Error )( std::move( error ) );
    return *this;
}

template < class Value, class Error >
template < class OtherValue, class _ >
Return< Value, Error >::Return( OtherValue&& value )
    : m_has_value( true )
    , m_value( std::forward< OtherValue >( value ) )
{
}

template < class Value, class Error >
template < class OtherValue, class _ >
Return< Value, Error >&
Return< Value, Error >::operator=( OtherValue&& value )
{
    reset( );
    m_has_value = true;
    m_value = std::forward< OtherValue >( value );
    return *this;
}

template < class Value, class Error >
Return< Value, Error >::operator bool( ) const noexcept
{
    return m_has_value;
}

template < class Value, class Error >
Value* Return< Value, Error >::operator->( ) noexcept
{
    return &m_value;
}

template < class Value, class Error >
Value& Return< Value, Error >::operator*( ) noexcept
{
    return m_value;
}

template < class Value, class Error >
const Value* Return< Value, Error >::operator->( ) const noexcept
{
    return &m_value;
}

template < class Value, class Error >
const Value& Return< Value, Error >::operator*( ) const noexcept
{
    return m_value;
}

template < class Value, class Error >
bool
Return< Value, Error >::has_value( ) const noexcept
{
    return m_has_value;
}

template < class Value, class Error >
auto
Return< Value, Error >::error( ) const noexcept -> Error
{
    if ( m_has_value )
    {
        return Error( );
    }
    else
    {
        return m_error;
    }
}

template < class Value, class Error >
template < class OtherValue >
Value
Return< Value, Error >::value_or( OtherValue&& default_value ) const &  //
    noexcept( noexcept( static_cast< Value >( default_value ) ) )
{
    static_assert( std::is_copy_constructible< Value >::value,
                   "Return<T>::value_or: T must be copy constructible" );
    static_assert( std::is_convertible< OtherValue, Value >::value,
                   "Return<T>::value_or: U must be convertible to T" );
    return bool( *this ) ? **this                                                                //
                         : static_cast< Value >( std::forward< OtherValue >( default_value ) );  //
}

template < class Value, class Error >
    template < class OtherValue >
    Value
    Return< Value, Error >::value_or( OtherValue&& default_value )
    && noexcept( noexcept( static_cast< Value >( default_value ) ) )
{
    static_assert( std::is_move_constructible< Value >::value,
                   "Return<T>::value_or: T must be move constructible" );
    static_assert( std::is_convertible< OtherValue, Value >::value,
                   "Return<T>::value_or: U must be convertible to T" );
    return bool( *this ) ? std::move( **this )                                                   //
                         : static_cast< Value >( std::forward< OtherValue >( default_value ) );  //
}

template < class Value, class Error >
constexpr Value
Return< Value, Error >::safe_value( ) const &
{
    return m_has_value ? m_value    //
                       : Value( );  //
}

template < class Value, class Error >
Value
Return< Value, Error >::safe_value( ) &&
{
    return m_has_value ? std::move( m_value )  //
                       : Value( );             //
}

template < class Value, class Error >
void
Return< Value, Error >::swap( Return& other ) noexcept
{
    if ( m_has_value && other.m_has_value )
    {
        std::swap( m_value, other.m_value );
    }
    else if ( m_has_value || other.m_has_value )
    {
        auto tmp = std::move( other );
        other = std::move( *this );
        ( *this ) = std::move( tmp );
    }
    else
    {
        std::swap( m_error, other.m_error );
    }
}

template < class Value, class Error >
void
Return< Value, Error >::reset( ) noexcept
{
    if ( m_has_value )
    {
        m_value.~Value( );
        new ( &m_error )( Error )( errors::NULL_VALUE );
        m_has_value = false;
    }
    else
    {
        m_error = errors::NULL_VALUE;
    }
}

template < class Value, class Error >
auto
begin( const Return< Value, Error >& value ) -> decltype( value->begin( ) )
{
    if ( value )
    {
        return value->begin( );
    }
    else
    {
        return Value( ).begin( );
    }
}

template < class Value, class Error >
auto
end( const Return< Value, Error >& value ) -> decltype( value->end( ) )
{
    if ( value )
    {
        return value->end( );
    }
    else
    {
        return Value( ).end( );
    }
}

template < class Value, class Error >
template < class... Args >
Value&
Return< Value, Error >::emplace( Args&&... args )
{
    this->operator=( Value( std::forward< Args >( args )... ) );
    return m_value;
}

template < class Value, class Error >
template < class OtherValue, class... Args, class _ >
Value&
Return< Value, Error >::emplace( std::initializer_list< OtherValue > ilist, Args&&... args )
{
    this->operator=( Value( ilist, std::forward< Args >( args )... ) );
    return m_value;
}

template < class Value >
Return< typename std::decay< Value >::type, std::error_code >
make_value( Value&& value )
{
    return Return< typename std::decay< Value >::type, std::error_code >( value );
}

}  // hf

namespace std
{
template < class Value, class Error >
void
swap( hf::Return< Value, Error >& a, hf::Return< Value, Error >& b ) noexcept
{
    a.swap( b );
}
}
