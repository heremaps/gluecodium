#pragma once
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
#include <jni.h>
#include <memory>
namespace genium
{
namespace jni
{
::smoke::Structs::Point convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Point* dummy);
std::shared_ptr<::smoke::Structs::Point> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Point>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Point> _ninput);
::smoke::Structs::Color convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Color* dummy);
std::shared_ptr<::smoke::Structs::Color> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Color>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Color> _ninput);
::smoke::Structs::Line convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Line* dummy);
std::shared_ptr<::smoke::Structs::Line> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Line>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Line> _ninput);
::smoke::Structs::ColoredLine convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ColoredLine* dummy);
std::shared_ptr<::smoke::Structs::ColoredLine> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::ColoredLine>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::ColoredLine> _ninput);
::smoke::Structs::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct* dummy);
std::shared_ptr<::smoke::Structs::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::AllTypesStruct> _ninput);
::smoke::Structs::ExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ExternalStruct* dummy);
std::shared_ptr<::smoke::Structs::ExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::ExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::ExternalStruct> _ninput);
::fire::SomeVeryExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalStruct* dummy);
std::shared_ptr<::fire::SomeVeryExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::SomeVeryExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::SomeVeryExternalStruct> _ninput);
::smoke::Structs::Yet_Another_External_Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy);
std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct> _ninput);
::fire::StructsQualifiedType::QualifiedType convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy);
std::shared_ptr<::fire::StructsQualifiedType::QualifiedType> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::StructsQualifiedType::QualifiedType>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::StructsQualifiedType::QualifiedType> _ninput);
::smoke::Point convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Point* dummy);
std::shared_ptr<::smoke::Point> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Point>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Point> _ninput);
::smoke::Color convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Color* dummy);
std::shared_ptr<::smoke::Color> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Color>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Color> _ninput);
::smoke::Line convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Line* dummy);
std::shared_ptr<::smoke::Line> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Line>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Line> _ninput);
::smoke::ColoredLine convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ColoredLine* dummy);
std::shared_ptr<::smoke::ColoredLine> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::ColoredLine>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ColoredLine> _ninput);
::smoke::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct* dummy);
std::shared_ptr<::smoke::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::AllTypesStruct> _ninput);
}
}
