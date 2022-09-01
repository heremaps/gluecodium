/*
 *
 */
#include "com_example_smoke_UseOptimizedListStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::UseOptimizedListStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::UseOptimizedListStruct*)
{
    auto j_structs = get_object_field_value(_jenv, _jinput, "structs", "Ljava/util/List;");
    auto structs_handle = get_field_value(_jenv, j_structs, "nativeHandle", (int64_t*)nullptr);
    auto& n_structs = **reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>*>(structs_handle);
    auto j_classes = get_object_field_value(_jenv, _jinput, "classes", "Ljava/util/List;");
    auto classes_handle = get_field_value(_jenv, j_classes, "nativeHandle", (int64_t*)nullptr);
    auto& n_classes = **reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>*>(classes_handle);
    return ::smoke::UseOptimizedListStruct(std::move(n_structs), std::move(n_classes));
}
std::optional<::smoke::UseOptimizedListStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::UseOptimizedListStruct>*)
{
    return _jinput
        ? std::optional<::smoke::UseOptimizedListStruct>(convert_from_jni(_jenv, _jinput, (::smoke::UseOptimizedListStruct*)nullptr))
        : std::optional<::smoke::UseOptimizedListStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/UseOptimizedListStruct", com_example_smoke_UseOptimizedListStruct, ::smoke::UseOptimizedListStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::UseOptimizedListStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::UseOptimizedListStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jstructs = convert_to_jni_optimized(_jenv, _ninput.structs, "com/example/smoke/UseOptimizedListStruct$VeryBigStructLazyNativeList");
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "structs", "Ljava/util/List;", jstructs);
    auto jclasses = convert_to_jni_optimized(_jenv, _ninput.classes, "com/example/smoke/UseOptimizedListStruct$UnreasonablyLazyClassLazyNativeList");
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "classes", "Ljava/util/List;", jclasses);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::UseOptimizedListStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
