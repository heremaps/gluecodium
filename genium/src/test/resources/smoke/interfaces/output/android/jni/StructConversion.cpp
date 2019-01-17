#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
namespace genium
{
namespace jni
{
::smoke::InterfaceWithStruct::InnerStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::InterfaceWithStruct::InnerStruct* dummy)
{
    ::smoke::InterfaceWithStruct::InnerStruct _nout{};
    int8_t n_value = genium::jni::get_byte_field(_jenv, _jinput, "value");
    _nout.value = n_value;
    return _nout;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::InterfaceWithStruct::InnerStruct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/InterfaceWithStruct$InnerStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jvalue = _ninput.value;
    genium::jni::set_byte_field(_jenv, _jresult, "value", jvalue);
    return _jresult;
}
::smoke::ExternalInterface::some_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ExternalInterface::some_Struct* dummy)
{
    ::smoke::ExternalInterface::some_Struct _nout{};
    ::std::string n_some_Field = genium::jni::get_string_field(_jenv, _jinput, "someField");
    _nout.some_Field = n_some_Field;
    return _nout;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Struct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/ExternalInterface$SomeStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jsome_Field = _ninput.some_Field;
    genium::jni::set_string_field(_jenv, _jresult, "someField", jsome_Field);
    return _jresult;
}
::fire::Baz::some_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::Baz::some_Struct* dummy)
{
    ::fire::Baz::some_Struct _nout{};
    ::std::string n_some_Field = genium::jni::get_string_field(_jenv, _jinput, "someField");
    _nout.some_Field = n_some_Field;
    return _nout;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::Baz::some_Struct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/VeryExternalInterface$SomeStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jsome_Field = _ninput.some_Field;
    genium::jni::set_string_field(_jenv, _jresult, "someField", jsome_Field);
    return _jresult;
}
}
}
