#include "android/jni/StructConversion.h"
#include <cstdint>
#include <vector>
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/EnumConversion.h"
#include "android/jni/ArrayConversionUtils.h"
namespace transpiler {
namespace jni {
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Point& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.x = transpiler::jni::get_double_field(_jenv, javaClass, _jinput, "x");
  _nout.y = transpiler::jni::get_double_field(_jenv, javaClass, _jinput, "y");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$Point");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jx = _ninput.x;
  transpiler::jni::set_double_field(_jenv, javaClass, _jresult, "x", jx);
  auto jy = _ninput.y;
  transpiler::jni::set_double_field(_jenv, javaClass, _jresult, "y", jy);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Color& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.red = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "red");
  _nout.green = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "green");
  _nout.blue = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "blue");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$Color");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jred = _ninput.red;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "red", jred);
  auto jgreen = _ninput.green;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "green", jgreen);
  auto jblue = _ninput.blue;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "blue", jblue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Line& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "a",
    "Lcom/example/smoke/Structs$Point;"),
    _nout.a );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "b",
    "Lcom/example/smoke/Structs$Point;"),
    _nout.b );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$Line");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto ja = convert_to_jni(_jenv, _ninput.a);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "a",
  "Lcom/example/smoke/Structs$Point;", ja);
  _jenv->DeleteLocalRef(ja);
  auto jb = convert_to_jni(_jenv, _ninput.b);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "b",
  "Lcom/example/smoke/Structs$Point;", jb);
  _jenv->DeleteLocalRef(jb);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ColoredLine& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "line",
    "Lcom/example/smoke/Structs$Line;"),
    _nout.line );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "color",
    "Lcom/example/smoke/Structs$Color;"),
    _nout.color );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$ColoredLine");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jline = convert_to_jni(_jenv, _ninput.line);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "line",
  "Lcom/example/smoke/Structs$Line;", jline);
  _jenv->DeleteLocalRef(jline);
  auto jcolor = convert_to_jni(_jenv, _ninput.color);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "color",
  "Lcom/example/smoke/Structs$Color;", jcolor);
  _jenv->DeleteLocalRef(jcolor);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::AllTypesStruct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.int8_field = transpiler::jni::get_byte_field(_jenv, javaClass, _jinput, "int8Field");
  _nout.uint8_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint8Field");
  _nout.int16_field = transpiler::jni::get_short_field(_jenv, javaClass, _jinput, "int16Field");
  _nout.uint16_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint16Field");
  _nout.int32_field = transpiler::jni::get_int_field(_jenv, javaClass, _jinput, "int32Field");
  _nout.uint32_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint32Field");
  _nout.int64_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "int64Field");
  _nout.uint64_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint64Field");
  _nout.float_field = transpiler::jni::get_float_field(_jenv, javaClass, _jinput, "floatField");
  _nout.double_field = transpiler::jni::get_double_field(_jenv, javaClass, _jinput, "doubleField");
  _nout.string_field = transpiler::jni::get_string_field(_jenv, javaClass, _jinput, "stringField");
  _nout.boolean_field = transpiler::jni::get_boolean_field(_jenv, javaClass, _jinput, "booleanField");
  _nout.bytes_field = transpiler::jni::get_byte_array_field(_jenv, javaClass, _jinput, "bytesField");
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "pointField",
    "Lcom/example/smoke/Structs$Point;"),
    _nout.point_field );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$AllTypesStruct");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jint8_field = _ninput.int8_field;
  transpiler::jni::set_byte_field(_jenv, javaClass, _jresult, "int8Field", jint8_field);
  auto juint8_field = _ninput.uint8_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint8Field", juint8_field);
  auto jint16_field = _ninput.int16_field;
  transpiler::jni::set_short_field(_jenv, javaClass, _jresult, "int16Field", jint16_field);
  auto juint16_field = _ninput.uint16_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint16Field", juint16_field);
  auto jint32_field = _ninput.int32_field;
  transpiler::jni::set_int_field(_jenv, javaClass, _jresult, "int32Field", jint32_field);
  auto juint32_field = _ninput.uint32_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint32Field", juint32_field);
  auto jint64_field = _ninput.int64_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "int64Field", jint64_field);
  auto juint64_field = _ninput.uint64_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint64Field", juint64_field);
  auto jfloat_field = _ninput.float_field;
  transpiler::jni::set_float_field(_jenv, javaClass, _jresult, "floatField", jfloat_field);
  auto jdouble_field = _ninput.double_field;
  transpiler::jni::set_double_field(_jenv, javaClass, _jresult, "doubleField", jdouble_field);
  auto jstring_field = _ninput.string_field;
  transpiler::jni::set_string_field(_jenv, javaClass, _jresult, "stringField", jstring_field);
  auto jboolean_field = _ninput.boolean_field;
  transpiler::jni::set_boolean_field(_jenv, javaClass, _jresult, "booleanField", jboolean_field);
  auto jbytes_field = _ninput.bytes_field;
  transpiler::jni::set_byte_array_field(_jenv, javaClass, _jresult, "bytesField", jbytes_field);
  auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "pointField",
  "Lcom/example/smoke/Structs$Point;", jpoint_field);
  _jenv->DeleteLocalRef(jpoint_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::StructsInheritance::ColoredLineInherited& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "a",
    "Lcom/example/smoke/Structs$Point;"),
    _nout.a );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "b",
    "Lcom/example/smoke/Structs$Point;"),
    _nout.b );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "color",
    "Lcom/example/smoke/Color;"),
    _nout.color );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsInheritance::ColoredLineInherited& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/StructsInheritance$ColoredLineInherited");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto ja = convert_to_jni(_jenv, _ninput.a);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "a",
  "Lcom/example/smoke/Structs$Point;", ja);
  _jenv->DeleteLocalRef(ja);
  auto jb = convert_to_jni(_jenv, _ninput.b);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "b",
  "Lcom/example/smoke/Structs$Point;", jb);
  _jenv->DeleteLocalRef(jb);
  auto jcolor = convert_to_jni(_jenv, _ninput.color);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "color",
  "Lcom/example/smoke/Color;", jcolor);
  _jenv->DeleteLocalRef(jcolor);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::GrandChildStruct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.parent_field = transpiler::jni::get_float_field(_jenv, javaClass, _jinput, "parentField");
  _nout.child_field = transpiler::jni::get_int_field(_jenv, javaClass, _jinput, "childField");
  _nout.grand_child_field = transpiler::jni::get_string_field(_jenv, javaClass, _jinput, "grandChildField");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::GrandChildStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/GrandChildStruct");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jparent_field = _ninput.parent_field;
  transpiler::jni::set_float_field(_jenv, javaClass, _jresult, "parentField", jparent_field);
  auto jchild_field = _ninput.child_field;
  transpiler::jni::set_int_field(_jenv, javaClass, _jresult, "childField", jchild_field);
  auto jgrand_child_field = _ninput.grand_child_field;
  transpiler::jni::set_string_field(_jenv, javaClass, _jresult, "grandChildField", jgrand_child_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ChildStruct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.parent_field = transpiler::jni::get_float_field(_jenv, javaClass, _jinput, "parentField");
  _nout.child_field = transpiler::jni::get_int_field(_jenv, javaClass, _jinput, "childField");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ChildStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ChildStruct");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jparent_field = _ninput.parent_field;
  transpiler::jni::set_float_field(_jenv, javaClass, _jresult, "parentField", jparent_field);
  auto jchild_field = _ninput.child_field;
  transpiler::jni::set_int_field(_jenv, javaClass, _jresult, "childField", jchild_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ParentStruct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.parent_field = transpiler::jni::get_float_field(_jenv, javaClass, _jinput, "parentField");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ParentStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ParentStruct");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jparent_field = _ninput.parent_field;
  transpiler::jni::set_float_field(_jenv, javaClass, _jresult, "parentField", jparent_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::StructsQualifiedType::QualifiedType& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "typeCollectionPoint",
    "Lcom/example/smoke/Point;"),
    _nout.type_collection_point );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "interfacePoint",
    "Lcom/example/smoke/Structs$Point;"),
    _nout.interface_point );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "typeCollectionExplicitPoints",
    "Ljava/util/List;"),
    _nout.type_collection_explicit_points );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "interfaceExplicitPoints",
    "Ljava/util/List;"),
    _nout.interface_explicit_points );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "typeCollectionImplicitPoints",
    "Ljava/util/List;"),
    _nout.type_collection_implicit_points );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "interfaceImplicitPoints",
    "Ljava/util/List;"),
    _nout.interface_implicit_points );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "structsInstance",
    "Lcom/example/smoke/StructsInstance;"),
    _nout.structs_instance );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput){
  auto javaClass = _jenv->FindClass("com/example/fire/StructsQualifiedType$QualifiedType");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jtype_collection_point = convert_to_jni(_jenv, _ninput.type_collection_point);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "typeCollectionPoint",
  "Lcom/example/smoke/Point;", jtype_collection_point);
  _jenv->DeleteLocalRef(jtype_collection_point);
  auto jinterface_point = convert_to_jni(_jenv, _ninput.interface_point);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "interfacePoint",
  "Lcom/example/smoke/Structs$Point;", jinterface_point);
  _jenv->DeleteLocalRef(jinterface_point);
  auto jtype_collection_explicit_points = convert_to_jni(_jenv, _ninput.type_collection_explicit_points);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "typeCollectionExplicitPoints",
  "Ljava/util/List;", jtype_collection_explicit_points);
  _jenv->DeleteLocalRef(jtype_collection_explicit_points);
  auto jinterface_explicit_points = convert_to_jni(_jenv, _ninput.interface_explicit_points);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "interfaceExplicitPoints",
  "Ljava/util/List;", jinterface_explicit_points);
  _jenv->DeleteLocalRef(jinterface_explicit_points);
  auto jtype_collection_implicit_points = convert_to_jni(_jenv, _ninput.type_collection_implicit_points);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "typeCollectionImplicitPoints",
  "Ljava/util/List;", jtype_collection_implicit_points);
  _jenv->DeleteLocalRef(jtype_collection_implicit_points);
  auto jinterface_implicit_points = convert_to_jni(_jenv, _ninput.interface_implicit_points);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "interfaceImplicitPoints",
  "Ljava/util/List;", jinterface_implicit_points);
  _jenv->DeleteLocalRef(jinterface_implicit_points);
  auto jstructs_instance = convert_to_jni(_jenv, _ninput.structs_instance);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "structsInstance",
  "Lcom/example/smoke/StructsInstance;", jstructs_instance);
  _jenv->DeleteLocalRef(jstructs_instance);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Point& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.x = transpiler::jni::get_double_field(_jenv, javaClass, _jinput, "x");
  _nout.y = transpiler::jni::get_double_field(_jenv, javaClass, _jinput, "y");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Point");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jx = _ninput.x;
  transpiler::jni::set_double_field(_jenv, javaClass, _jresult, "x", jx);
  auto jy = _ninput.y;
  transpiler::jni::set_double_field(_jenv, javaClass, _jresult, "y", jy);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Color& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.red = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "red");
  _nout.green = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "green");
  _nout.blue = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "blue");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Color");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jred = _ninput.red;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "red", jred);
  auto jgreen = _ninput.green;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "green", jgreen);
  auto jblue = _ninput.blue;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "blue", jblue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Line& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "a",
    "Lcom/example/smoke/Point;"),
    _nout.a );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "b",
    "Lcom/example/smoke/Point;"),
    _nout.b );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Line");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto ja = convert_to_jni(_jenv, _ninput.a);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "a",
  "Lcom/example/smoke/Point;", ja);
  _jenv->DeleteLocalRef(ja);
  auto jb = convert_to_jni(_jenv, _ninput.b);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "b",
  "Lcom/example/smoke/Point;", jb);
  _jenv->DeleteLocalRef(jb);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ColoredLine& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "line",
    "Lcom/example/smoke/Line;"),
    _nout.line );
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "color",
    "Lcom/example/smoke/Color;"),
    _nout.color );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ColoredLine");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jline = convert_to_jni(_jenv, _ninput.line);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "line",
  "Lcom/example/smoke/Line;", jline);
  _jenv->DeleteLocalRef(jline);
  auto jcolor = convert_to_jni(_jenv, _ninput.color);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "color",
  "Lcom/example/smoke/Color;", jcolor);
  _jenv->DeleteLocalRef(jcolor);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::AllTypesStruct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.int8_field = transpiler::jni::get_byte_field(_jenv, javaClass, _jinput, "int8Field");
  _nout.uint8_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint8Field");
  _nout.int16_field = transpiler::jni::get_short_field(_jenv, javaClass, _jinput, "int16Field");
  _nout.uint16_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint16Field");
  _nout.int32_field = transpiler::jni::get_int_field(_jenv, javaClass, _jinput, "int32Field");
  _nout.uint32_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint32Field");
  _nout.int64_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "int64Field");
  _nout.uint64_field = transpiler::jni::get_long_field(_jenv, javaClass, _jinput, "uint64Field");
  _nout.float_field = transpiler::jni::get_float_field(_jenv, javaClass, _jinput, "floatField");
  _nout.double_field = transpiler::jni::get_double_field(_jenv, javaClass, _jinput, "doubleField");
  _nout.string_field = transpiler::jni::get_string_field(_jenv, javaClass, _jinput, "stringField");
  _nout.boolean_field = transpiler::jni::get_boolean_field(_jenv, javaClass, _jinput, "booleanField");
  _nout.bytes_field = transpiler::jni::get_byte_array_field(_jenv, javaClass, _jinput, "bytesField");
  convert_from_jni(
    _jenv,
    transpiler::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "pointField",
    "Lcom/example/smoke/Point;"),
    _nout.point_field );
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/AllTypesStruct");
  auto _jresult = transpiler::jni::create_object(_jenv, javaClass);
  auto jint8_field = _ninput.int8_field;
  transpiler::jni::set_byte_field(_jenv, javaClass, _jresult, "int8Field", jint8_field);
  auto juint8_field = _ninput.uint8_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint8Field", juint8_field);
  auto jint16_field = _ninput.int16_field;
  transpiler::jni::set_short_field(_jenv, javaClass, _jresult, "int16Field", jint16_field);
  auto juint16_field = _ninput.uint16_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint16Field", juint16_field);
  auto jint32_field = _ninput.int32_field;
  transpiler::jni::set_int_field(_jenv, javaClass, _jresult, "int32Field", jint32_field);
  auto juint32_field = _ninput.uint32_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint32Field", juint32_field);
  auto jint64_field = _ninput.int64_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "int64Field", jint64_field);
  auto juint64_field = _ninput.uint64_field;
  transpiler::jni::set_long_field(_jenv, javaClass, _jresult, "uint64Field", juint64_field);
  auto jfloat_field = _ninput.float_field;
  transpiler::jni::set_float_field(_jenv, javaClass, _jresult, "floatField", jfloat_field);
  auto jdouble_field = _ninput.double_field;
  transpiler::jni::set_double_field(_jenv, javaClass, _jresult, "doubleField", jdouble_field);
  auto jstring_field = _ninput.string_field;
  transpiler::jni::set_string_field(_jenv, javaClass, _jresult, "stringField", jstring_field);
  auto jboolean_field = _ninput.boolean_field;
  transpiler::jni::set_boolean_field(_jenv, javaClass, _jresult, "booleanField", jboolean_field);
  auto jbytes_field = _ninput.bytes_field;
  transpiler::jni::set_byte_array_field(_jenv, javaClass, _jresult, "bytesField", jbytes_field);
  auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
  transpiler::jni::set_object_field(_jenv, javaClass, _jresult, "pointField",
  "Lcom/example/smoke/Point;", jpoint_field);
  _jenv->DeleteLocalRef(jpoint_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
}
}
