/*

 *
 */

#include "com_example_smoke_OuterStruct_InnerStruct.h"
#include "com_example_smoke_OuterStruct_InnerStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_OuterStruct_00024InnerStruct_doSomething(JNIEnv* _jenv, jobject _jinstance)

{



    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        ::gluecodium::jni::TypeId<::smoke::OuterStruct::InnerStruct>{});



    _ninstance.do_something();

}



}
