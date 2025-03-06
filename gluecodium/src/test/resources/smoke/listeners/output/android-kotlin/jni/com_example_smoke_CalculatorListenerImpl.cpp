/*

 *
 */

#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_CalculatorListenerImpl.h"
#include "com_example_smoke_CalculatorListener_ResultStruct__Conversion.h"
#include "com_example_smoke_CalculatorListener__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResult(JNIEnv* _jenv, jobject _jinstance, jdouble jcalculationResult)

{



    double calculationResult = jcalculationResult;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_calculation_result(calculationResult);

}

void
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultConst(JNIEnv* _jenv, jobject _jinstance, jdouble jcalculationResult)

{



    double calculationResult = jcalculationResult;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_calculation_result_const(calculationResult);

}

void
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultStruct(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResult)

{



    ::smoke::CalculatorListener::ResultStruct calculationResult = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jcalculationResult),
            ::gluecodium::jni::TypeId<::smoke::CalculatorListener::ResultStruct>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_calculation_result_struct(calculationResult);

}

void
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultArray(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResult)

{



    ::std::vector< double > calculationResult = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jcalculationResult),
            ::gluecodium::jni::TypeId<::std::vector< double >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_calculation_result_array(calculationResult);

}

void
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultMap(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResults)

{



    ::smoke::CalculatorListener::NamedCalculationResults calculationResults = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jcalculationResults),
            ::gluecodium::jni::TypeId<::smoke::CalculatorListener::NamedCalculationResults>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_calculation_result_map(calculationResults);

}

void
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultInstance(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResult)

{



    ::std::shared_ptr< ::smoke::CalculationResult > calculationResult = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jcalculationResult),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::CalculationResult >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_calculation_result_instance(calculationResult);

}



JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::CalculatorListener>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
