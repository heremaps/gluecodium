/*

 *
 */

@file:JvmName("CoroutineClientExtensions")


package com.example.coroutines

import com.example.NativeBase
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.buffer
import kotlinx.coroutines.flow.callbackFlow

class CoroutineClient : NativeBase {

    class Options {
        @JvmField var retryCount: Int



        constructor(retryCount: Int) {
            this.retryCount = retryCount
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun loadValue(callback: ErrorValueCallback) : OperationHandle


    external fun refresh(callback: ErrorOnlyCallback) : AbortableHandle


    external fun clearCache(callback: ErrorOnlyCallback) : Unit
    /**
     * Resolves the display name for the current account.
     * @param callback
     */

    external fun resolveName(callback: ValueOnlyCallback) : Unit


    external fun synchronize(callback: CompletionCallback) : Unit


    external fun loadMetadata(callback: MultiValueCallback) : OperationHandle


    external fun listFeatures(callback: TrailingErrorCallback) : Unit


    external fun observeTicks(callback: TickCallback) : OperationHandle


    external fun download(listener: ProgressListener) : OperationHandle


    external fun transfer(listener: TransferListener) : OperationHandle


    external fun addUpdateListener(listener: UpdateListener) : Unit


    external fun removeUpdateListener(listener: UpdateListener) : Unit


    external fun addStateListener(listener: StateListener) : Unit


    external fun removeStateListener(listener: StateListener) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun preload(callback: ErrorOnlyCallback) : Unit
    }
}

