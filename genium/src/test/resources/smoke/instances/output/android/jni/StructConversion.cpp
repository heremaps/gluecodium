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
::smoke::InstanceWithStruct::InnerStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::InstanceWithStruct::InnerStruct* dummy)
{
    ::smoke::InstanceWithStruct::InnerStruct _nout{};
    int8_t n_value = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "value",
        (int8_t*)nullptr );
    _nout.value = n_value;
    return _nout;
}
std::shared_ptr<::smoke::InstanceWithStruct::InnerStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::InstanceWithStruct::InnerStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::InstanceWithStruct::InnerStruct>(convert_from_jni(_jenv, _jinput, (::smoke::InstanceWithStruct::InnerStruct*)nullptr))
        : std::shared_ptr<::smoke::InstanceWithStruct::InnerStruct>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::InstanceWithStruct::InnerStruct, "com/example/smoke/InstanceWithStruct$InnerStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::InnerStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::InstanceWithStruct::InnerStruct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jvalue = _ninput.value;
    genium::jni::set_field_value(_jenv, _jresult, "value", jvalue);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::InstanceWithStruct::InnerStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::InstanceWithStruct::StructWithInstance
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::InstanceWithStruct::StructWithInstance* dummy)
{
    ::smoke::InstanceWithStruct::StructWithInstance _nout{};
    ::std::shared_ptr< ::smoke::SimpleInstantiable > n_instance = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "instance",
        "Lcom/example/smoke/SimpleInstantiable;"),
        (::std::shared_ptr< ::smoke::SimpleInstantiable >*)nullptr );
    _nout.instance = n_instance;
    ::std::shared_ptr< ::smoke::SimpleInstantiable > n_instance_with_comment = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "instanceWithComment",
        "Lcom/example/smoke/SimpleInstantiable;"),
        (::std::shared_ptr< ::smoke::SimpleInstantiable >*)nullptr );
    _nout.instance_with_comment = n_instance_with_comment;
    return _nout;
}
std::shared_ptr<::smoke::InstanceWithStruct::StructWithInstance>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::InstanceWithStruct::StructWithInstance>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::InstanceWithStruct::StructWithInstance>(convert_from_jni(_jenv, _jinput, (::smoke::InstanceWithStruct::StructWithInstance*)nullptr))
        : std::shared_ptr<::smoke::InstanceWithStruct::StructWithInstance>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::InstanceWithStruct::StructWithInstance, "com/example/smoke/InstanceWithStruct$StructWithInstance")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::InstanceWithStruct::StructWithInstance& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::InstanceWithStruct::StructWithInstance>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jinstance = convert_to_jni(_jenv, _ninput.instance);
    genium::jni::set_object_field_value(_jenv, _jresult, "instance",
        "Lcom/example/smoke/SimpleInstantiable;", jinstance);
    auto jinstance_with_comment = convert_to_jni(_jenv, _ninput.instance_with_comment);
    genium::jni::set_object_field_value(_jenv, _jresult, "instanceWithComment",
        "Lcom/example/smoke/SimpleInstantiable;", jinstance_with_comment);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::InstanceWithStruct::StructWithInstance> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
