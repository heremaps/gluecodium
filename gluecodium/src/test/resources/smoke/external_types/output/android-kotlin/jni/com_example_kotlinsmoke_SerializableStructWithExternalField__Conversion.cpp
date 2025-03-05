/*

 *
 */

#include "com_example_kotlinsmoke_SerializableStructWithExternalField__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::kotlin_smoke::SerializableStructWithExternalField
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::SerializableStructWithExternalField>)
{
    ::kotlin_smoke::SerializableStructWithExternalField _nout{};
    ::kotlin_smoke::ExternalMarkedAsSerializable n_some_struct = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "someStruct", "Lcom/here/android/test/AnExternalStruct;"),
        TypeId<::kotlin_smoke::ExternalMarkedAsSerializable>{} );
    _nout.some_struct = n_some_struct;
    return _nout;
}

std::optional<::kotlin_smoke::SerializableStructWithExternalField>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::SerializableStructWithExternalField>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::SerializableStructWithExternalField>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::SerializableStructWithExternalField>{}))
        : std::optional<::kotlin_smoke::SerializableStructWithExternalField>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/kotlinsmoke/SerializableStructWithExternalField", com_example_kotlinsmoke_SerializableStructWithExternalField, ::kotlin_smoke::SerializableStructWithExternalField)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::SerializableStructWithExternalField& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::SerializableStructWithExternalField>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    auto jsome_struct = convert_to_jni(_jenv, _ninput.some_struct);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "someStruct", "Lcom/here/android/test/AnExternalStruct;", jsome_struct);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::SerializableStructWithExternalField> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
