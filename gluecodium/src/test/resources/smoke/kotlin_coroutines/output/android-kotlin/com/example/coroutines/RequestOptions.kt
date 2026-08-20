/*

 *
 */

@file:JvmName("RequestOptionsExtensions")


package com.example.coroutines


class RequestOptions {
    @JvmField var retryCount: Int



    @JvmOverloads
    constructor(retryCount: Int = 3) {
        this.retryCount = retryCount
    }





}

