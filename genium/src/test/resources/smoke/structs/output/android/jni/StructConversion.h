#pragma once
#include <jni.h>
#include "smoke/Structs.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "com_example_smoke_Structs.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/StructsFromTypeCollection.h"
#include "com_example_smoke_StructsFromTypeCollection.h"
#include "smoke/StructsInstance.h"
#include "com_example_smoke_StructsInstance.h"
#include "fire/StructsQualifiedType.h"
#include "com_example_fire_StructsQualifiedType.h"
#include "smoke/TypeCollection.h"
namespace genium {
namespace jni {
    ::smoke::Structs::Point convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Point* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput);
    ::smoke::Structs::Color convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Color* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput);
    ::smoke::Structs::Line convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Line* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput);
    ::smoke::Structs::ColoredLine convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ColoredLine* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput);
    ::smoke::Structs::AllTypesStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::AllTypesStruct* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
    ::smoke::Structs::ExternalStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ExternalStruct* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
    ::fire::SomeVeryExternalStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::SomeVeryExternalStruct* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput);
    ::smoke::Structs::Yet_Another_External_Struct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput);
    ::fire::StructsQualifiedType::QualifiedType convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput);
    ::smoke::Point convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Point* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput);
    ::smoke::Color convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Color* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput);
    ::smoke::Line convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Line* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput);
    ::smoke::ColoredLine convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ColoredLine* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput);
    ::smoke::AllTypesStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::AllTypesStruct* dummy );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);
}
}
