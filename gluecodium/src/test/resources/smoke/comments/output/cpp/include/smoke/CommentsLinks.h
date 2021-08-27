// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "smoke/Comments.h"
#include <string>
#include <system_error>
namespace smoke {
/**
 * The nested types like ::smoke::CommentsLinks::random_method(const ::std::string&, const bool) don't need full name prefix, but it's
 * possible to references other interfaces like ::smoke::CommentsInterface or other members
 * ::smoke::Comments::some_method_with_all_comments.
 *
 * Weblinks are not modified like this [example1], [example2](http://www.example.com/2) or <https://www.example.com/3>.
 *
 * [example1]: http://example.com/1
 */
class _GLUECODIUM_CPP_EXPORT CommentsLinks {
public:
    CommentsLinks();
    virtual ~CommentsLinks() = 0;
public:
    /**
     * Links also work in:
     */
    struct _GLUECODIUM_CPP_EXPORT RandomStruct {
        /**
         * Some random field ::smoke::Comments::SomeStruct
         */
        ::smoke::Comments::SomeStruct random_field;
        /**
         * constructor comments ::smoke::Comments::SomeStruct
         */
        RandomStruct( );
        /**
         * constructor comments ::smoke::Comments::SomeStruct
         * \param random_field Some random field ::smoke::Comments::SomeStruct
         */
        RandomStruct( ::smoke::Comments::SomeStruct random_field );
    };
public:
    /**
     * Link types:
     * * constant: ::smoke::Comments::VERY_USEFUL
     * * struct: ::smoke::Comments::SomeStruct
     * * struct field: ::smoke::Comments::SomeStruct::some_field
     * * enum: ::smoke::Comments::SomeEnum
     * * enum item: ::smoke::Comments::SomeEnum::USEFUL
     * * property: ::smoke::Comments::is_some_property
     * * property setter: ::smoke::Comments::set_some_property
     * * property getter: ::smoke::Comments::is_some_property
     * * method: ::smoke::Comments::some_method_with_all_comments
     * * method with signature: ::smoke::Comments::one_parameter_comment_only
     * * method with signature with no spaces: ::smoke::Comments::one_parameter_comment_only
     * * parameter: input_parameter
     * * top level constant: ::smoke::TYPE_COLLECTION_CONSTANT
     * * top level struct: ::smoke::TypeCollectionStruct
     * * top level struct field: ::smoke::TypeCollectionStruct::field
     * * top level enum: ::smoke::TypeCollectionEnum
     * * top level enum item: ::smoke::TypeCollectionEnum::ITEM
     * * error: ::smoke::Comments::SomeEnum
     * * lambda: ::smoke::Comments::SomeLambda
     * * type from aux sources, same package: ::smoke::AuxClass
     * * type from aux sources, different package: ::fire::AuxStruct
     *   * we can also have
     *   * nested lists
     *
     * Not working for Java:
     * * typedef: ::smoke::Comments::Usefulness
     * * top level typedef: ::smoke::TypeCollectionTypedef
     *
     * Not working for Swift:
     * * named comment: [Alternative name for the link, stripped for Swift]::smoke::Comments::VERY_USEFUL
     * \param[in] input_parameter Sometimes takes ::smoke::Comments::SomeEnum::USEFUL
     * \return Sometimes returns ::smoke::Comments::SomeEnum::USEFUL
     * \retval ::smoke::Comments::SomeEnum May or may not throw ::smoke::Comments::SomeEnum
     */
    virtual ::gluecodium::Return< ::smoke::Comments::SomeEnum, ::std::error_code > random_method( const ::smoke::Comments::SomeEnum input_parameter ) = 0;
    /**
     * Links to method overloads:
     * * other one: ::smoke::CommentsLinks::random_method(const ::smoke::Comments::SomeEnum)
     * * this one: ::smoke::CommentsLinks::random_method(const ::std::string&, const bool)
     * * ambiguous one: ::smoke::CommentsLinks::random_method(const ::std::string&, const bool)
     * \param[in] text
     * \param[in] flag
     */
    virtual void random_method( const ::std::string& text, const bool flag ) = 0;
};
}
