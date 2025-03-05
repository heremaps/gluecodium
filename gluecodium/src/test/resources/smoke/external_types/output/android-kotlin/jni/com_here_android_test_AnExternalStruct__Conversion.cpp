/*

 *
 */

#include "com_here_android_test_AnExternalStruct__Conversion.h"
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
struct Dummycom_here_android_test_ExternalStructMarkedAsSerializableConverterType final {};
}

REGISTER_JNI_CLASS_CACHE("com/here/android/test/ExternalStructMarkedAsSerializableConverter", com_here_android_test_ExternalStructMarkedAsSerializableConverter, Dummycom_here_android_test_ExternalStructMarkedAsSerializableConverterType)

::kotlin_smoke::ExternalMarkedAsSerializable
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput_ext, TypeId<::kotlin_smoke::ExternalMarkedAsSerializable>)
{
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_ExternalStructMarkedAsSerializableConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertToInternal", "(Lcom/here/android/test/AnExternalStruct;)Lcom/example/kotlinsmoke/ExternalMarkedAsSerializable;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertToInternal(Lcom/here/android/test/AnExternalStruct;)Lcom/example/kotlinsmoke/ExternalMarkedAsSerializable;' not found.");
        return {};
    }

    auto _jinput = make_local_ref(
        _jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jinput_ext.get()));
    ::kotlin_smoke::ExternalMarkedAsSerializable _nout{};
    int32_t n_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "field",
        TypeId<int32_t>{} );
    _nout.field = n_field;
    return _nout;
}

std::optional<::kotlin_smoke::ExternalMarkedAsSerializable>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::ExternalMarkedAsSerializable>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::ExternalMarkedAsSerializable>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::ExternalMarkedAsSerializable>{}))
        : std::optional<::kotlin_smoke::ExternalMarkedAsSerializable>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/kotlinsmoke/ExternalMarkedAsSerializable", com_example_kotlinsmoke_ExternalMarkedAsSerializable, ::kotlin_smoke::ExternalMarkedAsSerializable)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::ExternalMarkedAsSerializable& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::ExternalMarkedAsSerializable>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "field", _ninput.field);
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_ExternalStructMarkedAsSerializableConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertFromInternal", "(Lcom/example/kotlinsmoke/ExternalMarkedAsSerializable;)Lcom/here/android/test/AnExternalStruct;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertFromInternal(Lcom/example/kotlinsmoke/ExternalMarkedAsSerializable;)Lcom/here/android/test/AnExternalStruct;' not found.");
        return {};
    }

    _jresult = make_local_ref(_jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jresult.get()));
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::ExternalMarkedAsSerializable> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
