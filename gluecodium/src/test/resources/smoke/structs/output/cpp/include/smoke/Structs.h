// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include "smoke/TypeCollection.h"
#include <cstdint>
#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT Structs {
public:
    Structs();
    virtual ~Structs();


public:
    enum class FooBar {
        FOO,
        BAR
    };


    struct _GLUECODIUM_CPP_EXPORT Point {
        double x;
        double y;

        Point( );
        Point( double x, double y );

        static ::smoke::Structs::Point from_polar( const double phi, const double r );

    };

    struct _GLUECODIUM_CPP_EXPORT Line {
        ::smoke::Structs::Point a;
        ::smoke::Structs::Point b;

        Line( );
        Line( ::smoke::Structs::Point a, ::smoke::Structs::Point b );

    };

    struct _GLUECODIUM_CPP_EXPORT AllTypesStruct {
        const int8_t int8_field;
        const uint8_t uint8_field;
        const int16_t int16_field;
        const uint16_t uint16_field;
        const int32_t int32_field;
        const uint32_t uint32_field;
        const int64_t int64_field;
        const uint64_t uint64_field;
        const float float_field;
        const double double_field;
        const ::std::string string_field;
        const bool boolean_field;
        const ::std::shared_ptr< ::std::vector< uint8_t > > bytes_field;
        const ::smoke::Structs::Point point_field;


        AllTypesStruct( int8_t int8_field, uint8_t uint8_field, int16_t int16_field, uint16_t uint16_field, int32_t int32_field, uint32_t uint32_field, int64_t int64_field, uint64_t uint64_field, float float_field, double double_field, ::std::string string_field, bool boolean_field, ::std::shared_ptr< ::std::vector< uint8_t > > bytes_field, ::smoke::Structs::Point point_field );

    };

    using ArrayOfImmutable = ::std::vector< ::smoke::Structs::AllTypesStruct >;

    struct _GLUECODIUM_CPP_EXPORT NestingImmutableStruct {
        ::smoke::Structs::AllTypesStruct struct_field;


        explicit NestingImmutableStruct( ::smoke::Structs::AllTypesStruct struct_field );

    };

    struct _GLUECODIUM_CPP_EXPORT DoubleNestingImmutableStruct {
        ::smoke::Structs::NestingImmutableStruct nesting_struct_field;


        explicit DoubleNestingImmutableStruct( ::smoke::Structs::NestingImmutableStruct nesting_struct_field );

    };

    struct _GLUECODIUM_CPP_EXPORT StructWithArrayOfImmutable {
        ::smoke::Structs::ArrayOfImmutable array_field;

        StructWithArrayOfImmutable( );
        explicit StructWithArrayOfImmutable( ::smoke::Structs::ArrayOfImmutable array_field );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithCppAccessors {
    private:
        int32_t trivial_int_field;
        double trivial_double_field;
        ::std::string nontrivial_string_field;
        ::smoke::Structs::Point nontrivial_point_field;
        std::optional< ::smoke::Structs::Point > nontrivial_optional_point = std::optional< ::smoke::Structs::Point >();
    public:


        ImmutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field );
        ImmutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field, std::optional< ::smoke::Structs::Point > nontrivial_optional_point );


        int32_t get_trivial_int_field( ) const { return trivial_int_field; }

        double get_trivial_double_field( ) const { return trivial_double_field; }

        const ::std::string& get_nontrivial_string_field( ) const & { return nontrivial_string_field; }
        ::std::string&& get_nontrivial_string_field( ) && { return std::move(nontrivial_string_field); }
        const ::std::string&& get_nontrivial_string_field( ) const && { return std::move(nontrivial_string_field); }

        const ::smoke::Structs::Point& get_nontrivial_point_field( ) const & { return nontrivial_point_field; }
        ::smoke::Structs::Point&& get_nontrivial_point_field( ) && { return std::move(nontrivial_point_field); }
        const ::smoke::Structs::Point&& get_nontrivial_point_field( ) const && { return std::move(nontrivial_point_field); }

        const std::optional< ::smoke::Structs::Point >& get_nontrivial_optional_point( ) const & { return nontrivial_optional_point; }
        std::optional< ::smoke::Structs::Point >&& get_nontrivial_optional_point( ) && { return std::move(nontrivial_optional_point); }
        const std::optional< ::smoke::Structs::Point >&& get_nontrivial_optional_point( ) const && { return std::move(nontrivial_optional_point); }

    };

    struct _GLUECODIUM_CPP_EXPORT MutableStructWithCppAccessors {
    private:
        int32_t trivial_int_field;
        double trivial_double_field;
        ::std::string nontrivial_string_field;
        ::smoke::Structs::Point nontrivial_point_field;
        std::optional< ::smoke::Structs::Point > nontrivial_optional_point = std::optional< ::smoke::Structs::Point >();
    public:

        MutableStructWithCppAccessors( );
        MutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field );
        MutableStructWithCppAccessors( int32_t trivial_int_field, double trivial_double_field, ::std::string nontrivial_string_field, ::smoke::Structs::Point nontrivial_point_field, std::optional< ::smoke::Structs::Point > nontrivial_optional_point );


        int32_t get_trivial_int_field( ) const { return trivial_int_field; }

        void set_trivial_int_field( int32_t value_ ) { trivial_int_field = value_; }

        double get_trivial_double_field( ) const { return trivial_double_field; }

        void set_trivial_double_field( double value_ ) { trivial_double_field = value_; }

        const ::std::string& get_nontrivial_string_field( ) const & { return nontrivial_string_field; }
        ::std::string&& get_nontrivial_string_field( ) && { return std::move(nontrivial_string_field); }
        const ::std::string&& get_nontrivial_string_field( ) const && { return std::move(nontrivial_string_field); }

        void set_nontrivial_string_field( const ::std::string& value_ ) { nontrivial_string_field = value_; }
        void set_nontrivial_string_field( ::std::string&& value_ ) { nontrivial_string_field = std::move(value_); }

        const ::smoke::Structs::Point& get_nontrivial_point_field( ) const & { return nontrivial_point_field; }
        ::smoke::Structs::Point&& get_nontrivial_point_field( ) && { return std::move(nontrivial_point_field); }
        const ::smoke::Structs::Point&& get_nontrivial_point_field( ) const && { return std::move(nontrivial_point_field); }

        void set_nontrivial_point_field( const ::smoke::Structs::Point& value_ ) { nontrivial_point_field = value_; }
        void set_nontrivial_point_field( ::smoke::Structs::Point&& value_ ) { nontrivial_point_field = std::move(value_); }

        const std::optional< ::smoke::Structs::Point >& get_nontrivial_optional_point( ) const & { return nontrivial_optional_point; }
        std::optional< ::smoke::Structs::Point >&& get_nontrivial_optional_point( ) && { return std::move(nontrivial_optional_point); }
        const std::optional< ::smoke::Structs::Point >&& get_nontrivial_optional_point( ) const && { return std::move(nontrivial_optional_point); }

        void set_nontrivial_optional_point( const std::optional< ::smoke::Structs::Point >& value_ ) { nontrivial_optional_point = value_; }
        void set_nontrivial_optional_point( std::optional< ::smoke::Structs::Point >&& value_ ) { nontrivial_optional_point = std::move(value_); }

    };

public:
    static ::smoke::Structs::Point swap_point_coordinates( const ::smoke::Structs::Point& input );
    static ::smoke::Structs::AllTypesStruct return_all_types_struct( const ::smoke::Structs::AllTypesStruct& input );
    static ::smoke::TypeCollection::Point create_point( const double x, const double y );
    static ::smoke::TypeCollection::AllTypesStruct modify_all_types_struct( const ::smoke::TypeCollection::AllTypesStruct& input );
};


}
