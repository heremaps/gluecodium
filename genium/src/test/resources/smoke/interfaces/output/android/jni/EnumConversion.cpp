#include "EnumConversion.h"
namespace genium
{
namespace jni
{
::smoke::ExternalInterface::some_Enum
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ExternalInterface::some_Enum* dummy )
{
    return ::smoke::ExternalInterface::some_Enum( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Enum _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/ExternalInterface$SomeEnum" );
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::smoke::ExternalInterface::some_Enum::some_Value):
            enumeratorName = "SOME_VALUE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/ExternalInterface$SomeEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
::fire::Baz::some_Enum
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::Baz::some_Enum* dummy )
{
    return ::fire::Baz::some_Enum( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::fire::Baz::some_Enum _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/VeryExternalInterface$SomeEnum" );
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::fire::Baz::some_Enum::some_Value):
            enumeratorName = "SOME_VALUE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/VeryExternalInterface$SomeEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
}
}
