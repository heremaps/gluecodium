#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"

namespace genium {
namespace jni {

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InstanceWithStruct::InnerStruct& _nout ){

  jclass javaClass = _jenv->GetObjectClass(_jinput);

  _nout.value = genium::jni::get_byte_field(_jenv, javaClass, _jinput, "value");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::InnerStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/InstanceWithStruct$InnerStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jvalue = _ninput.value;
  genium::jni::set_byte_field(_jenv, javaClass, _jresult, "value", jvalue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InstanceWithStruct::StructWithInstance& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instance",
    "Lcom/example/smoke/SimpleInstantiableOne;"),
    _nout.instance );
  convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instanceNotNull",
    "Lcom/example/smoke/SimpleInstantiableOne;"),
    _nout.instance_not_null );
  convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instanceNotNullWithComment",
    "Lcom/example/smoke/SimpleInstantiableOne;"),
    _nout.instance_not_null_with_comment );
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::StructWithInstance& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/InstanceWithStruct$StructWithInstance");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jinstance = convert_to_jni(_jenv, _ninput.instance);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "instance",
  "Lcom/example/smoke/SimpleInstantiableOne;", jinstance);
  _jenv->DeleteLocalRef(jinstance);
  auto jinstance_not_null = convert_to_jni(_jenv, _ninput.instance_not_null);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "instanceNotNull",
  "Lcom/example/smoke/SimpleInstantiableOne;", jinstance_not_null);
  _jenv->DeleteLocalRef(jinstance_not_null);
  auto jinstance_not_null_with_comment = convert_to_jni(_jenv, _ninput.instance_not_null_with_comment);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "instanceNotNullWithComment",
  "Lcom/example/smoke/SimpleInstantiableOne;", jinstance_not_null_with_comment);
  _jenv->DeleteLocalRef(jinstance_not_null_with_comment);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

}
}
