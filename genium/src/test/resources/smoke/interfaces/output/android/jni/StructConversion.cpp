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

}
}