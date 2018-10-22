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
    ::smoke::Enums::SimpleEnum convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::SimpleEnum* dummy );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput );
    ::smoke::Enums::InternalError convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::InternalError* dummy );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::InternalError _ninput );
    ::smoke::Enums::External_Enum convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::External_Enum* dummy );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput );
    ::fire::SomeVeryExternalEnum convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::SomeVeryExternalEnum* dummy );
    jobject convert_to_jni( JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput );
    ::smoke::TCEnum convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::TCEnum* dummy );
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::TCEnum _ninput );
}
}
