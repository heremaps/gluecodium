// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/MyParentInterface.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT MyOuterClass {
public:
    MyOuterClass();
    virtual ~MyOuterClass() = 0;
public:
    class _GLUECODIUM_CPP_EXPORT MyNestedImplementation: public ::smoke::MyParentInterface {
    public:
        MyNestedImplementation();
        virtual ~MyNestedImplementation() = 0;
    };
};
}
