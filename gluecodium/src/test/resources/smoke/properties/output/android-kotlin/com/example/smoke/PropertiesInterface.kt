/*

 *
 */

@file:JvmName("PropertiesInterfaceExtensions")

package com.example.smoke


interface PropertiesInterface {
    class ExampleStruct {
        @JvmField var value: Double



        constructor(value: Double) {
            this.value = value
        }





    }



    var structProperty: PropertiesInterface.ExampleStruct
        get
        set


}

