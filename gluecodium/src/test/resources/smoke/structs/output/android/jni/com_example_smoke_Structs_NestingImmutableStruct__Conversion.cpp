/*

 *
 */

#include "com_example_smoke_Structs_NestingImmutableStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Structs::NestingImmutableStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::NestingImmutableStruct>)
{
    
    ::smoke::Structs::AllTypesStruct n_struct_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "structField", "Lcom/example/smoke/Structs$AllTypesStruct;"),
        TypeId<::smoke::Structs::AllTypesStruct>{} );
    
    return ::smoke::Structs::NestingImmutableStruct(std::move(n_struct_field));
}

std::optional<::smoke::Structs::NestingImmutableStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Structs::NestingImmutableStruct>>)
{
    return _jinput
        ? std::optional<::smoke::Structs::NestingImmutableStruct>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Structs::NestingImmutableStruct>{}))
        : std::optional<::smoke::Structs::NestingImmutableStruct>{};
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
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::NestingImmutableStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
