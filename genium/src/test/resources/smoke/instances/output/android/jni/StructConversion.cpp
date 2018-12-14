#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
namespace genium {
namespace jni {
::smoke::InstanceWithStruct::InnerStruct convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::InstanceWithStruct::InnerStruct* dummy ){
  ::smoke::InstanceWithStruct::InnerStruct _nout{};
  auto javaClass = get_object_class(_jenv, _jinput);
  int8_t n_value = genium::jni::get_byte_field(_jenv, javaClass, _jinput, "value");
  _nout.value = n_value;
  return _nout;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::InnerStruct& _ninput){
  auto javaClass = find_class(_jenv, "com/example/smoke/InstanceWithStruct$InnerStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jvalue = _ninput.value;
  genium::jni::set_byte_field(_jenv, javaClass, _jresult, "value", jvalue);
  return _jresult;
}
::smoke::InstanceWithStruct::StructWithInstance convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::InstanceWithStruct::StructWithInstance* dummy ){
  ::smoke::InstanceWithStruct::StructWithInstance _nout{};
  auto javaClass = get_object_class(_jenv, _jinput);
  ::std::shared_ptr< ::smoke::SimpleInstantiable > n_instance = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instance",
    "Lcom/example/smoke/SimpleInstantiable;"),
    (::std::shared_ptr< ::smoke::SimpleInstantiable >*)nullptr );
  _nout.instance = n_instance;
  ::std::shared_ptr< ::smoke::SimpleInstantiable > n_instance_not_null = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instanceNotNull",
    "Lcom/example/smoke/SimpleInstantiable;"),
    (::std::shared_ptr< ::smoke::SimpleInstantiable >*)nullptr );
  _nout.instance_not_null = n_instance_not_null;
  ::std::shared_ptr< ::smoke::SimpleInstantiable > n_instance_not_null_with_comment = convert_from_jni(
    _jenv,
    genium::jni::get_object_field(
    _jenv,
    javaClass,
    _jinput,
    "instanceNotNullWithComment",
    "Lcom/example/smoke/SimpleInstantiable;"),
    (::std::shared_ptr< ::smoke::SimpleInstantiable >*)nullptr );
  _nout.instance_not_null_with_comment = n_instance_not_null_with_comment;
  return _nout;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::StructWithInstance& _ninput){
  auto javaClass = find_class(_jenv, "com/example/smoke/InstanceWithStruct$StructWithInstance");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jinstance = convert_to_jni(_jenv, _ninput.instance);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "instance",
  "Lcom/example/smoke/SimpleInstantiable;", jinstance);
  auto jinstance_not_null = convert_to_jni(_jenv, _ninput.instance_not_null);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "instanceNotNull",
  "Lcom/example/smoke/SimpleInstantiable;", jinstance_not_null);
  auto jinstance_not_null_with_comment = convert_to_jni(_jenv, _ninput.instance_not_null_with_comment);
  genium::jni::set_object_field(_jenv, javaClass, _jresult, "instanceNotNullWithComment",
  "Lcom/example/smoke/SimpleInstantiable;", jinstance_not_null_with_comment);
  return _jresult;
}
}
}