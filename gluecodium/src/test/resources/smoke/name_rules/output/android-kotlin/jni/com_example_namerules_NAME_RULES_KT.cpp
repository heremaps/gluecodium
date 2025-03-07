/*

 *
 */

#include "com_example_namerules_NAME_RULES_KT.h"
#include "com_example_namerules_NAME_RULES_KT_EXAMPLE_ERROR_CODE_KT__Conversion.h"
#include "com_example_namerules_NAME_RULES_KT_EXAMPLE_STRUCT_KT__Conversion.h"
#include "com_example_namerules_NAME_RULES_KT__Conversion.h"
#include "JniExceptionThrower.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jlong
Java_com_example_namerules_NAME_1RULES_1KT_create(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::namerules::NameRules::create();

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::namerules::NameRules >(_result);
    if (nSharedPtr == nullptr)
    {
        ::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jdouble
Java_com_example_namerules_NAME_1RULES_1KT_some_1method(JNIEnv* _jenv, jobject _jinstance, jobject jsomeArgument)

{

    ::jni::JniExceptionThrower _throw_exception(_jenv);



    ::namerules::NameRules::ExampleStruct someArgument = ::jni::convert_from_jni(_jenv,
            ::jni::make_non_releasing_ref(jsomeArgument),
            ::jni::TypeId<::namerules::NameRules::ExampleStruct>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    auto nativeCallResult = (*pInstanceSharedPointer)->someMethod(someArgument);


    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nErrorValue = static_cast<::namerules::NameRules::ExampleErrorCode>(errorCode.value());
        auto jErrorValue = ::jni::convert_to_jni(_jenv, nErrorValue);

        auto exceptionClass = ::jni::find_class(_jenv, "com/example/namerules/NAME_RULES_KT$ExampleException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/namerules/NAME_RULES_KT$EXAMPLE_ERROR_CODE_KT;)V");
        auto exception = ::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _throw_exception.register_exception(std::move(exception));
        return nativeCallResult.unsafe_value();
    }
    auto _result = nativeCallResult.unsafe_value();


    return _result;
}


jlong
Java_com_example_namerules_NAME_1RULES_1KT_get_1int_1property(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->retrieve_int_property();

    return _result;
}



void
Java_com_example_namerules_NAME_1RULES_1KT_set_1int_1property(JNIEnv* _jenv, jobject _jinstance, jlong jvalue)

{



    uint32_t value = jvalue;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->STORE_INT_PROPERTY_NOW(value);

}



jboolean
Java_com_example_namerules_NAME_1RULES_1KT_is_1boolean_1property(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->really_boolean_property();

    return _result;
}



void
Java_com_example_namerules_NAME_1RULES_1KT_set_1boolean_1property(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)

{



    bool value = jvalue;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->STORE_BOOLEAN_PROPERTY_NOW(value);

}



jobject
Java_com_example_namerules_NAME_1RULES_1KT_get_1struct_1property(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->retrieve_struct_property();

    return ::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_namerules_NAME_1RULES_1KT_set_1struct_1property(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::namerules::NameRules::ExampleStruct value = ::jni::convert_from_jni(_jenv,
            ::jni::make_non_releasing_ref(jvalue),
            ::jni::TypeId<::namerules::NameRules::ExampleStruct>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (

        ::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->STORE_STRUCT_PROPERTY_NOW(value);

}




JNIEXPORT void JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*>(_jpointerRef);
    ::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

JNIEXPORT void JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_cacheThisInstance(JNIEnv* _jenv, jobject _jinstance)
{
    auto jobj = ::jni::make_non_releasing_ref(_jinstance);
    auto long_ptr = ::jni::get_class_native_handle(_jenv, jobj);
    auto nobj = *reinterpret_cast<std::shared_ptr<::namerules::NameRules>*>(long_ptr);

    ::jni::JniWrapperCache::cache_wrapper(_jenv, nobj, jobj);

}
}
