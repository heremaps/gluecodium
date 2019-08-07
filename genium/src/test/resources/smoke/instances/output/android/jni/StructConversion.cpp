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
::fire::Baz::some_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::Baz::some_Struct* dummy)
{
    ::fire::Baz::some_Struct _nout{};
    ::std::string n_some_Field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_Field = n_some_Field;
    return _nout;
}
::genium::optional<::fire::Baz::some_Struct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::Baz::some_Struct>* dummy)
{
    return _jinput
        ? ::genium::optional<::fire::Baz::some_Struct>(convert_from_jni(_jenv, _jinput, (::fire::Baz::some_Struct*)nullptr))
        : ::genium::optional<::fire::Baz::some_Struct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/ExternalClass$SomeStruct", ::fire::Baz::some_Struct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::Baz::some_Struct& _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::Baz::some_Struct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jsome_Field = _ninput.some_Field;
    ::genium::jni::set_field_value(_jenv, _jresult, "someField", jsome_Field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::Baz::some_Struct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::ExternalInterface::some_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ExternalInterface::some_Struct* dummy)
{
    ::smoke::ExternalInterface::some_Struct _nout{};
    ::std::string n_some_Field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_Field = n_some_Field;
    return _nout;
}
::genium::optional<::smoke::ExternalInterface::some_Struct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::ExternalInterface::some_Struct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::ExternalInterface::some_Struct>(convert_from_jni(_jenv, _jinput, (::smoke::ExternalInterface::some_Struct*)nullptr))
        : ::genium::optional<::smoke::ExternalInterface::some_Struct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/ExternalInterface$SomeStruct", ::smoke::ExternalInterface::some_Struct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Struct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::ExternalInterface::some_Struct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jsome_Field = _ninput.some_Field;
    ::genium::jni::set_field_value(_jenv, _jresult, "someField", jsome_Field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::ExternalInterface::some_Struct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::StructWithInstances
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::StructWithInstances* dummy)
{
    ::smoke::StructWithInstances _nout{};
    ::std::shared_ptr< ::smoke::SimpleClass > n_class_instance = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "classInstance",
        "Lcom/example/smoke/SimpleClass;"),
        (::std::shared_ptr< ::smoke::SimpleClass >*)nullptr );
    _nout.class_instance = n_class_instance;
    ::std::shared_ptr< ::smoke::SimpleInterface > n_interface_instance = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "interfaceInstance",
        "Lcom/example/smoke/SimpleInterface;"),
        (::std::shared_ptr< ::smoke::SimpleInterface >*)nullptr );
    _nout.interface_instance = n_interface_instance;
    return _nout;
}
::genium::optional<::smoke::StructWithInstances>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::StructWithInstances>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::StructWithInstances>(convert_from_jni(_jenv, _jinput, (::smoke::StructWithInstances*)nullptr))
        : ::genium::optional<::smoke::StructWithInstances>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/StructWithInstances", ::smoke::StructWithInstances)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::StructWithInstances& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::StructWithInstances>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jclass_instance = convert_to_jni(_jenv, _ninput.class_instance);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "classInstance",
        "Lcom/example/smoke/SimpleClass;", jclass_instance);
    auto jinterface_instance = convert_to_jni(_jenv, _ninput.interface_instance);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "interfaceInstance",
        "Lcom/example/smoke/SimpleInterface;", jinterface_instance);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::StructWithInstances> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
