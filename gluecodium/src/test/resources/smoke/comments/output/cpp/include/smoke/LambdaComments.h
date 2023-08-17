// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <functional>
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT LambdaComments {
public:
    LambdaComments();
    virtual ~LambdaComments() = 0;
public:
    /**
     * The first line of the doc.
     * \param[in] p0 The first input parameter
     */
    using WithNoNamedParameters = ::std::function<::std::string(const ::std::string&)>;
    /**
     * The first line of the doc.
     */
    using WithNoDocsForParameters = ::std::function<::std::string(const ::std::string&)>;
    /**
     * The first line of the doc.
     * \param[in] inputParameter The first input parameter. The second sentence of the first input parameter.
     * \return The string.
     */
    using WithNamedParameters = ::std::function<::std::string(const ::std::string& inputParameter)>;
    /**
     * The first line of the doc.
     * \return The string.
     */
    using MixedDocNameParameters = ::std::function<::std::string(const ::std::string& inputParameter, const ::std::string& secondInputParameter)>;
    using NoCommentsNoNamedParams = ::std::function<::std::string(const ::std::string&, const ::std::string&)>;
    using NoCommentsWithNamedParams = ::std::function<::std::string(const ::std::string& first, const ::std::string& second)>;
};
}