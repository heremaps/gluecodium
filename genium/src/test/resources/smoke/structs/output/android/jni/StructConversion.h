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
#include "smoke/StructsInheritance.h"
#include "com_example_smoke_StructsInheritance.h"
#include "smoke/StructsFromTypeCollection.h"
#include "com_example_smoke_StructsFromTypeCollection.h"
#include "smoke/StructsInstance.h"
#include "com_example_smoke_StructsInstance.h"
#include "smoke/InheritedStructsOrder.h"
#include "fire/StructsQualifiedType.h"
#include "com_example_fire_StructsQualifiedType.h"
#include "smoke/TypeCollection.h"

namespace genium {
namespace jni {

    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Point& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Color& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Line& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ColoredLine& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::AllTypesStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ExternalStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::SomeVeryExternalStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::StructsInheritance::ColoredLineInherited& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsInheritance::ColoredLineInherited& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::GrandChildStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::GrandChildStruct& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ChildStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ChildStruct& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ParentStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ParentStruct& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::StructsQualifiedType::QualifiedType& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Point& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Color& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Line& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ColoredLine& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput);
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::AllTypesStruct& _nout );
    jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);

}
}