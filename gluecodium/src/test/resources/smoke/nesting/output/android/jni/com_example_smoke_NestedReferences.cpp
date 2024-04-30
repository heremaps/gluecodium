/*

 *
 */

#include "com_example_smoke_NestedReferences.h"
#include "com_example_smoke_NestedReferences_NestedReferences__Conversion.h"
#include "com_example_smoke_NestedReferences__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_NestedReferences_insideOut(JNIEnv* _jenv, jobject _jinstance, jobject jstruct1, jobject jstruct2)

{



    ::smoke::NestedReferences::NestedReferences struct1 = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jstruct1),
            (::smoke::NestedReferences::NestedReferences*)nullptr);



    ::smoke::NestedReferences::NestedReferences struct2 = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jstruct2),
            (::smoke::NestedReferences::NestedReferences*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::NestedReferences>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->inside_out(struct1,struct2);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_NestedReferences_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::NestedReferences>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
