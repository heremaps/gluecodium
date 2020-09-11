/*
 *
 */
#include "com_example_smoke_OuterStruct.h"
#include "com_example_smoke_OuterStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
void
Java_com_example_smoke_OuterStruct_doNothing(JNIEnv* _jenv, jobject _jinstance)
{
    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::OuterStruct*)nullptr);
    _ninstance.do_nothing();
}
}
