/*
 *
 */
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree_LevelFour.h"
#include "com_example_smoke_LevelOne_LevelTwo_LevelThree_LevelFour__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jobject
Java_com_example_smoke_LevelOne_00024LevelTwo_00024LevelThree_00024LevelFour_fooFactory(JNIEnv* _jenv, jobject _jinstance)
{
    auto result = ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour::foo_factory();
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
}
