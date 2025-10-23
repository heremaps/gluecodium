/*

 *
 */

@file:JvmName("StructWithInterfaceExtensions")

package com.example.smoke


class StructWithInterface {
    @JvmField var interfaceInstance: SimpleInterface



    constructor(interfaceInstance: SimpleInterface) {
        this.interfaceInstance = interfaceInstance
    }





}

