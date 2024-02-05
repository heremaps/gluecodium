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
        ::std::string string_field;
    public:


        explicit ImmutableStructWithCppAccessors( ::std::string string_field );


        ::std::string get_string_field( ) const { return string_field; }

    };

    struct _GLUECODIUM_CPP_EXPORT MutableStructWithCppAccessors {
    private:
        ::std::string string_field;
    public:

        MutableStructWithCppAccessors( );
        explicit MutableStructWithCppAccessors( ::std::string string_field );


        ::std::string get_string_field( ) const { return string_field; }

        void set_string_field( ::std::string value_ ) { string_field = value_; }

    };

public:
    static ::smoke::Structs::Point swap_point_coordinates( const ::smoke::Structs::Point& input );
    static ::smoke::Structs::AllTypesStruct return_all_types_struct( const ::smoke::Structs::AllTypesStruct& input );
    static ::smoke::TypeCollection::Point create_point( const double x, const double y );
    static ::smoke::TypeCollection::AllTypesStruct modify_all_types_struct( const ::smoke::TypeCollection::AllTypesStruct& input );
};


}
