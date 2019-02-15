#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
namespace genium
{
namespace jni
{
::smoke::InterfaceWithStruct::InnerStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::InterfaceWithStruct::InnerStruct* dummy)
{
    ::smoke::InterfaceWithStruct::InnerStruct _nout{};
    int8_t n_value = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "value",
        (int8_t*)nullptr );
    _nout.value = n_value;
    return _nout;
}
std::shared_ptr<::smoke::InterfaceWithStruct::InnerStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::InterfaceWithStruct::InnerStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::InterfaceWithStruct::InnerStruct>(convert_from_jni(_jenv, _jinput, (::smoke::InterfaceWithStruct::InnerStruct*)nullptr))
        : std::shared_ptr<::smoke::InterfaceWithStruct::InnerStruct>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::InterfaceWithStruct::InnerStruct, "com/example/smoke/InterfaceWithStruct$InnerStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::InterfaceWithStruct::InnerStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::InterfaceWithStruct::InnerStruct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jvalue = _ninput.value;
    genium::jni::set_byte_field(_jenv, _jresult, "value", jvalue);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::InterfaceWithStruct::InnerStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::ExternalInterface::some_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ExternalInterface::some_Struct* dummy)
{
    ::smoke::ExternalInterface::some_Struct _nout{};
    ::std::string n_some_Field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_Field = n_some_Field;
    return _nout;
}
std::shared_ptr<::smoke::ExternalInterface::some_Struct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::ExternalInterface::some_Struct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::ExternalInterface::some_Struct>(convert_from_jni(_jenv, _jinput, (::smoke::ExternalInterface::some_Struct*)nullptr))
        : std::shared_ptr<::smoke::ExternalInterface::some_Struct>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::ExternalInterface::some_Struct, "com/example/smoke/ExternalInterface$SomeStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Struct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::ExternalInterface::some_Struct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jsome_Field = _ninput.some_Field;
    genium::jni::set_string_field(_jenv, _jresult, "someField", jsome_Field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ExternalInterface::some_Struct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::fire::Baz::some_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::Baz::some_Struct* dummy)
{
    ::fire::Baz::some_Struct _nout{};
    ::std::string n_some_Field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_Field = n_some_Field;
    return _nout;
}
std::shared_ptr<::fire::Baz::some_Struct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::Baz::some_Struct>* dummy)
{
    return _jinput
        ? std::make_shared<::fire::Baz::some_Struct>(convert_from_jni(_jenv, _jinput, (::fire::Baz::some_Struct*)nullptr))
        : std::shared_ptr<::fire::Baz::some_Struct>{};
}
REGISTER_JNI_CLASS_CACHE(::fire::Baz::some_Struct, "com/example/smoke/VeryExternalInterface$SomeStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::Baz::some_Struct& _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::Baz::some_Struct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jsome_Field = _ninput.some_Field;
    genium::jni::set_string_field(_jenv, _jresult, "someField", jsome_Field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::Baz::some_Struct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
