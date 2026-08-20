/*

 *
 */

@file:JvmName("UploadSessionExtensions")


package com.example.coroutines


class UploadSession {
    @JvmField var label: String



    constructor(label: String) {
        this.label = label
    }





    external fun upload(callback: ErrorValueCallback) : Unit


    companion object {


        @JvmStatic external fun openSession(callback: ErrorOnlyCallback) : Unit
    }
}

