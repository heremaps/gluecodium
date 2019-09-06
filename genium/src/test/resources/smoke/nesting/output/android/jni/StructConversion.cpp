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
::smoke::FreePoint
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::FreePoint* dummy)
{
    ::smoke::FreePoint _nout{};
    double n_x = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "x",
        (double*)nullptr );
    _nout.x = n_x;
    double n_y = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "y",
        (double*)nullptr );
    _nout.y = n_y;
    return _nout;
}
::genium::optional<::smoke::FreePoint>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::FreePoint>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::FreePoint>(convert_from_jni(_jenv, _jinput, (::smoke::FreePoint*)nullptr))
        : ::genium::optional<::smoke::FreePoint>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/FreePoint", ::smoke::FreePoint)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::FreePoint& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::FreePoint>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jx = _ninput.x;
    ::genium::jni::set_field_value(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    ::genium::jni::set_field_value(_jenv, _jresult, "y", jy);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::FreePoint> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::LevelOne::LevelTwo::LevelThree::LevelFour
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour* dummy)
{
    ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour _nout{};
    ::std::string n_string_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.string_field = n_string_field;
    return _nout;
}
::genium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>(convert_from_jni(_jenv, _jinput, (::smoke::LevelOne::LevelTwo::LevelThree::LevelFour*)nullptr))
        : ::genium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne$LevelTwo$LevelThree$LevelFour", ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstring_field = _ninput.string_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::NestedReferences::NestedReferences
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::NestedReferences::NestedReferences* dummy)
{
    ::smoke::NestedReferences::NestedReferences _nout{};
    ::std::string n_string_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.string_field = n_string_field;
    return _nout;
}
::genium::optional<::smoke::NestedReferences::NestedReferences>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::NestedReferences::NestedReferences>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::NestedReferences::NestedReferences>(convert_from_jni(_jenv, _jinput, (::smoke::NestedReferences::NestedReferences*)nullptr))
        : ::genium::optional<::smoke::NestedReferences::NestedReferences>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/NestedReferences$NestedReferences", ::smoke::NestedReferences::NestedReferences)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::NestedReferences::NestedReferences& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::NestedReferences::NestedReferences>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstring_field = _ninput.string_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::NestedReferences::NestedReferences> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::UnusedTopLevelPoint
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::UnusedTopLevelPoint* dummy)
{
    ::smoke::UnusedTopLevelPoint _nout{};
    ::std::string n_foo = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "foo",
        (::std::string*)nullptr );
    _nout.foo = n_foo;
    return _nout;
}
::genium::optional<::smoke::UnusedTopLevelPoint>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::UnusedTopLevelPoint>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::UnusedTopLevelPoint>(convert_from_jni(_jenv, _jinput, (::smoke::UnusedTopLevelPoint*)nullptr))
        : ::genium::optional<::smoke::UnusedTopLevelPoint>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/UnusedTopLevelPoint", ::smoke::UnusedTopLevelPoint)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::UnusedTopLevelPoint& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::UnusedTopLevelPoint>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jfoo = _ninput.foo;
    ::genium::jni::set_field_value(_jenv, _jresult, "foo", jfoo);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::UnusedTopLevelPoint> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
