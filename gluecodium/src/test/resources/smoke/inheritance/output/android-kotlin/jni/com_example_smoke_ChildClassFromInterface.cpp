/*

 *
 */

#include "com_example_smoke_ChildClassFromInterface.h"
#include "com_example_smoke_ChildClassFromInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_ChildClassFromInterface_childClassMethod(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->child_class_method();

}


void
Java_com_example_smoke_ChildClassFromInterface_rootMethod(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->root_method();

}


jstring
Java_com_example_smoke_ChildClassFromInterface_getRootProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_root_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_ChildClassFromInterface_setRootProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)

{



    ::std::string value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::string>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_root_property(value);

}



JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
