#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"

namespace genium {
namespace jni {

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InterfaceWithStruct::InnerStruct& _nout ){

  jclass javaClass = _jenv->GetObjectClass(_jinput);

  _nout.value = genium::jni::get_byte_field(_jenv, javaClass, _jinput, "value");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InterfaceWithStruct::InnerStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/InterfaceWithStruct$InnerStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jvalue = _ninput.value;
  genium::jni::set_byte_field(_jenv, javaClass, _jresult, "value", jvalue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ExternalInterface::some_Struct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.some_Field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "someField");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Struct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/ExternalInterface$SomeStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jsome_Field = _ninput.some_Field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "someField", jsome_Field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::Baz::some_Struct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.some_Field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "someField");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::fire::Baz::some_Struct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/VeryExternalInterface$SomeStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jsome_Field = _ninput.some_Field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "someField", jsome_Field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

}
}