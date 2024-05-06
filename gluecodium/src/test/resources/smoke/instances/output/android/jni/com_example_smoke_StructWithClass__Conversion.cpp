/*

 *
 */

#include "com_example_smoke_StructWithClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::StructWithClass
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::StructWithClass>)
{
    ::smoke::StructWithClass _nout{};
    ::std::shared_ptr< ::smoke::SimpleClass > n_class_instance = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "classInstance", "Lcom/example/smoke/SimpleClass;"),
        TypeId<::std::shared_ptr< ::smoke::SimpleClass >>{} );
    _nout.class_instance = n_class_instance;
    return _nout;
}

std::optional<::smoke::StructWithClass>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::StructWithClass>>)
{
    return _jinput
        ? std::optional<::smoke::StructWithClass>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::StructWithClass>{}))
        : std::optional<::smoke::StructWithClass>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/StructWithClass", com_example_smoke_StructWithClass, ::smoke::StructWithClass)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::StructWithClass& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::StructWithClass>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    auto jclass_instance = convert_to_jni(_jenv, _ninput.class_instance);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "classInstance", "Lcom/example/smoke/SimpleClass;", jclass_instance);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::StructWithClass> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
