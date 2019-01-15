#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
namespace genium {
namespace jni {
::root::space::smoke::SomeStruct convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct* dummy ){
  ::root::space::smoke::SomeStruct _nout{};
  ::std::string n_some_field = genium::jni::get_string_field(_jenv, _jinput, "someField");
  _nout.some_field = n_some_field;
  return _nout;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput){
  auto javaClass = find_class(_jenv, "com/example/smoke/SomeStruct");
  auto _jresult = genium::jni::create_object(_jenv, javaClass);
  auto jsome_field = _ninput.some_field;
  genium::jni::set_string_field(_jenv, _jresult, "someField", jsome_field);
  return _jresult;
}
}
}