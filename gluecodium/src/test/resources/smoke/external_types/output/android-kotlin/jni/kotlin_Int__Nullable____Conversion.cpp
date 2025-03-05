/*

 *
 */

#include "kotlin_Int__Nullable____Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{
namespace
{
struct Dummycom_here_android_test_ColorConverterType final {};
}

REGISTER_JNI_CLASS_CACHE("com/here/android/test/ColorConverter", com_here_android_test_ColorConverter, Dummycom_here_android_test_ColorConverterType)

::kotlin_smoke::SystemColor
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput_ext, TypeId<::kotlin_smoke::SystemColor>)
{
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_ColorConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertToInternal", "(Ljava/lang/Integer;)Lcom/example/kotlinsmoke/SystemColor;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertToInternal(Ljava/lang/Integer;)Lcom/example/kotlinsmoke/SystemColor;' not found.");
        return {};
    }

    auto _jinput = make_local_ref(
        _jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jinput_ext.get()));
    ::kotlin_smoke::SystemColor _nout{};
    float n_red = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "red",
        TypeId<float>{} );
    _nout.red = n_red;
    float n_green = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "green",
        TypeId<float>{} );
    _nout.green = n_green;
    float n_blue = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "blue",
        TypeId<float>{} );
    _nout.blue = n_blue;
    float n_alpha = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "alpha",
        TypeId<float>{} );
    _nout.alpha = n_alpha;
    return _nout;
}

std::optional<::kotlin_smoke::SystemColor>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::SystemColor>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::SystemColor>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::SystemColor>{}))
        : std::optional<::kotlin_smoke::SystemColor>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/kotlinsmoke/SystemColor", com_example_kotlinsmoke_SystemColor, ::kotlin_smoke::SystemColor)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::SystemColor& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::SystemColor>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "red", _ninput.red);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "green", _ninput.green);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "blue", _ninput.blue);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "alpha", _ninput.alpha);
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_ColorConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertFromInternal", "(Lcom/example/kotlinsmoke/SystemColor;)Ljava/lang/Integer;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertFromInternal(Lcom/example/kotlinsmoke/SystemColor;)Ljava/lang/Integer;' not found.");
        return {};
    }

    _jresult = make_local_ref(_jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jresult.get()));
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::SystemColor> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
