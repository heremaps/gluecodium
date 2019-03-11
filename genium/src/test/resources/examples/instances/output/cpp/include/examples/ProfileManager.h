// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <string>

namespace examples {

class ProfileManager {
public:
    virtual ~ProfileManager() = 0;

public:
virtual void create_profile( const ::std::string& username ) = 0;
virtual ::std::string change_profile( const ::std::string& username ) = 0;
virtual void delete_profile( const ::std::string& username ) = 0;

};

}
