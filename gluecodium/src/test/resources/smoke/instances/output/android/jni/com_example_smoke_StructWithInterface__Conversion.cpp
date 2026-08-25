/*

 *
 */

#include "com_example_smoke_StructWithInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::StructWithInterface
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::StructWithInterface>)
{
    ::smoke::StructWithInterface _nout{};
    ::std::shared_ptr< ::smoke::SimpleInterface > n_interface_instance = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "interfaceInstance", "Lcom/example/smoke/SimpleInterface;"),
        TypeId<::std::shared_ptr< ::smoke::SimpleInterface >>{} );
    _nout.interface_instance = n_interface_instance;
    return _nout;
}

::gluecodium::optional<::smoke::StructWithInterface>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::StructWithInterface>>)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::StructWithInterface>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::StructWithInterface>{}))
        : ::gluecodium::optional<::smoke::StructWithInterface>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/StructWithInterface", com_example_smoke_StructWithInterface, ::smoke::StructWithInterface)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::StructWithInterface& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::StructWithInterface>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    auto jinterface_instance = convert_to_jni(_jenv, _ninput.interface_instance);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "interfaceInstance", "Lcom/example/smoke/SimpleInterface;", jinterface_instance);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::StructWithInterface> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
