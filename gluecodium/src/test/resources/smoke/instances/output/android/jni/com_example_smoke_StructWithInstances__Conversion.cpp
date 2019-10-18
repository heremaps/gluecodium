/*
 *
 */
#include "com_example_smoke_SimpleClass__Conversion.h"
#include "com_example_smoke_SimpleInterface__Conversion.h"
#include "com_example_smoke_StructWithInstances__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::StructWithInstances
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::StructWithInstances* dummy)
{
    ::smoke::StructWithInstances _nout{};
    ::std::shared_ptr< ::smoke::SimpleClass > n_class_instance = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "classInstance", "Lcom/example/smoke/SimpleClass;"),
        (::std::shared_ptr< ::smoke::SimpleClass >*)nullptr );
    _nout.class_instance = n_class_instance;
    ::std::shared_ptr< ::smoke::SimpleInterface > n_interface_instance = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "interfaceInstance", "Lcom/example/smoke/SimpleInterface;"),
        (::std::shared_ptr< ::smoke::SimpleInterface >*)nullptr );
    _nout.interface_instance = n_interface_instance;
    return _nout;
}
::gluecodium::optional<::smoke::StructWithInstances>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::StructWithInstances>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::StructWithInstances>(convert_from_jni(_jenv, _jinput, (::smoke::StructWithInstances*)nullptr))
        : ::gluecodium::optional<::smoke::StructWithInstances>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/StructWithInstances", ::smoke::StructWithInstances)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::StructWithInstances& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::StructWithInstances>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jclass_instance = convert_to_jni(_jenv, _ninput.class_instance);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "classInstance", "Lcom/example/smoke/SimpleClass;", jclass_instance);
    auto jinterface_instance = convert_to_jni(_jenv, _ninput.interface_instance);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "interfaceInstance", "Lcom/example/smoke/SimpleInterface;", jinterface_instance);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::StructWithInstances> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
