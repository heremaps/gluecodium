/*

 *
 */

#include "com_example_smoke_Structs_ImmutableStructWithCppAccessors__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Structs::ImmutableStructWithCppAccessors
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::ImmutableStructWithCppAccessors>)
{
    
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        TypeId<::std::string>{} );
    
    return ::smoke::Structs::ImmutableStructWithCppAccessors(std::move(n_string_field));
}

std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>>)
{
    return _jinput
        ? std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Structs::ImmutableStructWithCppAccessors>{}))
        : std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$ImmutableStructWithCppAccessors", com_example_smoke_Structs_00024ImmutableStructWithCppAccessors, ::smoke::Structs::ImmutableStructWithCppAccessors)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ImmutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::ImmutableStructWithCppAccessors>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.get_string_field());
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::ImmutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
