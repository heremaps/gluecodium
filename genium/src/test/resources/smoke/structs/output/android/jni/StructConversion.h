#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_fire_StructsQualifiedType.h"
#include "com_example_smoke_Structs.h"
#include "com_example_smoke_StructsFromTypeCollection.h"
#include "com_example_smoke_StructsInstance.h"
#include "fire/StructsQualifiedType.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include "smoke/StructsFromTypeCollection.h"
#include "smoke/StructsInstance.h"
#include "smoke/TypeCollection.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::smoke::Point convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Point* dummy);
::genium::optional<::smoke::Point> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Point>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Point> _ninput);
::smoke::Color convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Color* dummy);
::genium::optional<::smoke::Color> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Color>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Color> _ninput);
::smoke::Line convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Line* dummy);
::genium::optional<::smoke::Line> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Line>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Line> _ninput);
::smoke::ColoredLine convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ColoredLine* dummy);
::genium::optional<::smoke::ColoredLine> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::ColoredLine>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::ColoredLine> _ninput);
::smoke::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct* dummy);
::genium::optional<::smoke::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::AllTypesStruct> _ninput);
::fire::StructsQualifiedType::QualifiedType convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy);
::genium::optional<::fire::StructsQualifiedType::QualifiedType> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::StructsQualifiedType::QualifiedType>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::StructsQualifiedType::QualifiedType> _ninput);
::smoke::Structs::Point convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Point* dummy);
::genium::optional<::smoke::Structs::Point> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Point>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Point> _ninput);
::smoke::Structs::Color convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Color* dummy);
::genium::optional<::smoke::Structs::Color> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Color>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Color> _ninput);
::smoke::Structs::Line convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Line* dummy);
::genium::optional<::smoke::Structs::Line> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Line>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Line> _ninput);
::smoke::Structs::ColoredLine convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ColoredLine* dummy);
::genium::optional<::smoke::Structs::ColoredLine> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::ColoredLine>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::ColoredLine> _ninput);
::smoke::Structs::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct* dummy);
::genium::optional<::smoke::Structs::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::AllTypesStruct> _ninput);
::smoke::Structs::ExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ExternalStruct* dummy);
::genium::optional<::smoke::Structs::ExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::ExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::ExternalStruct> _ninput);
::fire::SomeVeryExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalStruct* dummy);
::genium::optional<::fire::SomeVeryExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::SomeVeryExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::SomeVeryExternalStruct> _ninput);
::smoke::Structs::Yet_Another_External_Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy);
::genium::optional<::smoke::Structs::Yet_Another_External_Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Yet_Another_External_Struct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Yet_Another_External_Struct> _ninput);
::smoke::Structs::NestingImmutableStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::NestingImmutableStruct* dummy);
::genium::optional<::smoke::Structs::NestingImmutableStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::NestingImmutableStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::NestingImmutableStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::NestingImmutableStruct> _ninput);
::smoke::Structs::DoubleNestingImmutableStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::DoubleNestingImmutableStruct* dummy);
::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::DoubleNestingImmutableStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct> _ninput);
::smoke::Structs::StructWithArrayOfImmutable convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::StructWithArrayOfImmutable* dummy);
::genium::optional<::smoke::Structs::StructWithArrayOfImmutable> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::StructWithArrayOfImmutable& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable> _ninput);
}
}
