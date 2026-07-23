/*

 *
 */

@file:JvmName("CoroutineClientExtensions")


package com.example.coroutines

import com.example.NativeBase
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.callbackFlow

class CoroutineClient : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun loadValue(callback: ErrorValueCallback) : OperationHandle


    external fun clearCache(callback: ErrorOnlyCallback) : Unit


    external fun resolveName(callback: ValueOnlyCallback) : Unit


    external fun synchronize(callback: CompletionCallback) : Unit


    external fun loadMetadata(callback: MultiValueCallback) : OperationHandle


    external fun observeTicks(callback: TickCallback) : OperationHandle


    external fun download(listener: ProgressListener) : OperationHandle


    external fun transfer(listener: TransferListener) : OperationHandle


    external fun addUpdateListener(listener: UpdateListener) : Unit


    external fun removeUpdateListener(listener: UpdateListener) : Unit


    external fun addStateListener(listener: StateListener) : Unit


    external fun removeStateListener(listener: StateListener) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }

    /** Typed exception wrapper preserving the callback error value. */
    public class LoadValueAsyncException(public val error: OperationError) : Exception(error.toString())

    /** Typed exception wrapper preserving the callback error value. */
    public class ClearCacheException(public val error: OperationError) : Exception(error.toString())

    /** Typed exception wrapper preserving the callback error value. */
    public class LoadMetadataException(public val error: OperationError) : Exception(error.toString())

    /** Typed exception wrapper preserving the callback error value. */
    public class DownloadException(public val error: OperationError) : Exception(error.toString())

    /** Typed exception wrapper preserving the callback error value. */
    public class TransferException(public val error: OperationError) : Exception(error.toString())

    /**
     * Coroutine (`suspend`) variant of `loadValue`.
     *
     * Suspends the calling coroutine until the operation completes instead of taking a callback.
     * Cancelling the coroutine cancels the underlying task.
     * @return [Result] holding the operation value on success, or a failure carrying LoadValueAsyncException on error.
     */
    public suspend fun loadValueAsync(): Result<String> =
            coroutineClientAwaitResultBridge(
            startOperation = { callback -> this.loadValue(ErrorValueCallback { error, callbackValue1 -> callback(error, callbackValue1) }) },
            mapDomainError = { error -> LoadValueAsyncException(error) },
            cancelOperation = { handle -> handle.cancel() },
        )
    /**
     * Coroutine (`suspend`) variant of `clearCache`.
     *
     * Suspends the calling coroutine until the operation completes instead of taking a callback.
     * @return [Result] holding when the operation completes on success, or a failure carrying ClearCacheException on error.
     */
    public suspend fun clearCache(): Result<Unit> =
            coroutineClientAwaitResultBridge(
            startOperation = { callback -> this.clearCache(ErrorOnlyCallback { error -> callback(error, if (error == null) Unit else null) }) },
            mapDomainError = { error -> ClearCacheException(error) },
            cancelOperation = { handle -> Unit },
        )
    /**
     * Coroutine (`suspend`) variant of `resolveName`.
     *
     * Suspends the calling coroutine until the operation completes instead of taking a callback.
     * @return the operation value.
     */
    public suspend fun resolveName(): String? =
            coroutineClientAwaitValueBridge(
            startOperation = { callback -> this.resolveName(ValueOnlyCallback { callbackValue0 -> callback(callbackValue0) }) },
            cancelOperation = { handle -> Unit },
        )
    /**
     * Coroutine (`suspend`) variant of `synchronize`.
     *
     * Suspends the calling coroutine until the operation completes instead of taking a callback.
     * @return when the operation completes.
     */
    public suspend fun synchronize(): Unit =
            coroutineClientAwaitValueBridge(
            startOperation = { callback -> this.synchronize(CompletionCallback { callback(Unit) }) },
            cancelOperation = { handle -> Unit },
        )
    public data class LoadMetadataCoroutineResult(
      public val count: Int,
      public val label: String
    )

    /**
     * Coroutine (`suspend`) variant of `loadMetadata`.
     *
     * Suspends the calling coroutine until the operation completes instead of taking a callback.
     * Cancelling the coroutine cancels the underlying task.
     * @return [Result] holding the callback values grouped in a generated result type on success, or a failure carrying LoadMetadataException on error.
     */
    public suspend fun loadMetadata(): Result<LoadMetadataCoroutineResult> =
            coroutineClientAwaitResultBridge(
            startOperation = { callback -> this.loadMetadata(MultiValueCallback { error, callbackValue1, callbackValue2 -> callback(error, if (callbackValue1 != null && callbackValue2 != null) LoadMetadataCoroutineResult(callbackValue1, callbackValue2) else null) }) },
            mapDomainError = { error -> LoadMetadataException(error) },
            cancelOperation = { handle -> handle.cancel() },
        )
    /**
     * Flow variant of `observeTicks`. Registers the callback when collected and releases it when collection stops.
     */
    public fun observeTicksFlow(): Flow<Int> =
      callbackFlow {
            val listener = TickCallback { callbackValue0 ->
                trySend(callbackValue0)
            }
            val handle = this@CoroutineClient.observeTicks(listener)
            awaitClose { handle.cancel() }
      }
    /**
     * Flow variant of `download`. Registers the callback when collected and releases it when collection stops.
     */
    public fun downloadFlow(): Flow<Int> =
      callbackFlow {
            val listener =
                object : ProgressListener {
                    override fun onProgress(percentage: Int) {
                        trySend(percentage)
                    }

                    override fun onComplete(error: OperationError?) {
                        when {
                            error != null -> close(DownloadException(error))
                            else -> {
                                close()
                            }
                        }
                    }
                }
            val handle = this@CoroutineClient.download(listener)
            awaitClose { handle.cancel() }
      }
    public sealed interface TransferFlowEvent {
        public data class OnProgress(
            public val percentage: Int,
        ) : TransferFlowEvent

        public data class OnComplete(
            public val receipt: String,
        ) : TransferFlowEvent
    }

    /**
     * Flow variant of `transfer`. Registers the callback when collected and releases it when collection stops.
     */
    public fun transferFlow(): Flow<TransferFlowEvent> =
      callbackFlow {
            val listener =
                object : TransferListener {
                    override fun onProgress(percentage: Int) {
                        trySend(TransferFlowEvent.OnProgress(percentage))
                    }

                    override fun onComplete(error: OperationError?, receipt: String?) {
                        when {
                            error != null -> close(TransferException(error))
                            receipt == null -> close(CoroutineClientSdkContractViolationException("SDK contract violation: success callback contains null result"))
                            else -> {
                                trySend(TransferFlowEvent.OnComplete(receipt))
                                close()
                            }
                        }
                    }
                }
            val handle = this@CoroutineClient.transfer(listener)
            awaitClose { handle.cancel() }
      }
    public data class AddUpdateListenerFlowEvent(
        public val identifier: Int,
        public val message: String,
    )

    /**
     * Flow variant of `addUpdateListener`. Registers the callback when collected and releases it when collection stops.
     */
    public fun addUpdateListenerFlow(): Flow<AddUpdateListenerFlowEvent> =
      callbackFlow {
            val listener =
                object : UpdateListener {
                    override fun onUpdate(identifier: Int, message: String) {
                        trySend(AddUpdateListenerFlowEvent(identifier, message))
                    }
                }
            this@CoroutineClient.addUpdateListener(listener)
            awaitClose { this@CoroutineClient.removeUpdateListener(listener) }
      }
    public sealed interface AddStateListenerFlowEvent {
        public object OnStarted : AddStateListenerFlowEvent

        public data class OnMessage(
            public val message: String,
        ) : AddStateListenerFlowEvent
    }

    /**
     * Flow variant of `addStateListener`. Registers the callback when collected and releases it when collection stops.
     */
    public fun addStateListenerFlow(): Flow<AddStateListenerFlowEvent> =
      callbackFlow {
            val listener =
                object : StateListener {
                    override fun onStarted() {
                        trySend(AddStateListenerFlowEvent.OnStarted)
                    }

                    override fun onMessage(message: String) {
                        trySend(AddStateListenerFlowEvent.OnMessage(message))
                    }
                }
            this@CoroutineClient.addStateListener(listener)
            awaitClose { this@CoroutineClient.removeStateListener(listener) }
      }
}
