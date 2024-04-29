/*

 *
 */

#include "com_example_smoke_UnreasonablyLazyClass__Conversion.h"
#include "com_example_smoke_UseOptimizedList.h"
#include "com_example_smoke_UseOptimizedList__Conversion.h"
#include "com_example_smoke_VeryBigStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_UseOptimizedList_fetchTheBigOnes(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::UseOptimizedList::fetch_the_big_ones();

    return ::gluecodium::jni::convert_to_jni_optimized(_jenv, _result, "com/example/smoke/UseOptimizedList$VeryBigStructLazyNativeList").release();
}


jobject
Java_com_example_smoke_UseOptimizedList_getLazyOnes(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::UseOptimizedList::get_lazy_ones();

    return ::gluecodium::jni::convert_to_jni_optimized(_jenv, _result, "com/example/smoke/UseOptimizedList$UnreasonablyLazyClassLazyNativeList").release();
}




JNIEXPORT void JNICALL
Java_com_example_smoke_UseOptimizedList_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::UseOptimizedList>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
