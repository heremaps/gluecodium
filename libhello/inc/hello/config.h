// Copyright (c) 2017 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef HELLO_CONFIG_H
#define HELLO_CONFIG_H

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32) && !defined(__CYGWIN__)
#define PLATFORM_WINDOWS
#else
#define PLATFORM_POSIX
#endif

// Generic helper definitions for shared library support
#if defined _WIN32 || defined __CYGWIN__
  #define HELLO_HELPER_SHARED_IMPORT __declspec(dllimport)
  #define HELLO_HELPER_SHARED_EXPORT __declspec(dllexport)
  #define HELLO_HELPER_SHARED_LOCAL
#else
  #if __GNUC__ >= 4
    #define HELLO_HELPER_SHARED_IMPORT __attribute__ ((visibility ("default")))
    #define HELLO_HELPER_SHARED_EXPORT __attribute__ ((visibility ("default")))
    #define HELLO_HELPER_SHARED_LOCAL  __attribute__ ((visibility ("hidden")))
  #else
    #define HELLO_HELPER_SHARED_IMPORT
    #define HELLO_HELPER_SHARED_EXPORT
    #define HELLO_HELPER_SHARED_LOCAL
  #endif
#endif

// Now we use the generic helper definitions above to define HELLO_API and HELLO_LOCAL.
// HELLO_API is used for the public API symbols. It either DLL imports or DLL exports (or does nothing for static build)
// HELLO_LOCAL is used for non-api symbols.

#ifdef HELLO_SHARED // defined if HELLO is compiled as a DLL / shared object
  #ifdef HELLO_SHARED_EXPORTS // defined if we are building the HELLO DLL (instead of using it)
    #define HELLO_API HELLO_HELPER_SHARED_EXPORT
  #else
    #define HELLO_API HELLO_HELPER_SHARED_IMPORT
  #endif // HELLO_SHARED_EXPORTS
  #define HELLO_LOCAL HELLO_HELPER_SHARED_LOCAL
#else // HELLO_SHARED is not defined: this means HELLO is a static lib.
  #define HELLO_API
  #define HELLO_LOCAL
#endif // HELLO_SHARED

#endif // HELLO_CONFIG_H
