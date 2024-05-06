/*

 *
 */

#include "com_example_Foo__Conversion.h"
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
struct Dummycom_example_FooConverterType {};
}

REGISTER_JNI_CLASS_CACHE("com/example/FooConverter", com_example_FooConverter, Dummycom_example_FooConverterType)

::smoke::JavaExternalCtor
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput_ext, TypeId<::smoke::JavaExternalCtor>)
{
    auto& converterClass = CachedJavaClass<Dummycom_example_FooConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertToInternal", "(Lcom/example/Foo;)Lcom/example/smoke/JavaExternalCtor;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertToInternal(Lcom/example/Foo;)Lcom/example/smoke/JavaExternalCtor;' not found.");
        return {};
    }

    auto _jinput = make_local_ref(
        _jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jinput_ext.get()));
    ::smoke::JavaExternalCtor _nout{};
    ::std::string n_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "field",
        TypeId<::std::string>{} );
    _nout.field = n_field;
    return _nout;
}

std::optional<::smoke::JavaExternalCtor>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::JavaExternalCtor>>)
{
    return _jinput
        ? std::optional<::smoke::JavaExternalCtor>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::JavaExternalCtor>{}))
        : std::optional<::smoke::JavaExternalCtor>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/JavaExternalCtor", com_example_smoke_JavaExternalCtor, ::smoke::JavaExternalCtor)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::JavaExternalCtor& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::JavaExternalCtor>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "field", _ninput.field);
    auto& converterClass = CachedJavaClass<Dummycom_example_FooConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertFromInternal", "(Lcom/example/smoke/JavaExternalCtor;)Lcom/example/Foo;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertFromInternal(Lcom/example/smoke/JavaExternalCtor;)Lcom/example/Foo;' not found.");
        return {};
    }

    _jresult = make_local_ref(_jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jresult.get()));
    return _jresult;
}

JniReference<jobject>
convert_to_jni_internal(JNIEnv* _jenv, const ::smoke::JavaExternalCtor& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::JavaExternalCtor>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "field", _ninput.field);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::JavaExternalCtor> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
