/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

#pragma once

#include <jni.h>
#include "smoke/CalculatorListener.h"
#include "android/jni/com_example_smoke_CalculatorListenerImpl.h"
#include "android/jni/JniCppConversionUtils.h"
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/CppProxyBase.h"
#include "android/jni/JniBase.h"

#ifdef __cplusplus
extern "C" {
#endif

namespace smoke {

class CalculatorListenerCppProxy : public here::internal::CppProxyBase, public CalculatorListener {
public:
    CalculatorListenerCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode );

    void on_calculation_result( const double ncalculationResult ) override;
    void on_calculation_result_const( const double ncalculationResult ) const override;
    void on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) override;
    void on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) override;
};

}

#ifdef __cplusplus
}
#endif