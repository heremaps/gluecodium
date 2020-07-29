/*
 *
 */
#include "JniCallJavaMethod.h"
namespace gluecodium
{
namespace jni
{
void
throw_runtime_exception(JNIEnv* jni_env, const char* message) {
    auto exceptionClass = find_class(jni_env, "java/lang/RuntimeException");
    jni_env->ThrowNew(exceptionClass.get(), message);
}
}
}
