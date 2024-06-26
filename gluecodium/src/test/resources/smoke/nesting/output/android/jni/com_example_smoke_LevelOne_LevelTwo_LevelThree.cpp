/*

 *
 */

#include "com_example_smoke_LevelOne_LevelTwo_LevelThree.h"
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree_LevelFour__Conversion.h"
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree__Conversion.h"
#include "com_example_smoke_OuterClass_InnerInterface__Conversion.h"
#include "com_example_smoke_OuterInterface_InnerClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_LevelOne_00024LevelTwo_00024LevelThree_foo(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::shared_ptr< ::smoke::OuterClass::InnerInterface > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::OuterClass::InnerInterface >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->foo(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_LevelOne_00024LevelTwo_00024LevelThree_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
