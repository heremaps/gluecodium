/*
 *
 */
#include "com_example_foobar_CrossPackageChildInterfaceImpl.h"
#include "com_example_foobar_CrossPackageChildInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
void
Java_com_example_foobar_CrossPackageChildInterfaceImpl_rootMethod(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::foobar::CrossPackageChildInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->root_method();
}
jstring
Java_com_example_foobar_CrossPackageChildInterfaceImpl_getRootProperty(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::foobar::CrossPackageChildInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->get_root_property();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
void
Java_com_example_foobar_CrossPackageChildInterfaceImpl_setRootProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)
{
    ::std::string value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::foobar::CrossPackageChildInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_root_property(value);
}
JNIEXPORT void JNICALL
Java_com_example_foobar_CrossPackageChildInterfaceImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::foobar::CrossPackageChildInterface>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
