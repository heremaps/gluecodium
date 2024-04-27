/*

 *
 */

#include "com_example_smoke_OuterStruct_InnerStruct.h"
#include "com_example_smoke_OuterStruct_InnerStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_OuterStruct_00024InnerStruct_doSomething(JNIEnv* _jenv, jobject _jinstance)

{



    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::OuterStruct::InnerStruct*)nullptr);



    _ninstance.do_something();

}



}
