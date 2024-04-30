/*

 *
 */

#include "com_example_smoke_Enums.h"
#include "com_example_smoke_Enums_ExternalEnum__Conversion.h"
#include "com_example_smoke_Enums__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_Enums_methodWithExternalEnum(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::smoke::Enums::External_Enum input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::smoke::Enums::External_Enum*)nullptr);





    ::smoke::Enums::method_with_external_enum(input);

}



JNIEXPORT void JNICALL
Java_com_example_smoke_Enums_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Enums>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
