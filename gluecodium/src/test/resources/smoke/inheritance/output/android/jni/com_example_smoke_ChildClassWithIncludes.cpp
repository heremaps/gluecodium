/*

 *
 */

#include "com_example_smoke_ChildClassWithIncludes.h"
#include "com_example_smoke_ChildClassWithIncludes__Conversion.h"
#include "com_example_smoke_IncludableClass__Conversion.h"
#include "com_example_smoke_IncludableEnum__Conversion.h"
#include "com_example_smoke_IncludableLambda__Conversion.h"
#include "com_example_smoke_IncludableStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {


jobject
Java_com_example_smoke_ChildClassWithIncludes_rootMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput1, jobject jinput2)

{



    ::smoke::IncludableStruct input1 = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput1),
            ::gluecodium::jni::TypeId<::smoke::IncludableStruct>{});



    ::smoke::IncludableEnum input2 = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput2),
            ::gluecodium::jni::TypeId<::smoke::IncludableEnum>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassWithIncludes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->root_method(input1,input2);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jobject
Java_com_example_smoke_ChildClassWithIncludes_getRootProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassWithIncludes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_root_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_ChildClassWithIncludes_setRootProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::smoke::IncludableLambda value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::smoke::IncludableLambda>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassWithIncludes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_root_property(value);

}



JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassWithIncludes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::ChildClassWithIncludes>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
