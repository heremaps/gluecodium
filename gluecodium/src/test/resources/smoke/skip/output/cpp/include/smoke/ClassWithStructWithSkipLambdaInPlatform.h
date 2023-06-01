// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium\ExportGluecodiumCpp.h"
#include <cstdint>
#include <functional>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT ClassWithStructWithSkipLambdaInPlatform {
public:
    ClassWithStructWithSkipLambdaInPlatform();
    virtual ~ClassWithStructWithSkipLambdaInPlatform() = 0;

public:
    struct _GLUECODIUM_CPP_EXPORT SkipLambdaInPlatform {
        using SomeLambda = ::std::function<int32_t()>;

        int32_t int_field;
        ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform::SomeLambda some_lambda;

        SkipLambdaInPlatform( );
        SkipLambdaInPlatform( int32_t int_field, ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform::SomeLambda some_lambda );

        ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform::SomeLambda use_lambda( const ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform::SomeLambda& some_lambda ) const;

    };

};


}
