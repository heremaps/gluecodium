/*
 *
 */
#include "com_example_smoke_SimpleClass__Conversion.h"
#include "com_example_smoke_SimpleInterface__Conversion.h"
#include "com_example_smoke_StructWithInstances.h"
#include "com_example_smoke_StructWithInstances__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
jobject
Java_com_example_smoke_StructWithInstances_useSimpleClass(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::shared_ptr< ::smoke::SimpleClass > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::shared_ptr< ::smoke::SimpleClass >*)nullptr);
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::StructWithInstances*)nullptr);
    auto result = _ninstance.use_simple_class(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_StructWithInstances_useSimpleInterface(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::shared_ptr< ::smoke::SimpleInterface > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::shared_ptr< ::smoke::SimpleInterface >*)nullptr);
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::StructWithInstances*)nullptr);
    auto result = _ninstance.use_simple_interface(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
}
