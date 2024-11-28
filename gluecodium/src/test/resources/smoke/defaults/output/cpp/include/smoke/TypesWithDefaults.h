// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace smoke {
struct _GLUECODIUM_CPP_EXPORT TypesWithDefaults {
    struct _GLUECODIUM_CPP_EXPORT StructWithDefaults {
        int32_t int_field = 42;
        uint32_t uint_field = 4294967295;
        float float_field = 3.14f;
        double double_field = -1.4142;
        bool bool_field = true;
        ::std::string string_field = "\\Jonny \"Magic\" Smith\n";

        StructWithDefaults( );
        StructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithDefaults {
        const int32_t int_field = 42;
        const uint32_t uint_field;
        const float float_field = 3.14f;
        const double double_field = -1.4142;
        const bool bool_field;
        const ::std::string string_field = "\\Jonny \"Magic\" Smith\n";


        ImmutableStructWithDefaults( uint32_t uint_field, bool bool_field );
        ImmutableStructWithDefaults( int32_t int_field, uint32_t uint_field, float float_field, double double_field, bool bool_field, ::std::string string_field );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithCollections {
        const std::optional< ::std::vector< int32_t > > nullable_list_field = std::optional< ::std::vector< int32_t > >();
        const ::std::vector< int32_t > empty_list_field = {};
        const ::std::vector< int32_t > values_list_field = {1, 2, 3};
        const std::optional< ::std::unordered_map< int32_t, ::std::string > > nullable_map_field = std::optional< ::std::unordered_map< int32_t, ::std::string > >();
        const ::std::unordered_map< int32_t, ::std::string > empty_map_field = {};
        const ::std::unordered_map< int32_t, ::std::string > values_map_field = {{9, "baz"}, {27, "bar"}};
        const std::optional< ::std::unordered_set< ::std::string > > nullable_set_field = std::optional< ::std::unordered_set< ::std::string > >();
        const ::std::unordered_set< ::std::string > empty_set_field = {};
        const ::std::unordered_set< ::std::string > values_set_field = {"bar", "baz"};

        ImmutableStructWithCollections( );
        ImmutableStructWithCollections( std::optional< ::std::vector< int32_t > > nullable_list_field, ::std::vector< int32_t > empty_list_field, ::std::vector< int32_t > values_list_field, std::optional< ::std::unordered_map< int32_t, ::std::string > > nullable_map_field, ::std::unordered_map< int32_t, ::std::string > empty_map_field, ::std::unordered_map< int32_t, ::std::string > values_map_field, std::optional< ::std::unordered_set< ::std::string > > nullable_set_field, ::std::unordered_set< ::std::string > empty_set_field, ::std::unordered_set< ::std::string > values_set_field );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithFieldConstructorAndCollections {
        const std::optional< ::std::vector< int32_t > > nullable_list_field = std::optional< ::std::vector< int32_t > >();
        const ::std::vector< int32_t > empty_list_field = {};
        const ::std::vector< int32_t > values_list_field = {1, 2, 3};
        const std::optional< ::std::unordered_map< int32_t, ::std::string > > nullable_map_field = std::optional< ::std::unordered_map< int32_t, ::std::string > >();
        const ::std::unordered_map< int32_t, ::std::string > empty_map_field = {};
        const ::std::unordered_map< int32_t, ::std::string > values_map_field = {{9, "baz"}, {27, "bar"}};
        const std::optional< ::std::unordered_set< ::std::string > > nullable_set_field = std::optional< ::std::unordered_set< ::std::string > >();
        const ::std::unordered_set< ::std::string > empty_set_field = {};
        const ::std::unordered_set< ::std::string > values_set_field = {"bar", "baz"};
        const int32_t some_field = 5;
        const int32_t another_field = 7;

        ImmutableStructWithFieldConstructorAndCollections( );

        ImmutableStructWithFieldConstructorAndCollections( int32_t some_field, int32_t another_field );

        ImmutableStructWithFieldConstructorAndCollections( std::optional< ::std::vector< int32_t > > nullable_list_field, ::std::vector< int32_t > empty_list_field, ::std::vector< int32_t > values_list_field, std::optional< ::std::unordered_map< int32_t, ::std::string > > nullable_map_field, ::std::unordered_map< int32_t, ::std::string > empty_map_field, ::std::unordered_map< int32_t, ::std::string > values_map_field, std::optional< ::std::unordered_set< ::std::string > > nullable_set_field, ::std::unordered_set< ::std::string > empty_set_field, ::std::unordered_set< ::std::string > values_set_field, int32_t some_field, int32_t another_field );

    };

    struct _GLUECODIUM_CPP_EXPORT SomeImmutableStructWithDefaults {
        const int32_t int_field = 42;

        SomeImmutableStructWithDefaults( );
        explicit SomeImmutableStructWithDefaults( int32_t int_field );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithFieldUsingImmutableStruct {
        const ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults some_field1 = ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults{};
        const ::smoke::TypesWithDefaults::ImmutableStructWithCollections some_field2 = ::smoke::TypesWithDefaults::ImmutableStructWithCollections{};

        ImmutableStructWithFieldUsingImmutableStruct( );
        ImmutableStructWithFieldUsingImmutableStruct( ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults some_field1, ::smoke::TypesWithDefaults::ImmutableStructWithCollections some_field2 );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithFieldConstructorAndFieldUsingImmutableStruct {
        const ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults some_field1 = ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults{};
        const ::smoke::TypesWithDefaults::ImmutableStructWithCollections some_field2 = ::smoke::TypesWithDefaults::ImmutableStructWithCollections{};
        const int32_t some_field = 5;
        const int32_t another_field = 7;

        ImmutableStructWithFieldConstructorAndFieldUsingImmutableStruct( );

        ImmutableStructWithFieldConstructorAndFieldUsingImmutableStruct( int32_t some_field, int32_t another_field );

        ImmutableStructWithFieldConstructorAndFieldUsingImmutableStruct( ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults some_field1, ::smoke::TypesWithDefaults::ImmutableStructWithCollections some_field2, int32_t some_field, int32_t another_field );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithNullableFieldUsingImmutableStruct {
        const std::optional< ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults > some_field1 = ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults{};
        const std::optional< ::smoke::TypesWithDefaults::ImmutableStructWithCollections > some_field2 = ::smoke::TypesWithDefaults::ImmutableStructWithCollections{};

        ImmutableStructWithNullableFieldUsingImmutableStruct( );
        ImmutableStructWithNullableFieldUsingImmutableStruct( std::optional< ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults > some_field1, std::optional< ::smoke::TypesWithDefaults::ImmutableStructWithCollections > some_field2 );

    };

    struct _GLUECODIUM_CPP_EXPORT ImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct {
        const std::optional< ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults > some_field1 = ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults{};
        const std::optional< ::smoke::TypesWithDefaults::ImmutableStructWithCollections > some_field2 = ::smoke::TypesWithDefaults::ImmutableStructWithCollections{};
        const int32_t some_field = 5;
        const int32_t another_field = 7;

        ImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct( );

        ImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct( int32_t some_field, int32_t another_field );

        ImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct( std::optional< ::smoke::TypesWithDefaults::SomeImmutableStructWithDefaults > some_field1, std::optional< ::smoke::TypesWithDefaults::ImmutableStructWithCollections > some_field2, int32_t some_field, int32_t another_field );

    };

};


}
