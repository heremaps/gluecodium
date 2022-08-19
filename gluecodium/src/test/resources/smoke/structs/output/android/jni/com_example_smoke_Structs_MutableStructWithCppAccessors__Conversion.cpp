/*
 *
 */
#include "com_example_smoke_Structs_MutableStructWithCppAccessors__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Structs::MutableStructWithCppAccessors
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::MutableStructWithCppAccessors*)
{
    ::smoke::Structs::MutableStructWithCppAccessors _nout{};
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.set_string_field(n_string_field);
    return _nout;
}
std::optional<::smoke::Structs::MutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::Structs::MutableStructWithCppAccessors>*)
{
    return _jinput
        ? std::optional<::smoke::Structs::MutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::MutableStructWithCppAccessors*)nullptr))
        : std::optional<::smoke::Structs::MutableStructWithCppAccessors>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$MutableStructWithCppAccessors", com_example_smoke_Structs_00024MutableStructWithCppAccessors, ::smoke::Structs::MutableStructWithCppAccessors)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::MutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::MutableStructWithCppAccessors>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.get_string_field());
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::MutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
