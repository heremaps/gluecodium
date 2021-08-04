/*
 *
 */
#include "CppProxyBase.h"
#include "JniBase.h"
#include <utility>
namespace gluecodium
{
namespace jni
{
CppProxyBase::ProxyCache CppProxyBase::sProxyCache{};
CppProxyBase::ReverseProxyCache CppProxyBase::sReverseProxyCache{};
CppProxyBase::GlobalJniLock CppProxyBase::sGlobalJniLock{};
JNIEnv*
CppProxyBase::getJniEnvironment( )
{
    return ::gluecodium::jni::getJniEnvironmentForCurrentThread( );
}
CppProxyBase::CppProxyBase( JNIEnv* jenv,
                            ::gluecodium::jni::JniReference<jobject> globalRef,
                            jint jHashCode,
                            ::std::string type_key )
    : mGlobalRef( std::move( globalRef ) ), jHashCode( jHashCode ), type_key( std::move( type_key ) )
{
}
CppProxyBase::~CppProxyBase( )
{
    JNIEnv* jniEnv = getJniEnvironment( );
    {
        ::std::lock_guard< GlobalJniLock > lock( sGlobalJniLock );
        sGlobalJniLock.setJniEnvForCurrentThread( jniEnv );
        sProxyCache.erase( ProxyCacheKey{mGlobalRef.get(), jHashCode, type_key} );
        removeSelfFromReverseCache( );
    }
}
bool
CppProxyBase::ProxyCacheKey::operator==( const CppProxyBase::ProxyCacheKey& other ) const
{
    return jHashCode == other.jHashCode &&
        sGlobalJniLock.getJniEnvForCurrentThread( )->IsSameObject( jObject, other.jObject );
}
void
CppProxyBase::GlobalJniLock::lock( )
{
    cacheMutex.lock( );
}
void
CppProxyBase::GlobalJniLock::unlock( )
{
    jniEnvForCurrentThread = nullptr;
    cacheMutex.unlock( );
}
void
CppProxyBase::GlobalJniLock::setJniEnvForCurrentThread( JNIEnv* env )
{
    jniEnvForCurrentThread = env;
}
JNIEnv*
CppProxyBase::GlobalJniLock::getJniEnvForCurrentThread( )
{
    if ( jniEnvForCurrentThread == nullptr )
    {
        jniEnvForCurrentThread = CppProxyBase::getJniEnvironment( );
    }
    return jniEnvForCurrentThread;
}
jint
CppProxyBase::getHashCode( JNIEnv* jniEnv, jobject jObj )
{
    auto jClass = find_class(jniEnv, "java/lang/System" );
    jmethodID jMethodId
        = jniEnv->GetStaticMethodID( jClass.get(), "identityHashCode", "(Ljava/lang/Object;)I" );
    jint jResult = jniEnv->CallStaticIntMethod( jClass.get(), jMethodId, jObj );
    return jResult;
}
void CppProxyBase::registerInReverseCache( CppProxyBase* proxyBase,
                                           ReverseCacheKey reverseCacheKey,
                                           const jobject& jObj )
{
    proxyBase->mReverseCacheKey = reverseCacheKey;
    sReverseProxyCache[reverseCacheKey] = jObj;
}
void CppProxyBase::removeSelfFromReverseCache( )
{
    if ( mReverseCacheKey != nullptr )
    {
        sReverseProxyCache.erase( mReverseCacheKey );
        mReverseCacheKey = nullptr;
    }
}
JniReference<jobject>
CppProxyBase::getJavaObjectFromReverseCache(JNIEnv* jniEnv, ReverseCacheKey reverseCacheKey) {
    ::std::lock_guard< GlobalJniLock > lock( sGlobalJniLock );
    const auto iterator = sReverseProxyCache.find( reverseCacheKey );
    if (iterator == sReverseProxyCache.end( ))
    {
        return nullptr;
    }
    return make_local_ref(jniEnv, jniEnv->NewLocalRef(iterator->second));
}
}
}
