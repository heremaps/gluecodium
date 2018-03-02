#include "android/jni/StructConversion.h"
#include <cstdint>
#include <vector>
#include "android/jni/FieldAccessMethods.h"
#include "android/jni/EnumConversion.h"
#include "android/jni/ArrayConversionUtils.h"

namespace here {
namespace internal {

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InterfaceWithStruct::InnerStruct& _nout ){

  jclass javaClass = _jenv->GetObjectClass(_jinput);

  _nout.value = here::internal::get_byte_field(_jenv, javaClass, _jinput, "value");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InterfaceWithStruct::InnerStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/InterfaceWithStruct$InnerStruct");
  auto _jresult = here::internal::create_object(_jenv, javaClass);
  auto jvalue = _ninput.value;
  here::internal::set_byte_field(_jenv, javaClass, _jresult, "value", jvalue);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}

}
}