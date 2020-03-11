// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Hash.h"
#include "gluecodium/TypeRepository.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT EquatableInterface {
public:
    EquatableInterface();
    virtual ~EquatableInterface() = 0;
public:
    bool operator==( const EquatableInterface& rhs );
    bool operator!=( const EquatableInterface& rhs );
};
}
namespace gluecodium {
template<>
struct hash< ::smoke::EquatableInterface > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::EquatableInterface& t ) const;
};
template <>
struct EqualityHash< std::shared_ptr< ::smoke::EquatableInterface > >
{
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const std::shared_ptr< ::smoke::EquatableInterface >& t ) const;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::EquatableInterface*);
}
