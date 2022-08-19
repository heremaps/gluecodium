/*
 *
 */
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum*)
{
    return ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>(convert_from_jni(_jenv, _jinput, (::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum*)nullptr))
        : ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne$LevelTwo$LevelThree$LevelFourEnum", com_example_smoke_LevelOne_00024LevelTwo_00024LevelThree_00024LevelFourEnum, ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum::NONE):
            enumeratorName = "NONE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/LevelOne$LevelTwo$LevelThree$LevelFourEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}