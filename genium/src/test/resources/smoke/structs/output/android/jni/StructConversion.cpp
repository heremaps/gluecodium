#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
namespace genium {
namespace jni {
::smoke::Structs::Point convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Point* dummy ){
  ::smoke::Structs::Point _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  double n_x = genium::jni::get_double_field(_jenv, javaClass, _jinput, "x");
  _nout.x = n_x;
  double n_y = genium::jni::get_double_field(_jenv, javaClass, _jinput, "y");
  _nout.y = n_y;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$Point");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jx = _ninput.x;
  genium::jni::set_double_field(_jenv, javaClass, _jresult, "x", jx);
  auto jy = _ninput.y;
  genium::jni::set_double_field(_jenv, javaClass, _jresult, "y", jy);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Structs::Color convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Color* dummy ){
  ::smoke::Structs::Color _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  uint8_t n_red = genium::jni::get_long_field(_jenv, javaClass, _jinput, "red");
  _nout.red = n_red;
  uint8_t n_green = genium::jni::get_long_field(_jenv, javaClass, _jinput, "green");
  _nout.green = n_green;
  uint8_t n_blue = genium::jni::get_long_field(_jenv, javaClass, _jinput, "blue");
  _nout.blue = n_blue;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$Color");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jred = _ninput.red;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "red", jred);
  auto jgreen = _ninput.green;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "green", jgreen);
  auto jblue = _ninput.blue;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "blue", jblue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Structs::Line convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Line* dummy ){
  ::smoke::Structs::Line _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::smoke::Structs::Point n_a = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "a",
    "Lcom/example/smoke/Structs$Point;"),
    (::smoke::Structs::Point*)nullptr );
  _nout.a = n_a;
  ::smoke::Structs::Point n_b = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "b",
    "Lcom/example/smoke/Structs$Point;"),
    (::smoke::Structs::Point*)nullptr );
  _nout.b = n_b;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$Line");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto ja = convert_to_jni(_jenv, _ninput.a);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "a",
  "Lcom/example/smoke/Structs$Point;", ja);
  _jenv->DeleteLocalRef(ja);
  auto jb = convert_to_jni(_jenv, _ninput.b);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "b",
  "Lcom/example/smoke/Structs$Point;", jb);
  _jenv->DeleteLocalRef(jb);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Structs::ColoredLine convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ColoredLine* dummy ){
  ::smoke::Structs::ColoredLine _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::smoke::Structs::Line n_line = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "line",
    "Lcom/example/smoke/Structs$Line;"),
    (::smoke::Structs::Line*)nullptr );
  _nout.line = n_line;
  ::smoke::Structs::Color n_color = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "color",
    "Lcom/example/smoke/Structs$Color;"),
    (::smoke::Structs::Color*)nullptr );
  _nout.color = n_color;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$ColoredLine");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jline = convert_to_jni(_jenv, _ninput.line);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "line",
  "Lcom/example/smoke/Structs$Line;", jline);
  _jenv->DeleteLocalRef(jline);
  auto jcolor = convert_to_jni(_jenv, _ninput.color);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "color",
  "Lcom/example/smoke/Structs$Color;", jcolor);
  _jenv->DeleteLocalRef(jcolor);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Structs::AllTypesStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::AllTypesStruct* dummy ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  int8_t n_int8_field = genium::jni::get_byte_field(_jenv, javaClass, _jinput, "int8Field");
  uint8_t n_uint8_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint8Field");
  int16_t n_int16_field = genium::jni::get_short_field(_jenv, javaClass, _jinput, "int16Field");
  uint16_t n_uint16_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint16Field");
  int32_t n_int32_field = genium::jni::get_int_field(_jenv, javaClass, _jinput, "int32Field");
  uint32_t n_uint32_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint32Field");
  int64_t n_int64_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "int64Field");
  uint64_t n_uint64_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint64Field");
  float n_float_field = genium::jni::get_float_field(_jenv, javaClass, _jinput, "floatField");
  double n_double_field = genium::jni::get_double_field(_jenv, javaClass, _jinput, "doubleField");
  ::std::string n_string_field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "stringField");
  bool n_boolean_field = genium::jni::get_boolean_field(_jenv, javaClass, _jinput, "booleanField");
  ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = genium::jni::get_byte_array_field(_jenv, javaClass, _jinput, "bytesField");
  ::smoke::Structs::Point n_point_field = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "pointField",
    "Lcom/example/smoke/Structs$Point;"),
    (::smoke::Structs::Point*)nullptr );
  return ::smoke::Structs::AllTypesStruct(n_int8_field, n_uint8_field, n_int16_field, n_uint16_field, n_int32_field, n_uint32_field, n_int64_field, n_uint64_field, n_float_field, n_double_field, n_string_field, n_boolean_field, n_bytes_field, n_point_field);
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$AllTypesStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jint8_field = _ninput.int8_field;
  genium::jni::set_byte_field(_jenv, javaClass, _jresult, "int8Field", jint8_field);
  auto juint8_field = _ninput.uint8_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint8Field", juint8_field);
  auto jint16_field = _ninput.int16_field;
  genium::jni::set_short_field(_jenv, javaClass, _jresult, "int16Field", jint16_field);
  auto juint16_field = _ninput.uint16_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint16Field", juint16_field);
  auto jint32_field = _ninput.int32_field;
  genium::jni::set_int_field(_jenv, javaClass, _jresult, "int32Field", jint32_field);
  auto juint32_field = _ninput.uint32_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint32Field", juint32_field);
  auto jint64_field = _ninput.int64_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "int64Field", jint64_field);
  auto juint64_field = _ninput.uint64_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint64Field", juint64_field);
  auto jfloat_field = _ninput.float_field;
  genium::jni::set_float_field(_jenv, javaClass, _jresult, "floatField", jfloat_field);
  auto jdouble_field = _ninput.double_field;
  genium::jni::set_double_field(_jenv, javaClass, _jresult, "doubleField", jdouble_field);
  auto jstring_field = _ninput.string_field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "stringField", jstring_field);
  auto jboolean_field = _ninput.boolean_field;
  genium::jni::set_boolean_field(_jenv, javaClass, _jresult, "booleanField", jboolean_field);
  auto jbytes_field = _ninput.bytes_field;
  genium::jni::set_byte_array_field(_jenv, javaClass, _jresult, "bytesField", jbytes_field);
  auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "pointField",
  "Lcom/example/smoke/Structs$Point;", jpoint_field);
  _jenv->DeleteLocalRef(jpoint_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Structs::ExternalStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::ExternalStruct* dummy ){
  ::smoke::Structs::ExternalStruct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::std::string n_stringField = genium::jni::get_string_field(_jenv, javaClass, _jinput, "stringField");
  _nout.stringField = n_stringField;
  ::std::string n_externalStringField = genium::jni::get_string_field(_jenv, javaClass, _jinput, "externalStringField");
  _nout.set_some_string(n_externalStringField);
  ::std::vector< int8_t > n_externalArrayField = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "externalArrayField",
    "Ljava/util/List;"),
    (::std::vector< int8_t >*)nullptr );
  _nout.set_some_array(n_externalArrayField);
  ::fire::SomeVeryExternalStruct n_externalStructField = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "externalStructField",
    "Lcom/example/smoke/Structs$AnotherExternalStruct;"),
    (::fire::SomeVeryExternalStruct*)nullptr );
  _nout.set_some_struct(n_externalStructField);
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$ExternalStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jstringField = _ninput.stringField;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "stringField", jstringField);
  auto jexternalStringField = _ninput.get_some_string();
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "externalStringField", jexternalStringField);
  auto jexternalArrayField = convert_to_jni(_jenv, _ninput.get_some_array());
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "externalArrayField",
  "Ljava/util/List;", jexternalArrayField);
  _jenv->DeleteLocalRef(jexternalArrayField);
  auto jexternalStructField = convert_to_jni(_jenv, _ninput.get_some_struct());
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "externalStructField",
  "Lcom/example/smoke/Structs$AnotherExternalStruct;", jexternalStructField);
  _jenv->DeleteLocalRef(jexternalStructField);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::fire::SomeVeryExternalStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::SomeVeryExternalStruct* dummy ){
  ::fire::SomeVeryExternalStruct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  int8_t n_intField = genium::jni::get_byte_field(_jenv, javaClass, _jinput, "intField");
  _nout.intField = n_intField;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$AnotherExternalStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jintField = _ninput.intField;
  genium::jni::set_byte_field(_jenv, javaClass, _jresult, "intField", jintField);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Structs::Yet_Another_External_Struct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy ){
  ::smoke::Structs::Yet_Another_External_Struct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::std::string n_string_Field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "stringField");
  _nout.string_Field = n_string_Field;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Structs$YetAnotherExternalStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jstring_Field = _ninput.string_Field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "stringField", jstring_Field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::StructsInheritance::ColoredLineInherited convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::StructsInheritance::ColoredLineInherited* dummy ){
  ::smoke::StructsInheritance::ColoredLineInherited _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::smoke::Structs::Point n_a = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "a",
    "Lcom/example/smoke/Structs$Point;"),
    (::smoke::Structs::Point*)nullptr );
  _nout.a = n_a;
  ::smoke::Structs::Point n_b = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "b",
    "Lcom/example/smoke/Structs$Point;"),
    (::smoke::Structs::Point*)nullptr );
  _nout.b = n_b;
  ::smoke::Color n_color = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "color",
    "Lcom/example/smoke/Color;"),
    (::smoke::Color*)nullptr );
  _nout.color = n_color;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsInheritance::ColoredLineInherited& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/StructsInheritance$ColoredLineInherited");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto ja = convert_to_jni(_jenv, _ninput.a);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "a",
  "Lcom/example/smoke/Structs$Point;", ja);
  _jenv->DeleteLocalRef(ja);
  auto jb = convert_to_jni(_jenv, _ninput.b);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "b",
  "Lcom/example/smoke/Structs$Point;", jb);
  _jenv->DeleteLocalRef(jb);
  auto jcolor = convert_to_jni(_jenv, _ninput.color);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "color",
  "Lcom/example/smoke/Color;", jcolor);
  _jenv->DeleteLocalRef(jcolor);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::GrandChildStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::GrandChildStruct* dummy ){
  ::smoke::GrandChildStruct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  float n_parent_field = genium::jni::get_float_field(_jenv, javaClass, _jinput, "parentField");
  _nout.parent_field = n_parent_field;
  int32_t n_child_field = genium::jni::get_int_field(_jenv, javaClass, _jinput, "childField");
  _nout.child_field = n_child_field;
  ::std::string n_grand_child_field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "grandChildField");
  _nout.grand_child_field = n_grand_child_field;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::GrandChildStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/GrandChildStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jparent_field = _ninput.parent_field;
  genium::jni::set_float_field(_jenv, javaClass, _jresult, "parentField", jparent_field);
  auto jchild_field = _ninput.child_field;
  genium::jni::set_int_field(_jenv, javaClass, _jresult, "childField", jchild_field);
  auto jgrand_child_field = _ninput.grand_child_field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "grandChildField", jgrand_child_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::ChildStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ChildStruct* dummy ){
  ::smoke::ChildStruct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  float n_parent_field = genium::jni::get_float_field(_jenv, javaClass, _jinput, "parentField");
  _nout.parent_field = n_parent_field;
  int32_t n_child_field = genium::jni::get_int_field(_jenv, javaClass, _jinput, "childField");
  _nout.child_field = n_child_field;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ChildStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ChildStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jparent_field = _ninput.parent_field;
  genium::jni::set_float_field(_jenv, javaClass, _jresult, "parentField", jparent_field);
  auto jchild_field = _ninput.child_field;
  genium::jni::set_int_field(_jenv, javaClass, _jresult, "childField", jchild_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::ParentStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ParentStruct* dummy ){
  ::smoke::ParentStruct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  float n_parent_field = genium::jni::get_float_field(_jenv, javaClass, _jinput, "parentField");
  _nout.parent_field = n_parent_field;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ParentStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ParentStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jparent_field = _ninput.parent_field;
  genium::jni::set_float_field(_jenv, javaClass, _jresult, "parentField", jparent_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::fire::StructsQualifiedType::QualifiedType convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy ){
  ::fire::StructsQualifiedType::QualifiedType _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::smoke::Point n_type_collection_point = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "typeCollectionPoint",
    "Lcom/example/smoke/Point;"),
    (::smoke::Point*)nullptr );
  _nout.type_collection_point = n_type_collection_point;
  ::smoke::Structs::Point n_interface_point = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "interfacePoint",
    "Lcom/example/smoke/Structs$Point;"),
    (::smoke::Structs::Point*)nullptr );
  _nout.interface_point = n_interface_point;
  ::fire::StructsQualifiedType::TypeCollectionPointsArray n_type_collection_explicit_points = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "typeCollectionExplicitPoints",
    "Ljava/util/List;"),
    (::fire::StructsQualifiedType::TypeCollectionPointsArray*)nullptr );
  _nout.type_collection_explicit_points = n_type_collection_explicit_points;
  ::fire::StructsQualifiedType::InterfacePointsArray n_interface_explicit_points = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "interfaceExplicitPoints",
    "Ljava/util/List;"),
    (::fire::StructsQualifiedType::InterfacePointsArray*)nullptr );
  _nout.interface_explicit_points = n_interface_explicit_points;
  ::std::vector< ::smoke::Point > n_type_collection_implicit_points = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "typeCollectionImplicitPoints",
    "Ljava/util/List;"),
    (::std::vector< ::smoke::Point >*)nullptr );
  _nout.type_collection_implicit_points = n_type_collection_implicit_points;
  ::std::vector< ::smoke::Structs::Point > n_interface_implicit_points = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "interfaceImplicitPoints",
    "Ljava/util/List;"),
    (::std::vector< ::smoke::Structs::Point >*)nullptr );
  _nout.interface_implicit_points = n_interface_implicit_points;
  ::std::shared_ptr< ::smoke::StructsInstance > n_structs_instance = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "structsInstance",
    "Lcom/example/smoke/StructsInstance;"),
    (::std::shared_ptr< ::smoke::StructsInstance >*)nullptr );
  _nout.structs_instance = n_structs_instance;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput){
  auto javaClass = _jenv->FindClass("com/example/fire/StructsQualifiedType$QualifiedType");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jtype_collection_point = convert_to_jni(_jenv, _ninput.type_collection_point);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "typeCollectionPoint",
  "Lcom/example/smoke/Point;", jtype_collection_point);
  _jenv->DeleteLocalRef(jtype_collection_point);
  auto jinterface_point = convert_to_jni(_jenv, _ninput.interface_point);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "interfacePoint",
  "Lcom/example/smoke/Structs$Point;", jinterface_point);
  _jenv->DeleteLocalRef(jinterface_point);
  auto jtype_collection_explicit_points = convert_to_jni(_jenv, _ninput.type_collection_explicit_points);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "typeCollectionExplicitPoints",
  "Ljava/util/List;", jtype_collection_explicit_points);
  _jenv->DeleteLocalRef(jtype_collection_explicit_points);
  auto jinterface_explicit_points = convert_to_jni(_jenv, _ninput.interface_explicit_points);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "interfaceExplicitPoints",
  "Ljava/util/List;", jinterface_explicit_points);
  _jenv->DeleteLocalRef(jinterface_explicit_points);
  auto jtype_collection_implicit_points = convert_to_jni(_jenv, _ninput.type_collection_implicit_points);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "typeCollectionImplicitPoints",
  "Ljava/util/List;", jtype_collection_implicit_points);
  _jenv->DeleteLocalRef(jtype_collection_implicit_points);
  auto jinterface_implicit_points = convert_to_jni(_jenv, _ninput.interface_implicit_points);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "interfaceImplicitPoints",
  "Ljava/util/List;", jinterface_implicit_points);
  _jenv->DeleteLocalRef(jinterface_implicit_points);
  auto jstructs_instance = convert_to_jni(_jenv, _ninput.structs_instance);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "structsInstance",
  "Lcom/example/smoke/StructsInstance;", jstructs_instance);
  _jenv->DeleteLocalRef(jstructs_instance);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Point convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Point* dummy ){
  ::smoke::Point _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  double n_x = genium::jni::get_double_field(_jenv, javaClass, _jinput, "x");
  _nout.x = n_x;
  double n_y = genium::jni::get_double_field(_jenv, javaClass, _jinput, "y");
  _nout.y = n_y;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Point");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jx = _ninput.x;
  genium::jni::set_double_field(_jenv, javaClass, _jresult, "x", jx);
  auto jy = _ninput.y;
  genium::jni::set_double_field(_jenv, javaClass, _jresult, "y", jy);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Color convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Color* dummy ){
  ::smoke::Color _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  uint8_t n_red = genium::jni::get_long_field(_jenv, javaClass, _jinput, "red");
  _nout.red = n_red;
  uint8_t n_green = genium::jni::get_long_field(_jenv, javaClass, _jinput, "green");
  _nout.green = n_green;
  uint8_t n_blue = genium::jni::get_long_field(_jenv, javaClass, _jinput, "blue");
  _nout.blue = n_blue;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Color");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jred = _ninput.red;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "red", jred);
  auto jgreen = _ninput.green;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "green", jgreen);
  auto jblue = _ninput.blue;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "blue", jblue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::Line convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Line* dummy ){
  ::smoke::Line _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::smoke::Point n_a = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "a",
    "Lcom/example/smoke/Point;"),
    (::smoke::Point*)nullptr );
  _nout.a = n_a;
  ::smoke::Point n_b = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "b",
    "Lcom/example/smoke/Point;"),
    (::smoke::Point*)nullptr );
  _nout.b = n_b;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/Line");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto ja = convert_to_jni(_jenv, _ninput.a);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "a",
  "Lcom/example/smoke/Point;", ja);
  _jenv->DeleteLocalRef(ja);
  auto jb = convert_to_jni(_jenv, _ninput.b);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "b",
  "Lcom/example/smoke/Point;", jb);
  _jenv->DeleteLocalRef(jb);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::ColoredLine convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ColoredLine* dummy ){
  ::smoke::ColoredLine _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  ::smoke::Line n_line = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "line",
    "Lcom/example/smoke/Line;"),
    (::smoke::Line*)nullptr );
  _nout.line = n_line;
  ::smoke::Color n_color = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "color",
    "Lcom/example/smoke/Color;"),
    (::smoke::Color*)nullptr );
  _nout.color = n_color;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ColoredLine");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jline = convert_to_jni(_jenv, _ninput.line);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "line",
  "Lcom/example/smoke/Line;", jline);
  _jenv->DeleteLocalRef(jline);
  auto jcolor = convert_to_jni(_jenv, _ninput.color);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "color",
  "Lcom/example/smoke/Color;", jcolor);
  _jenv->DeleteLocalRef(jcolor);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
::smoke::AllTypesStruct convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::AllTypesStruct* dummy ){
  ::smoke::AllTypesStruct _nout{};
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  int8_t n_int8_field = genium::jni::get_byte_field(_jenv, javaClass, _jinput, "int8Field");
  _nout.int8_field = n_int8_field;
  uint8_t n_uint8_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint8Field");
  _nout.uint8_field = n_uint8_field;
  int16_t n_int16_field = genium::jni::get_short_field(_jenv, javaClass, _jinput, "int16Field");
  _nout.int16_field = n_int16_field;
  uint16_t n_uint16_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint16Field");
  _nout.uint16_field = n_uint16_field;
  int32_t n_int32_field = genium::jni::get_int_field(_jenv, javaClass, _jinput, "int32Field");
  _nout.int32_field = n_int32_field;
  uint32_t n_uint32_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint32Field");
  _nout.uint32_field = n_uint32_field;
  int64_t n_int64_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "int64Field");
  _nout.int64_field = n_int64_field;
  uint64_t n_uint64_field = genium::jni::get_long_field(_jenv, javaClass, _jinput, "uint64Field");
  _nout.uint64_field = n_uint64_field;
  float n_float_field = genium::jni::get_float_field(_jenv, javaClass, _jinput, "floatField");
  _nout.float_field = n_float_field;
  double n_double_field = genium::jni::get_double_field(_jenv, javaClass, _jinput, "doubleField");
  _nout.double_field = n_double_field;
  ::std::string n_string_field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "stringField");
  _nout.string_field = n_string_field;
  bool n_boolean_field = genium::jni::get_boolean_field(_jenv, javaClass, _jinput, "booleanField");
  _nout.boolean_field = n_boolean_field;
  ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = genium::jni::get_byte_array_field(_jenv, javaClass, _jinput, "bytesField");
  _nout.bytes_field = n_bytes_field;
  ::smoke::Point n_point_field = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "pointField",
    "Lcom/example/smoke/Point;"),
    (::smoke::Point*)nullptr );
  _nout.point_field = n_point_field;
  return _nout;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/AllTypesStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jint8_field = _ninput.int8_field;
  genium::jni::set_byte_field(_jenv, javaClass, _jresult, "int8Field", jint8_field);
  auto juint8_field = _ninput.uint8_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint8Field", juint8_field);
  auto jint16_field = _ninput.int16_field;
  genium::jni::set_short_field(_jenv, javaClass, _jresult, "int16Field", jint16_field);
  auto juint16_field = _ninput.uint16_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint16Field", juint16_field);
  auto jint32_field = _ninput.int32_field;
  genium::jni::set_int_field(_jenv, javaClass, _jresult, "int32Field", jint32_field);
  auto juint32_field = _ninput.uint32_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint32Field", juint32_field);
  auto jint64_field = _ninput.int64_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "int64Field", jint64_field);
  auto juint64_field = _ninput.uint64_field;
  genium::jni::set_long_field(_jenv, javaClass, _jresult, "uint64Field", juint64_field);
  auto jfloat_field = _ninput.float_field;
  genium::jni::set_float_field(_jenv, javaClass, _jresult, "floatField", jfloat_field);
  auto jdouble_field = _ninput.double_field;
  genium::jni::set_double_field(_jenv, javaClass, _jresult, "doubleField", jdouble_field);
  auto jstring_field = _ninput.string_field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "stringField", jstring_field);
  auto jboolean_field = _ninput.boolean_field;
  genium::jni::set_boolean_field(_jenv, javaClass, _jresult, "booleanField", jboolean_field);
  auto jbytes_field = _ninput.bytes_field;
  genium::jni::set_byte_array_field(_jenv, javaClass, _jresult, "bytesField", jbytes_field);
  auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "pointField",
  "Lcom/example/smoke/Point;", jpoint_field);
  _jenv->DeleteLocalRef(jpoint_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
}
}
