/*

 *
 */

#include "com_example_smoke_OuterStruct.h"
#include "com_example_smoke_OuterStruct_InnerEnum__Conversion.h"
#include "com_example_smoke_OuterStruct__Conversion.h"
#include "JniExceptionThrower.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_OuterStruct_doNothing(JNIEnv* _jenv, jobject _jinstance)

{

    ::gluecodium::jni::JniExceptionThrower _throw_exception(_jenv);



    auto _ninstance = ::gluecodium::jni::convert_from_jni(_jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        (::smoke::OuterStruct*)nullptr);



    auto nativeCallResult = _ninstance.do_nothing();


    auto errorCode = nativeCallResult;
    if (errorCode)
    {
        auto nErrorValue = static_cast<::smoke::OuterStruct::TypeAlias>(errorCode.value());
        auto jErrorValue = ::gluecodium::jni::convert_to_jni(_jenv, nErrorValue);

        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/OuterStruct$InstantiationException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/OuterStruct$InnerEnum;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _throw_exception.register_exception(std::move(exception));
    }


}



}
