#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
namespace genium {
namespace jni {
void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::root::space::smoke::SomeStruct& _nout ){
  jclass javaClass = _jenv->GetObjectClass(_jinput);
  _nout.some_field = genium::jni::get_string_field(_jenv, javaClass, _jinput, "someField");
}
jobject convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/example/smoke/SomeStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jsome_field = _ninput.some_field;
  genium::jni::set_string_field(_jenv, javaClass, _jresult, "someField", jsome_field);
  _jenv->DeleteLocalRef(javaClass);
  return _jresult;
}
}
}
