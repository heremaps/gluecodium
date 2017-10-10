#include <android/jni/StructConversion.h>
#include <cstdint>
#include <vector>
#include <android/jni/FieldAccessMethods.h>

namespace here {
namespace internal {

void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::InstanceWithStruct::InnerStruct& _nout ){

  jclass javaClass = _jenv->GetObjectClass(_jinput);

  _nout.value = get_byte_field(_jenv, javaClass, _jinput, "value");
}

jobject convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::InnerStruct& _ninput){
  auto javaClass = _jenv->FindClass("com/here/android/smoke/InstanceWithStruct$InnerStruct");
  auto _jresult = create_object(_jenv, javaClass);
  auto jvalue = _ninput.value;
  set_byte_field(_jenv, javaClass, _jresult, "value", jvalue);
  return _jresult;
}

}
}