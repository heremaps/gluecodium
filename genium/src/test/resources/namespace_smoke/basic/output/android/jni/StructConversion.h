#pragma once
#include <jni.h>
#include "root/space/smoke/Basic.h"
#include "com_example_smoke_Basic.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "root/space/smoke/BasicTypes.h"
namespace genium {
namespace jni {
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::root::space::smoke::SomeStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput);
}
}
