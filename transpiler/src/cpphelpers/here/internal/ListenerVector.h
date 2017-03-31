// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cassert>
#include <mutex>
#include <vector>

namespace here {

namespace internal {

struct SingleThreadedListenerPolicy {
    struct PolicyDependantMutex {
    };
    struct PolicyDependantMutexLock {
        PolicyDependantMutexLock(PolicyDependantMutex) {}
    };
};

struct MultiThreadedListenerPolicy {
    typedef std::recursive_mutex PolicyDependantMutex;
    typedef std::lock_guard<PolicyDependantMutex> PolicyDependantMutexLock;
};

template <typename TListener, typename TLockingPolicy = SingleThreadedListenerPolicy>
class ListenerVector {
public:
    // Multi threaded version of ListenerVector
    typedef ListenerVector<TListener, MultiThreadedListenerPolicy> MT;

private:
    typedef std::vector< std::weak_ptr< TListener > > BASE;
    typedef typename TLockingPolicy::PolicyDependantMutexLock MutexLock;

    template <typename... Args>
    struct MemberFunction {
        typedef void (TListener::*type)(Args...);
    };

public:
    ListenerVector()
        : m_in_call(false)
        , m_listeners_is_copied(false)
        , m_listeners_copy_modified(false)
    {
    }

    ~ListenerVector()
    {
        // We need to call thread safe listeners clear
        clear();
    }

    bool add_listener(std::weak_ptr< TListener > listener)
    {
        MutexLock lock(m_mutex);

        BASE& container = get_container();

        for (typename BASE::size_type i = 0; i < container.size(); i++) {
            if (container[i] == listener) {
                return false;
            }
        }

        container.push_back(listener);
        m_listeners_copy_modified = m_listeners_is_copied;
        return true;
    }

    bool remove_listener(std::weak_ptr< TListener > listener)
    {
        MutexLock lock(m_mutex);

        BASE& container = get_container();

        for (typename BASE::size_type i = 0; i < container.size(); i++) {
            if (container[i] == listener) {
                container.erase(container.begin() + i);
                m_listeners_copy_modified = m_listeners_is_copied;
                return true;
            }
        }

        return false;
    }

    template <typename... Args>
    void
    call_all(typename MemberFunction<Args...>::type member_function, Args... args) const
    {
        MutexLock lock(m_mutex);

        InCall call(this);

        for (auto& listener : m_listeners) {
            auto shared_listener = listener.lock();
            if (shared_listener) {
                ((shared_listener.get())->*member_function)(args...);
            }
        }
    }

    void clear()
    {
        MutexLock lock(m_mutex);

        m_listeners.clear();
    }

    typename BASE::size_type size() const
    {
        MutexLock lock(m_mutex);

        return m_listeners.size();
    }

    typename BASE::reference operator[](typename BASE::size_type i)
    {
        MutexLock lock(m_mutex);

        return m_listeners[i];
    }

    typename BASE::const_reference operator[](typename BASE::size_type i) const
    {
        MutexLock lock(m_mutex);

        return m_listeners[i];
    }

private:
    /**
     * m_in_call state handling
     * On destruction also copy m_modified_listeners to m_listeners.
     */
    struct InCall {
        InCall(ListenerVector const* parent)
            : m_old_state(parent->m_in_call)
            , m_parent(parent)
        {
            parent->m_in_call = true;
        }

        ~InCall()
        {
            m_parent->m_in_call = m_old_state;

            if (!m_parent->m_in_call) {
                m_parent->apply_modified();
            }
        }

    private:
        bool m_old_state;
        ListenerVector const* m_parent;
    };

private:
    /**
     * Either return m_listeners or m_modified_listeners when m_in_call
     */
    BASE& get_container()
    {
        if (m_listeners_is_copied) {
            return m_listeners_copy;
        } else if (m_in_call) {
            m_listeners_is_copied = true;
            m_listeners_copy = m_listeners;

            return m_listeners_copy;
        } else {
            return m_listeners;
        }
    }

    void apply_modified() const
    {
        assert(!m_in_call);

        if (m_listeners_is_copied) {
            if (m_listeners_copy_modified) {
                m_listeners = m_listeners_copy;
                m_listeners_copy_modified = false;
            }

            m_listeners_copy.clear();
            m_listeners_is_copied = false;
        }
    }

    mutable BASE m_listeners;
    mutable bool m_in_call; ///< m_listeners is iterated on, prevent any change to m_listeners
    mutable BASE m_listeners_copy; ///< Temporary copy of m_listeners with changes done while
    /// m_in_call
    mutable bool m_listeners_is_copied; ///< m_listeners has been copied to m_listeners_copy
    mutable bool m_listeners_copy_modified; ///< m_listeners_copy contains changes

    mutable typename TLockingPolicy::PolicyDependantMutex m_mutex;
};

} // internal

} // here
