// -------------------------------------------------------------------------------------------------
//
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
struct ParentStruct {
    float parent_field;
    ParentStruct( );
    ParentStruct( const float parent_field );
};
struct ChildStruct: public ::smoke::ParentStruct {
    int32_t child_field;
    ChildStruct( );
    ChildStruct( const float parent_field, const int32_t child_field );
};
struct GrandChildStruct: public ::smoke::ChildStruct {
    ::std::string grand_child_field;
    GrandChildStruct( );
    GrandChildStruct( const float parent_field, const int32_t child_field, const ::std::string& grand_child_field );
};
}
