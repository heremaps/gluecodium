/*
 *
 */
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree_LevelFour__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::LevelOne::LevelTwo::LevelThree::LevelFour
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour* dummy)
{
    ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour _nout{};
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.string_field = n_string_field;
    return _nout;
}
::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>(convert_from_jni(_jenv, _jinput, (::smoke::LevelOne::LevelTwo::LevelThree::LevelFour*)nullptr))
        : ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne$LevelTwo$LevelThree$LevelFour", com_example_smoke_LevelOne_00024LevelTwo_00024LevelThree_00024LevelFour, ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.string_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}