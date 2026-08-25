/*

 *
 */

#include "com_example_smoke_SkipField__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::SkipField
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::SkipField>)
{
    ::smoke::SkipField _nout{};
    ::std::string n_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "field",
        TypeId<::std::string>{} );
    _nout.field = n_field;
    return _nout;
}

::gluecodium::optional<::smoke::SkipField>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::SkipField>>)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::SkipField>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::SkipField>{}))
        : ::gluecodium::optional<::smoke::SkipField>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/SkipField", com_example_smoke_SkipField, ::smoke::SkipField)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::SkipField& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::SkipField>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "field", _ninput.field);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::SkipField> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
