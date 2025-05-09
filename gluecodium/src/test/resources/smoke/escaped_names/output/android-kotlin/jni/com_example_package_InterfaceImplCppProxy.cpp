/*

 *
 */

#include "com_example_package_InterfaceImplCppProxy.h"
#include "com_example_package_Interface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_package_Interface_CppProxy::com_example_package_Interface_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_package_Interface") {
}

}
}
