/*

 *
 */

@file:JvmName("InternalListenerExtensions")


package com.example.smoke


internal fun interface InternalListener {



    @JvmSynthetic fun onEvent() : Unit


}

