#include "android/jni/StructConversion.h"
#include <cstdint>
#include <vector>
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/EnumConversion.h"
#include "android/jni/ArrayConversionUtils.h"

namespace here {
namespace internal {

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InstanceWithStruct::InnerStruct& _nout ){

  jclass javaClass = _jenv->GetObjectClass(_jinput);

  _nout.value = here::internal::get_byte_field(_jenv, javaClass, _jinput, "value");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::InnerStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/InstanceWithStruct$InnerStruct");
  auto _jresult = here::internal::create_object(_jenv, javaClass);
  auto jvalue = _ninput.value;
  here::internal::set_byte_field(_jenv, javaClass, _jresult, "value", jvalue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InstanceWithStruct::StructWithInstance& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  convert_from_jni(
    _jenv,
    here::internal::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instance",
    "Lcom/example/smoke/SimpleInstantiableOne;"),
    _nout.instance );
  convert_from_jni(
    _jenv,
    here::internal::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instanceNotNull",
    "Lcom/example/smoke/SimpleInstantiableOne;"),
    _nout.instance_not_null );
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::StructWithInstance& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/InstanceWithStruct$StructWithInstance");
  auto _jresult = here::internal::create_object(_jenv, javaClass);
  auto jinstance = convert_to_jni(_jenv, _ninput.instance);
  here::internal::set_object_field(_jenv, javaClass, _jresult, "instance",
  "Lcom/example/smoke/SimpleInstantiableOne;", jinstance);
  _jenv->DeleteLocalRef(jinstance);
  auto jinstance_not_null = convert_to_jni(_jenv, _ninput.instance_not_null);
  here::internal::set_object_field(_jenv, javaClass, _jresult, "instanceNotNull",
  "Lcom/example/smoke/SimpleInstantiableOne;", jinstance_not_null);
  _jenv->DeleteLocalRef(jinstance_not_null);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

}
}
