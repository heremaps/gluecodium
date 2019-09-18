/*
 *
 */
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
::root::space::smoke::SomeStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct* dummy)
{
    ::root::space::smoke::SomeStruct _nout{};
    ::std::string n_some_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_field = n_some_field;
    return _nout;
}
::genium::optional<::root::space::smoke::SomeStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::root::space::smoke::SomeStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::root::space::smoke::SomeStruct>(convert_from_jni(_jenv, _jinput, (::root::space::smoke::SomeStruct*)nullptr))
        : ::genium::optional<::root::space::smoke::SomeStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/SomeStruct", ::root::space::smoke::SomeStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::root::space::smoke::SomeStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jsome_field = _ninput.some_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "someField", jsome_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::root::space::smoke::SomeStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
