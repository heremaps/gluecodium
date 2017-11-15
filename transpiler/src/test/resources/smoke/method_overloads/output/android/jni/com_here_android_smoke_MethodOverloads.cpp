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
#include "smoke/MethodOverloads.h"
#include "android/jni/com_here_android_smoke_MethodOverloads.h"
#include "android/jni/JniCppConversionUtils.h"
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/CppProxyBase.h"
#include "android/jni/InstanceConversion.h"
#include "android/jni/StructConversion.h"
#include "android/jni/ProxyConversion.h"
#include "android/jni/EnumConversion.h"
#include "android/jni/ArrayConversionUtils.h"

extern "C" {

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__Z(JNIEnv* _jenv, jobject _jinstance, jboolean jinput)
{
    bool input = jinput;
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input);
    return result;
}

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__B(JNIEnv* _jenv, jobject _jinstance, jbyte jinput)
{
    int8_t input = jinput;
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input);
    return result;
}

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput)
{
    ::std::string input;
    here::internal::convert_from_jni( _jenv, jinput, input );
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input);
    return result;
}

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__Lcom_here_android_smoke_MethodOverloads_00024Point_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::MethodOverloads::Point input;
    here::internal::convert_from_jni( _jenv, jinput, input );
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input);
    return result;
}

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__ZBLjava_lang_String_2Lcom_here_android_smoke_MethodOverloads_00024Point_2(JNIEnv* _jenv, jobject _jinstance, jboolean jinput1, jbyte jinput2, jstring jinput3, jobject jinput4)
{
    bool input1 = jinput1;
    int8_t input2 = jinput2;
    ::std::string input3;
    here::internal::convert_from_jni( _jenv, jinput3, input3 );
    ::smoke::MethodOverloads::Point input4;
    here::internal::convert_from_jni( _jenv, jinput4, input4 );
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input1,input2,input3,input4);
    return result;
}

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__Ljava_util_List_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::MethodOverloads::StringArray input;
    here::internal::convert_from_jni( _jenv, jinput, input );
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input);
    return result;
}

jboolean
Java_com_here_android_smoke_MethodOverloads_isBoolean__Ljava_util_List_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::MethodOverloads::IntArray input;
    here::internal::convert_from_jni( _jenv, jinput, input );
    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->is_boolean(input);
    return result;
}

void
Java_com_here_android_smoke_MethodOverloads_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*> (_jpointerRef);
}
}
