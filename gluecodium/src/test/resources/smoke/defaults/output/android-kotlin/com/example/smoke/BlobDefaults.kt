/*

 *
 */

package com.example.smoke


class BlobDefaults {
    var emptyList: ByteArray
    var deadBeef: ByteArray



    constructor() {
        this.emptyList = byteArrayOf(  )
        this.deadBeef = byteArrayOf( 222.toByte(), 173.toByte(), 190.toByte(), 239.toByte() )
    }


}

