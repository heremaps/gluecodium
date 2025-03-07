/*

 *
 */

#include "kotlin_Boolean__Nullable____Conversion.h"
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
struct Dummycom_here_android_test_BooleanConverterType final {};
}

REGISTER_JNI_CLASS_CACHE("com/here/android/test/BooleanConverter", com_here_android_test_BooleanConverter, Dummycom_here_android_test_BooleanConverterType)

::kotlin_smoke::VeryBoolean
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput_ext, TypeId<::kotlin_smoke::VeryBoolean>)
{
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_BooleanConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertToInternal", "(Ljava/lang/Boolean;)Lcom/example/kotlinsmoke/VeryBoolean;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertToInternal(Ljava/lang/Boolean;)Lcom/example/kotlinsmoke/VeryBoolean;' not found.");
        return {};
    }

    auto _jinput = make_local_ref(
        _jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jinput_ext.get()));
    ::kotlin_smoke::VeryBoolean _nout{};
    bool n_value = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "value",
        TypeId<bool>{} );
    _nout.value = n_value;
    return _nout;
}

std::optional<::kotlin_smoke::VeryBoolean>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::VeryBoolean>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::VeryBoolean>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::VeryBoolean>{}))
        : std::optional<::kotlin_smoke::VeryBoolean>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/kotlinsmoke/VeryBoolean", com_example_kotlinsmoke_VeryBoolean, ::kotlin_smoke::VeryBoolean)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::VeryBoolean& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::VeryBoolean>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "value", _ninput.value);
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_BooleanConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertFromInternal", "(Lcom/example/kotlinsmoke/VeryBoolean;)Ljava/lang/Boolean;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertFromInternal(Lcom/example/kotlinsmoke/VeryBoolean;)Ljava/lang/Boolean;' not found.");
        return {};
    }

    _jresult = make_local_ref(_jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jresult.get()));
    return _jresult;
}

JniReference<jobject>
convert_to_jni_internal(JNIEnv* _jenv, const ::kotlin_smoke::VeryBoolean& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::VeryBoolean>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "value", _ninput.value);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::VeryBoolean> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
