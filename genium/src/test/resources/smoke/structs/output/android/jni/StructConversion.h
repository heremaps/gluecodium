#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_fire_StructsQualifiedType.h"
#include "com_example_smoke_Structs.h"
#include "com_example_smoke_StructsWithConstantsInterface.h"
#include "com_example_smoke_StructsWithMethodsInterface.h"
#include "com_example_smoke_StructsWithMethodsInterface_Vector3.h"
#include "com_example_smoke_Vector.h"
#include "fire/StructsQualifiedType.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include "smoke/StructsWithConstants.h"
#include "smoke/StructsWithConstantsInterface.h"
#include "smoke/StructsWithMethods.h"
#include "smoke/StructsWithMethodsInterface.h"
#include "smoke/TypeCollection.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::fire::SomeVeryExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalStruct* dummy);
::genium::optional<::fire::SomeVeryExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::SomeVeryExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::SomeVeryExternalStruct> _ninput);
::fire::StructsQualifiedType::QualifiedType convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy);
::genium::optional<::fire::StructsQualifiedType::QualifiedType> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::StructsQualifiedType::QualifiedType>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::StructsQualifiedType::QualifiedType> _ninput);
::smoke::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct* dummy);
::genium::optional<::smoke::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::AllTypesStruct> _ninput);
::smoke::Line convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Line* dummy);
::genium::optional<::smoke::Line> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Line>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Line> _ninput);
::smoke::Point convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Point* dummy);
::genium::optional<::smoke::Point> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Point>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Point> _ninput);
::smoke::Route convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Route* dummy);
::genium::optional<::smoke::Route> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Route>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Route& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Route> _ninput);
::smoke::Structs::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct* dummy);
::genium::optional<::smoke::Structs::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::AllTypesStruct> _ninput);
::smoke::Structs::DoubleNestingImmutableStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::DoubleNestingImmutableStruct* dummy);
::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::DoubleNestingImmutableStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct> _ninput);
::smoke::Structs::ExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ExternalStruct* dummy);
::genium::optional<::smoke::Structs::ExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::ExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::ExternalStruct> _ninput);
::smoke::Structs::ImmutableStructWithCppAccessors convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ImmutableStructWithCppAccessors* dummy);
::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ImmutableStructWithCppAccessors& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors> _ninput);
::smoke::Structs::Line convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Line* dummy);
::genium::optional<::smoke::Structs::Line> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Line>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Line> _ninput);
::smoke::Structs::MutableStructWithCppAccessors convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::MutableStructWithCppAccessors* dummy);
::genium::optional<::smoke::Structs::MutableStructWithCppAccessors> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::MutableStructWithCppAccessors>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::MutableStructWithCppAccessors& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::MutableStructWithCppAccessors> _ninput);
::smoke::Structs::NestingImmutableStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::NestingImmutableStruct* dummy);
::genium::optional<::smoke::Structs::NestingImmutableStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::NestingImmutableStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::NestingImmutableStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::NestingImmutableStruct> _ninput);
::smoke::Structs::Point convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Point* dummy);
::genium::optional<::smoke::Structs::Point> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Point>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Point> _ninput);
::smoke::Structs::StructWithArrayOfImmutable convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::StructWithArrayOfImmutable* dummy);
::genium::optional<::smoke::Structs::StructWithArrayOfImmutable> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::StructWithArrayOfImmutable& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable> _ninput);
::smoke::Structs::Yet_Another_External_Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy);
::genium::optional<::smoke::Structs::Yet_Another_External_Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Yet_Another_External_Struct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Yet_Another_External_Struct> _ninput);
::smoke::StructsWithConstantsInterface::MultiRoute convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::StructsWithConstantsInterface::MultiRoute* dummy);
::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsWithConstantsInterface::MultiRoute& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute> _ninput);
::smoke::StructsWithMethodsInterface::Vector3 convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::StructsWithMethodsInterface::Vector3* dummy);
::genium::optional<::smoke::StructsWithMethodsInterface::Vector3> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::StructsWithMethodsInterface::Vector3>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsWithMethodsInterface::Vector3& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::StructsWithMethodsInterface::Vector3> _ninput);
::smoke::Vector convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Vector* dummy);
::genium::optional<::smoke::Vector> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Vector>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Vector& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Vector> _ninput);
}
}
