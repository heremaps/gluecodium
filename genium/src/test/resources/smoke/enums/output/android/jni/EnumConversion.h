#pragma once

#include <jni.h>
#include "smoke/Enums.h"
#include "foo/Bar.h"
#include "com_example_smoke_Enums.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/EnumsInTypeCollectionInterface.h"
#include "com_example_smoke_EnumsInTypeCollectionInterface.h"
#include "smoke/EnumsInTypeCollection.h"

namespace genium {
namespace jni {
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::SimpleEnum& _nout );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput );
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::InternalError& _nout );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::InternalError _ninput );
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::External_Enum& _nout );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput );
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::SomeVeryExternalEnum& _nout );
    jobject convert_to_jni( JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput );
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::TCEnum& _nout );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::TCEnum _ninput );
}
}