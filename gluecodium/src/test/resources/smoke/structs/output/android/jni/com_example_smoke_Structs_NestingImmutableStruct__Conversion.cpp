/*
 *
 */
#include "com_example_smoke_Structs_AllTypesStruct__Conversion.h"
#include "com_example_smoke_Structs_NestingImmutableStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Structs::NestingImmutableStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::NestingImmutableStruct* dummy)
{
    ::smoke::Structs::AllTypesStruct n_struct_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "structField", "Lcom/example/smoke/Structs$AllTypesStruct;"),
        (::smoke::Structs::AllTypesStruct*)nullptr );
    return ::smoke::Structs::NestingImmutableStruct(std::move(n_struct_field));
}
::gluecodium::optional<::smoke::Structs::NestingImmutableStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Structs::NestingImmutableStruct>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::Structs::NestingImmutableStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::NestingImmutableStruct*)nullptr))
        : ::gluecodium::optional<::smoke::Structs::NestingImmutableStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$NestingImmutableStruct", com_example_smoke_Structs_00024NestingImmutableStruct, ::smoke::Structs::NestingImmutableStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::NestingImmutableStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::NestingImmutableStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jstruct_field = convert_to_jni(_jenv, _ninput.struct_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "structField", "Lcom/example/smoke/Structs$AllTypesStruct;", jstruct_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::NestingImmutableStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}