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
#include <memory>
#include <string>
namespace smoke {
    class Constructors;
}
namespace smoke {
class Constructors {
public:
    virtual ~Constructors() = 0;
public:
static ::std::shared_ptr< ::smoke::Constructors > create(  );
static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::shared_ptr< ::smoke::Constructors >& other );
static ::std::shared_ptr< ::smoke::Constructors > create( const ::std::string& foo, const uint64_t bar );
};
}
