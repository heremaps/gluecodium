/*

 *
 */

#include "com_example_smoke_EnumWithAlias__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::EnumWithAlias
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::EnumWithAlias>)
{
    return ::smoke::EnumWithAlias(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", TypeId<int32_t>{}));
}

std::optional<::smoke::EnumWithAlias>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::EnumWithAlias>>)
{
    return _jinput
        ? std::optional<::smoke::EnumWithAlias>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::EnumWithAlias>{}))
        : std::optional<::smoke::EnumWithAlias>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/EnumWithAlias", com_example_smoke_EnumWithAlias, ::smoke::EnumWithAlias)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::EnumWithAlias _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::EnumWithAlias>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::EnumWithAlias::ONE):
            enumeratorName = "ONE";
            break;
        case(::smoke::EnumWithAlias::TWO):
            enumeratorName = "TWO";
            break;
        case(::smoke::EnumWithAlias::THREE):
            enumeratorName = "THREE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/EnumWithAlias;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::EnumWithAlias> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
