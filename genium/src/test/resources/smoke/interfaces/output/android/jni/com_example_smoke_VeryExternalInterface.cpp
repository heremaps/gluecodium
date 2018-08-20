/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

#include "foo/Bar.h"
#include "com_example_smoke_VeryExternalInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"

extern "C" {
void
Java_com_example_smoke_VeryExternalInterface_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter)
{
    int8_t someParameter = jsomeParameter;
    auto pointerAsLong = genium::jni::get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, "nativeHandle");
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (pointerAsLong);
    (*pInstanceSharedPointer)->some_Method(someParameter);
}

void
Java_com_example_smoke_VeryExternalInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::fire::Baz>*> (_jpointerRef);
}
}
