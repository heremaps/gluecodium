/*

 *
 */

#include "com_example_smoke_Constructors.h"
#include "com_example_smoke_Constructors_ErrorEnum__Conversion.h"
#include "com_example_smoke_Constructors__Conversion.h"
#include "JniExceptionThrower.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jlong
Java_com_example_smoke_Constructors_create__(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::Constructors::create();

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Constructors >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Constructors_create__Lcom_example_smoke_Constructors_2(JNIEnv* _jenv, jobject _jinstance, jobject jother)

{



    ::std::shared_ptr< ::smoke::Constructors > other = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jother),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::Constructors >>{});





    auto _result = ::smoke::Constructors::create(other);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Constructors >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Constructors_create__Ljava_lang_String_2J(JNIEnv* _jenv, jobject _jinstance, jstring jfoo, jlong jbar)

{



    ::std::string foo = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jfoo),
            ::gluecodium::jni::TypeId<::std::string>{});



    uint64_t bar = jbar;





    auto _result = ::smoke::Constructors::create(foo,bar);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Constructors >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Constructors_create__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput)

{

    ::gluecodium::jni::JniExceptionThrower _throw_exception(_jenv);



    ::std::string input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::string>{});





    auto nativeCallResult = ::smoke::Constructors::create(input);


    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nErrorValue = static_cast<::smoke::Constructors::ErrorEnum>(errorCode.value());
        auto jErrorValue = ::gluecodium::jni::convert_to_jni(_jenv, nErrorValue);

        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Constructors$ConstructorExplodedException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Constructors$ErrorEnum;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _throw_exception.register_exception(std::move(exception));
        return 0;
    }
    auto _result = nativeCallResult.unsafe_value();


    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Constructors >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Constructors_create__Ljava_util_List_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::vector< double > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::vector< double >>{});





    auto _result = ::smoke::Constructors::create(input);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Constructors >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}



JNIEXPORT void JNICALL
Java_com_example_smoke_Constructors_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Constructors>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

JNIEXPORT void JNICALL
Java_com_example_smoke_Constructors_cacheThisInstance(JNIEnv* _jenv, jobject _jinstance)
{
    auto jobj = ::gluecodium::jni::make_non_releasing_ref(_jinstance);
    auto long_ptr = ::gluecodium::jni::get_class_native_handle(_jenv, jobj);
    auto nobj = *reinterpret_cast<std::shared_ptr<::smoke::Constructors>*>(long_ptr);

    ::gluecodium::jni::JniWrapperCache::cache_wrapper(_jenv, nobj, jobj);

}
}
