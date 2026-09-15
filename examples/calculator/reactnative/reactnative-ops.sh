#!/usr/bin/env bash
# Copyright (C) 2016-2026 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# License-Filename: LICENSE

# =============================================================================
# reactnative-ops.sh — React Native Calculator Example Automation
# =============================================================================
#
# Single entry point for the Gluecodium React Native Calculator example.
# Creates, generates, builds, and runs the complete RN app from scratch.
#
# Usage:
#   ./reactnative-ops.sh <command> [options]
#
# Commands:
#   init                  Create React Native project and apply all customizations
#   generate              Run Gluecodium to generate TypeScript + C++ from LIME IDL
#   build --android|--ios Build for the specified platform
#   run --android|--ios   Full pipeline: generate → build → launch
#   clean                 Remove generated Gluecodium output (typescript/, react-native/, etc.)
#   nuke                  Remove everything (RN project, node_modules, generated code)
#   doctor                Check prerequisites and environment
#   help                  Show this help message
#
# Examples:
#   ./reactnative-ops.sh doctor            # Check environment
#   ./reactnative-ops.sh init              # Create RN project from scratch
#   ./reactnative-ops.sh generate          # Generate from LIME IDL
#   ./reactnative-ops.sh run --android     # Full pipeline for Android
#   ./reactnative-ops.sh run --ios         # Full pipeline for iOS
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
PROJECT_DIR="$SCRIPT_DIR"
LIME_DIR="$SCRIPT_DIR/../lime"
CPP_IMPL_DIR="$SCRIPT_DIR/../cpp"
GLUECODIUM_BIN="$REPO_ROOT/generate"
RN_VERSION="${RN_VERSION:-0.85.1}"
RN_APP_NAME="Calculator"
ANDROID_MIN_SDK=24

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ---------------------------------------------------------------------------
# Utility functions
# ---------------------------------------------------------------------------
log_info()    { echo -e "${BLUE}ℹ${NC}  $*"; }
log_success() { echo -e "${GREEN}✓${NC}  $*"; }
log_warn()    { echo -e "${YELLOW}⚠${NC}  $*"; }
log_error()   { echo -e "${RED}✗${NC}  $*" >&2; }
log_step()    { echo -e "\n${BLUE}▸${NC} ${BLUE}$*${NC}"; }

die() { log_error "$@"; exit 1; }

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || die "'$1' is required but not found. $2"
}

require_init() {
    [[ -f "$PROJECT_DIR/package.json" ]] || die "Project not initialized. Run: ./reactnative-ops.sh init"
}

# ---------------------------------------------------------------------------
# doctor — Check prerequisites
# ---------------------------------------------------------------------------
cmd_doctor() {
    log_step "Checking prerequisites..."
    local ok=true

    for cmd in node npm npx java; do
        if command -v "$cmd" >/dev/null 2>&1; then
            log_success "$cmd: $(command -v "$cmd") ($($cmd --version 2>/dev/null | head -1))"
        else
            log_error "$cmd: NOT FOUND"
            ok=false
        fi
    done

    # Check Node.js version (need 22+)
    if command -v node >/dev/null 2>&1; then
        local node_major
        node_major=$(node -e "console.log(process.versions.node.split('.')[0])")
        if (( node_major >= 22 )); then
            log_success "Node.js version $node_major (>= 22 required)"
        else
            log_error "Node.js version $node_major (>= 22 required)"
            ok=false
        fi
    fi

    # Check Android SDK
    if [[ -n "${ANDROID_HOME:-}" ]] || [[ -n "${ANDROID_SDK_ROOT:-}" ]]; then
        log_success "Android SDK: ${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
    else
        log_warn "Android SDK: ANDROID_HOME not set (needed for Android builds)"
    fi

    # Check Xcode (macOS only)
    if [[ "$(uname)" == "Darwin" ]]; then
        if command -v xcodebuild >/dev/null 2>&1; then
            log_success "Xcode: $(xcodebuild -version 2>/dev/null | head -1)"
        else
            log_warn "Xcode: not found (needed for iOS builds)"
        fi
        if command -v pod >/dev/null 2>&1; then
            log_success "CocoaPods: $(pod --version 2>/dev/null)"
        else
            log_warn "CocoaPods: not found (needed for iOS builds)"
        fi
    fi

    # Check Gluecodium
    if [[ -x "$GLUECODIUM_BIN" ]]; then
        log_success "Gluecodium: $GLUECODIUM_BIN"
    else
        log_warn "Gluecodium binary not found at $GLUECODIUM_BIN"
        log_info "Build it with: cd $REPO_ROOT && ./gradlew installDist"
    fi

    # Check LIME source
    if [[ -f "$LIME_DIR/Calculator.lime" ]]; then
        log_success "LIME source: $LIME_DIR/Calculator.lime"
    else
        log_error "LIME source not found: $LIME_DIR/Calculator.lime"
        ok=false
    fi

    echo ""
    if $ok; then
        log_success "All required prerequisites are met."
    else
        log_error "Some prerequisites are missing. See above."
        return 1
    fi
}

# ---------------------------------------------------------------------------
# init — Create React Native project and apply customizations
# ---------------------------------------------------------------------------
cmd_init() {
    log_step "Initializing React Native project ($RN_APP_NAME v$RN_VERSION)..."

    if [[ -f "$PROJECT_DIR/package.json" ]]; then
        log_warn "Project already initialized. Use 'nuke' first to start fresh."
        return 0
    fi

    require_cmd npx "Install Node.js 22+ from https://nodejs.org"
    require_cmd node "Install Node.js 22+ from https://nodejs.org"

    # Create RN project in a temp dir, then move contents
    local tmp_dir
    tmp_dir=$(mktemp -d)
    log_info "Creating React Native project..."
    npx --yes @react-native-community/cli@latest init "$RN_APP_NAME" \
        --version "$RN_VERSION" \
        --directory "$tmp_dir/$RN_APP_NAME" \
        --skip-git-init \
        --skip-install

    # Move project contents to our directory (preserve our files)
    log_info "Setting up project structure..."
    shopt -s dotglob
    for item in "$tmp_dir/$RN_APP_NAME"/*; do
        local basename
        basename=$(basename "$item")
        # Skip files we manage ourselves
        if [[ "$basename" == ".gitignore" ]] || [[ "$basename" == "README.md" ]]; then
            continue
        fi
        mv "$item" "$PROJECT_DIR/"
    done
    shopt -u dotglob
    rm -rf "$tmp_dir"

    # Apply all customizations
    _apply_codegen_config
    _create_app_tsx
    _setup_android_native
    _setup_ios_native

    # Install npm dependencies
    log_info "Installing npm dependencies..."
    cd "$PROJECT_DIR"
    if ! npm install; then
        die "npm install failed. Check your Node.js version and internet connection."
    fi

    log_success "React Native project initialized successfully!"
    echo ""
    log_info "Next steps:"
    log_info "  ./reactnative-ops.sh generate        # Generate code from LIME IDL"
    log_info "  ./reactnative-ops.sh run --android    # Build and run on Android"
    log_info "  ./reactnative-ops.sh run --ios        # Build and run on iOS"
}

_apply_codegen_config() {
    log_info "Configuring RN Codegen (package.json)..."
    cd "$PROJECT_DIR"
    node -e "
const pkg = require('./package.json');
pkg.codegenConfig = {
  name: 'AppSpecs',
  type: 'modules',
  jsSrcsDir: 'typescript/specs',
  android: {
    javaPackageName: 'com.calculator.specs'
  },
  ios: {
    modulesProvider: {
      NativeCalculatorModule: 'NativeCalculatorModuleProvider'
    }
  }
};
require('fs').writeFileSync('./package.json', JSON.stringify(pkg, null, 2) + '\n');
"
}

_create_app_tsx() {
    log_info "Creating App.tsx..."
    cat > "$PROJECT_DIR/App.tsx" << 'APPTSX'
/**
 * Gluecodium Calculator — React Native Example
 *
 * Uses the generated idiomatic TypeScript wrapper (`./typescript/wrapper`), NOT the raw
 * TurboModule spec. Application code instantiates `new Calculator()` and calls typed methods;
 * the wrapper marshals to the Pure C++ TurboModule underneath.
 *
 * Demonstrates all Calculator methods:
 *   1. summarize  — primitives + typed exception (LibraryError)
 *   2. subtract   — lambda callback surfaced as a Promise
 *   3. multiply   — interface callback ({ onResult, onError })
 *   4. divide     — struct in / struct out (typed wrapper classes)
 *   5. min        — interface return type
 *   6. max        — optional parameters and optional return
 */
import React, {useState} from 'react';
import {
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import {
  Calculator,
  CalculatorDivideArguments,
  LibraryError,
} from './typescript/wrapper';

type TestResult = {label: string; value: string; ok: boolean};

// One shared idiomatic wrapper instance. `new Calculator()` calls the generated
// TurboModule factory under the hood; application code never touches the raw spec.
const calculator = new Calculator();

function App(): React.JSX.Element {
  const [results, setResults] = useState<TestResult[]>([]);

  const addResult = (label: string, value: string, ok = true) => {
    setResults(prev => [{label, value, ok}, ...prev]);
  };

  // 1. summarize — a plain method that throws a typed LibraryError on overflow.
  const testSummarize = () => {
    try {
      const result = calculator.summarize(5, 3);
      addResult('summarize(5, 3)', `${result}`, result === 8);
    } catch (error) {
      addResult('summarize(5, 3)', `Error: ${error}`, false);
    }
  };

  const testSummarizeOverflow = () => {
    try {
      const result = calculator.summarize(2000000000, 2000000000);
      addResult('summarize(overflow)', `${result} (expected error)`, false);
    } catch (error) {
      const isLibraryError = error instanceof LibraryError;
      addResult('summarize(overflow)', 'Caught expected error ✓', isLibraryError);
    }
  };

  // 2. subtract — the trailing lambda callback is surfaced as a Promise by the wrapper.
  const testSubtract = async () => {
    try {
      const result = await calculator.subtract(10, 3);
      addResult('subtract(10, 3)', `${result}`, result === 7);
    } catch (error) {
      addResult('subtract(10, 3)', `Error: ${error}`, false);
    }
  };

  // 3. multiply — an interface callback ({ onResult, onError }) implemented in JS.
  const testMultiply = () => {
    calculator.multiply(4, 5, {
      onResult: (result: number) => {
        addResult('multiply(4, 5)', `${result}`, result === 20);
      },
      onError: (error: number) => {
        addResult('multiply(4, 5)', `Error: ${error}`, false);
      },
    });
  };

  // 4. divide — a struct in, a typed struct out (result/error are `number | undefined`).
  const testDivide = () => {
    const result = calculator.divide(new CalculatorDivideArguments(10, 3));
    addResult(
      'divide(10, 3)',
      `result=${result.result}`,
      result.error === undefined && Math.abs((result.result ?? 0) - 3.333) < 0.01,
    );
  };

  const testDivideByZero = () => {
    const result = calculator.divide(new CalculatorDivideArguments(10, 0));
    addResult(
      'divide(10, 0)',
      `error=${result.error}`,
      result.error !== undefined && result.result === undefined,
    );
  };

  // 5. min — returns an interface implemented in native code. The wrapper returns the
  //    native handle; a returned-object interface has no JS-callable accessor generated
  //    (its methods are invoked natively), so here we assert the handle was produced.
  const testMin = () => {
    const retriever = calculator.min(5, 3);
    const ok = typeof retriever === 'string' && retriever.length > 0;
    addResult('min(5, 3)', ok ? 'native handle returned ✓' : 'no handle', ok);
  };

  // 6. max — optional parameters and an optional return, surfaced as `number | undefined`.
  const testMax = () => {
    const result = calculator.max(5, 3);
    addResult('max(5, 3)', `${result}`, result === 5);
  };

  const testMaxNullFirst = () => {
    const result = calculator.max(undefined, 3);
    addResult('max(undefined, 3)', `${result}`, result === 3);
  };

  const testMaxBothNull = () => {
    const result = calculator.max(undefined, undefined);
    addResult('max(undefined, undefined)', `${result}`, result === undefined);
  };

  const runAllTests = () => {
    setResults([]);
    // Run in reverse order so the first test appears at the top of the results.
    testMaxBothNull();
    testMaxNullFirst();
    testMax();
    testMin();
    testDivideByZero();
    testDivide();
    testMultiply();
    testSubtract();
    testSummarizeOverflow();
    testSummarize();
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>🧮 Gluecodium Calculator</Text>
        <Text style={styles.subtitle}>
          Idiomatic TypeScript wrapper over a Pure C++ TurboModule
        </Text>
      </View>

      <View style={styles.buttonRow}>
        <TouchableOpacity style={styles.runAllButton} onPress={runAllTests}>
          <Text style={styles.runAllText}>Run All Tests</Text>
        </TouchableOpacity>
      </View>

      <View style={styles.buttonGrid}>
        {[
          {label: 'summarize(5, 3)', fn: testSummarize},
          {label: 'summarize(overflow)', fn: testSummarizeOverflow},
          {label: 'subtract(10, 3)', fn: testSubtract},
          {label: 'multiply(4, 5)', fn: testMultiply},
          {label: 'divide(10, 3)', fn: testDivide},
          {label: 'divide(10, 0)', fn: testDivideByZero},
          {label: 'min(5, 3)', fn: testMin},
          {label: 'max(5, 3)', fn: testMax},
          {label: 'max(undefined, 3)', fn: testMaxNullFirst},
          {label: 'max(undefined, undefined)', fn: testMaxBothNull},
        ].map(({label, fn}) => (
          <TouchableOpacity key={label} style={styles.testButton} onPress={fn}>
            <Text style={styles.testButtonText}>{label}</Text>
          </TouchableOpacity>
        ))}
      </View>

      <ScrollView style={styles.results}>
        {results.map((r, i) => (
          <View
            key={`${r.label}-${i}`}
            style={[styles.resultRow, r.ok ? styles.resultOk : styles.resultFail]}>
            <Text style={styles.resultLabel}>{r.label}</Text>
            <Text style={styles.resultValue}>
              {r.ok ? '✓' : '✗'} {r.value}
            </Text>
          </View>
        ))}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {flex: 1, backgroundColor: '#f5f5f5'},
  header: {padding: 20, alignItems: 'center', backgroundColor: '#fff'},
  title: {fontSize: 22, fontWeight: 'bold', color: '#333'},
  subtitle: {fontSize: 13, color: '#888', marginTop: 4},
  buttonRow: {padding: 12},
  runAllButton: {
    backgroundColor: '#007AFF',
    padding: 14,
    borderRadius: 10,
    alignItems: 'center',
  },
  runAllText: {color: '#fff', fontSize: 16, fontWeight: '600'},
  buttonGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    paddingHorizontal: 8,
    gap: 6,
  },
  testButton: {
    backgroundColor: '#e8e8e8',
    paddingVertical: 8,
    paddingHorizontal: 12,
    borderRadius: 6,
  },
  testButtonText: {fontSize: 12, color: '#333'},
  results: {flex: 1, marginTop: 12, paddingHorizontal: 12},
  resultRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    padding: 10,
    marginBottom: 4,
    borderRadius: 6,
  },
  resultOk: {backgroundColor: '#e6f9e6'},
  resultFail: {backgroundColor: '#fde8e8'},
  resultLabel: {fontSize: 13, fontWeight: '500', color: '#333'},
  resultValue: {fontSize: 13, color: '#555'},
});

export default App;
APPTSX
}

_setup_android_native() {
    log_info "Setting up Android native integration..."
    local jni_dir="$PROJECT_DIR/android/app/src/main/jni"
    mkdir -p "$jni_dir"

    # Create CMakeLists.txt for the shared C++ module
    cat > "$jni_dir/CMakeLists.txt" << 'CMAKE'
cmake_minimum_required(VERSION 3.13)

# Define the library name here.
project(appmodules)

# This file includes all the necessary to let you build your React Native application
include(${REACT_ANDROID_DIR}/cmake-utils/ReactNative-application.cmake)

# --- Gluecodium generated shared C++ TurboModule ---
target_sources(${CMAKE_PROJECT_NAME} PRIVATE
  ../../../../../react-native/NativeCalculatorModule.cpp
)
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC
  ../../../../../react-native
)

# --- Gluecodium generated C++ interface (from cpp generator) ---
file(GLOB_RECURSE GLUECODIUM_CPP_SOURCES "../../../../../cpp/src/*.cpp")
target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${GLUECODIUM_CPP_SOURCES})
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC
  ../../../../../cpp/include
)

# --- User-provided C++ implementation ---
target_sources(${CMAKE_PROJECT_NAME} PRIVATE
  ../../../../../native-impl/CalculatorImpl.cpp
)
CMAKE

    # Download OnLoad.cpp from the official React Native repo and patch it
    log_info "Downloading OnLoad.cpp template from React Native v$RN_VERSION..."
    local onload_url="https://raw.githubusercontent.com/facebook/react-native/v${RN_VERSION}/packages/react-native/ReactAndroid/cmake-utils/default-app-setup/OnLoad.cpp"

    if curl -fsSL -o "$jni_dir/OnLoad.cpp" "$onload_url" 2>/dev/null; then
        _patch_onload_cpp "$jni_dir/OnLoad.cpp"
        log_success "OnLoad.cpp downloaded and patched."
    else
        log_warn "Could not download OnLoad.cpp — creating from template."
        _create_onload_cpp_template "$jni_dir/OnLoad.cpp"
    fi

    # Add externalNativeBuild to app/build.gradle
    _patch_android_build_gradle
}

_patch_onload_cpp() {
    local file="$1"

    # Add include before 'namespace facebook::react {'
    if ! grep -q 'NativeCalculatorModule.h' "$file"; then
        sed -i.bak '/^namespace facebook::react/i\
// Gluecodium: Generated TurboModule header\
#include "NativeCalculatorModule.h"\

' "$file"
        rm -f "$file.bak"
    fi

    # Add module registration in cxxModuleProvider function
    if ! grep -q 'NativeCalculatorModule::kModuleName' "$file"; then
        sed -i.bak '/return autolinking_cxxModuleProvider(name, jsInvoker);/i\
  // Gluecodium: Register Calculator TurboModule\
  if (name == facebook::react::NativeCalculatorModule::kModuleName) {\
    return std::make_shared<facebook::react::NativeCalculatorModule>(jsInvoker);\
  }\

' "$file"
        rm -f "$file.bak"
    fi
}

_create_onload_cpp_template() {
    cat > "$1" << 'ONLOAD'
#include <DefaultComponentsRegistry.h>
#include <DefaultTurboModuleManagerDelegate.h>
#include <autolinking.h>
#include <fbjni/fbjni.h>
#include <react/renderer/componentregistry/ComponentDescriptorProviderRegistry.h>
#include <rncore.h>

// Gluecodium: Pure C++ TurboModule
#include "NativeCalculatorModule.h"

using namespace facebook::react;

std::shared_ptr<TurboModule> cxxModuleProvider(
    const std::string& name,
    const std::shared_ptr<CallInvoker>& jsInvoker) {
  // Gluecodium: Register Calculator TurboModule
  if (name == facebook::react::NativeCalculatorModule::kModuleName) {
    return std::make_shared<facebook::react::NativeCalculatorModule>(jsInvoker);
  }
  return autolinking_cxxModuleProvider(name, jsInvoker);
}

std::shared_ptr<ComponentDescriptorProviderRegistry const>
sharedProviderRegistry() {
  auto providerRegistry = CoreComponentsRegistry::sharedProviderRegistry();
  providerRegistry->add(
      concreteComponentDescriptorProvider<autolinking_ComponentDescriptorProviders>());
  return providerRegistry;
}

jni::local_ref<DefaultTurboModuleManagerDelegate::jhybriddata>
DefaultTurboModuleManagerDelegate_cxxModuleProvider(
    const std::string &name,
    const std::shared_ptr<CallInvoker> &jsInvoker) {
  return makeCxxInstance(cxxModuleProvider, name, jsInvoker);
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *) {
  return facebook::jni::initialize(vm, [] {
    DefaultTurboModuleManagerDelegate::registerNatives();
    DefaultComponentsRegistry::registerNatives();
  });
}
ONLOAD
}

_patch_android_build_gradle() {
    local gradle_file="$PROJECT_DIR/android/app/build.gradle"
    if [[ ! -f "$gradle_file" ]]; then
        log_warn "android/app/build.gradle not found — skipping CMake configuration."
        return
    fi

    # Add externalNativeBuild block if not present
    if ! grep -q 'externalNativeBuild' "$gradle_file"; then
        # Insert before the closing brace of the android block
        # Find the line with 'buildTypes {' and add externalNativeBuild after the buildTypes block
        sed -i.bak '/^android {/,/^}/ {
            /namespace/a\
\    externalNativeBuild {\
        cmake {\
            path "src/main/jni/CMakeLists.txt"\
        }\
    }
        }' "$gradle_file"
        rm -f "$gradle_file.bak"
        log_success "Added externalNativeBuild to build.gradle"
    fi
}

_setup_ios_native() {
    log_info "Setting up iOS native integration..."
    local ios_dir="$PROJECT_DIR/ios"
    mkdir -p "$ios_dir"

    # Create NativeCalculatorModuleProvider.h
    cat > "$ios_dir/NativeCalculatorModuleProvider.h" << 'IOSH'
#import <Foundation/Foundation.h>
#import <ReactCommon/RCTTurboModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeCalculatorModuleProvider : NSObject <RCTModuleProvider>

@end

NS_ASSUME_NONNULL_END
IOSH

    # Create NativeCalculatorModuleProvider.mm
    cat > "$ios_dir/NativeCalculatorModuleProvider.mm" << 'IOSMM'
#import "NativeCalculatorModuleProvider.h"
#import <ReactCommon/CallInvoker.h>
#import <ReactCommon/TurboModule.h>
#import "NativeCalculatorModule.h"

@implementation NativeCalculatorModuleProvider

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeCalculatorModule>(params.jsInvoker);
}

@end
IOSMM

    log_success "iOS module provider created."

    # Create CalculatorNativeModule.podspec at project root
    cat > "$PROJECT_DIR/CalculatorNativeModule.podspec" << 'PODSPEC'
Pod::Spec.new do |s|
  s.name         = "CalculatorNativeModule"
  s.version      = "1.0.0"
  s.summary      = "Gluecodium Calculator C++ TurboModule for React Native"
  s.homepage     = "https://github.com/heremaps/gluecodium"
  s.license      = { :type => "Apache-2.0" }
  s.author       = "HERE Technologies"
  s.source       = { :path => '.' }
  s.platforms    = { :ios => '15.1' }

  # Only compile source files. Headers are found via HEADER_SEARCH_PATHS
  # to avoid CocoaPods flattening them (e.g., Locale.h vs locale.h conflict
  # on case-insensitive macOS filesystem).
  s.source_files = [
    'react-native/**/*.cpp',
    'cpp/src/**/*.cpp',
    'ios/NativeCalculatorModuleProvider.{h,mm}',
    'native-impl/**/*.cpp'
  ]

  # Preserve headers so CocoaPods knows about them but doesn't copy/flatten
  s.preserve_paths = [
    'react-native/**/*.h',
    'cpp/include/**/*.{h,hpp}',
    'native-impl/**/*.h'
  ]

  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/react-native" "${PODS_TARGET_SRCROOT}/cpp/include" "${PODS_TARGET_SRCROOT}/native-impl"',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++20'
  }

  s.dependency 'ReactCodegen'
  s.dependency 'React-callinvoker'
end
PODSPEC
    log_success "CalculatorNativeModule.podspec created."

    # Patch Podfile to reference the local pod
    local podfile="$ios_dir/Podfile"
    if [[ -f "$podfile" ]] && ! grep -q 'CalculatorNativeModule' "$podfile"; then
        sed -i.bak "/use_react_native/,/)/{ /)/a\\
\\
  # Gluecodium: Compile generated C++ TurboModule + native implementation\\
  pod 'CalculatorNativeModule', :path => '../'
        }" "$podfile"
        rm -f "$podfile.bak"
        log_success "Podfile patched with CalculatorNativeModule pod."
    fi
}

# ---------------------------------------------------------------------------
# generate — Run Gluecodium generators
# ---------------------------------------------------------------------------
cmd_generate() {
    log_step "Generating TypeScript + C++ from LIME IDL..."

    if [[ ! -x "$GLUECODIUM_BIN" ]]; then
        log_info "Gluecodium not built yet. Building..."
        cd "$REPO_ROOT"
        if ! ./gradlew installDist --quiet; then
            die "Failed to build Gluecodium. Run './gradlew installDist' to see errors."
        fi
    fi

    cd "$PROJECT_DIR"

    "$GLUECODIUM_BIN" \
        -input "$LIME_DIR" \
        -output "$PROJECT_DIR" \
        -generators cpp,typescript,react-native \
        -tag react-native \
        -intnamespace gluecodium

    # Copy hand-written C++ implementation into pod-accessible directory
    mkdir -p "$PROJECT_DIR/native-impl"
    cp -f "$REPO_ROOT/examples/calculator/cpp/CalculatorImpl.cpp" "$PROJECT_DIR/native-impl/"
    log_info "Copied CalculatorImpl.cpp → native-impl/"

    log_success "Code generation complete."
    echo ""

    # Verify generated files
    local expected_files=(
        "typescript/specs/NativeCalculatorModule.ts"
        "react-native/NativeCalculatorModule.h"
        "react-native/NativeCalculatorModule.cpp"
    )
    local all_ok=true
    for f in "${expected_files[@]}"; do
        if [[ -f "$PROJECT_DIR/$f" ]]; then
            log_success "  $f"
        else
            log_error "  $f — MISSING"
            all_ok=false
        fi
    done

    if ! $all_ok; then
        die "Some expected files were not generated."
    fi
}

# ---------------------------------------------------------------------------
# build — Build for platform
# ---------------------------------------------------------------------------
cmd_build() {
    local platform="${1:-}"
    [[ -z "$platform" ]] && die "Usage: ./reactnative-ops.sh build --android|--ios"

    require_init

    case "$platform" in
        --android) _build_android ;;
        --ios)     _build_ios ;;
        *)         die "Unknown platform: $platform. Use --android or --ios" ;;
    esac
}

_build_android() {
    log_step "Building for Android..."
    require_cmd java "Install JDK 17+ for Android builds"

    cd "$PROJECT_DIR/android"
    ./gradlew assembleDebug

    log_success "Android build complete!"
    local apk
    apk=$(find . -name "*.apk" -path "*/debug/*" | head -1)
    if [[ -n "$apk" ]]; then
        log_info "APK: $apk"
    fi
}

_build_ios() {
    log_step "Building for iOS..."
    [[ "$(uname)" == "Darwin" ]] || die "iOS builds require macOS."
    require_cmd xcodebuild "Install Xcode from the App Store"

    cd "$PROJECT_DIR/ios"

    # Install/update pods (always run to pick up generated source changes)
    log_info "Installing CocoaPods dependencies..."
    bundle install --quiet 2>/dev/null || true
    if ! bundle exec pod install; then
        die "pod install failed. Run 'cd ios && bundle exec pod install' to debug."
    fi

    # Build for simulator
    xcodebuild \
        -workspace "$RN_APP_NAME.xcworkspace" \
        -scheme "$RN_APP_NAME" \
        -sdk iphonesimulator \
        -configuration Debug \
        -quiet \
        build

    log_success "iOS build complete!"
}

# ---------------------------------------------------------------------------
# run — Full pipeline: generate → build → launch
# ---------------------------------------------------------------------------
cmd_run() {
    local platform="${1:-}"
    [[ -z "$platform" ]] && die "Usage: ./reactnative-ops.sh run --android|--ios"

    require_init
    cmd_generate
    cmd_build "$platform"

    case "$platform" in
        --android) _run_android ;;
        --ios)     _run_ios ;;
    esac
}

_run_android() {
    log_step "Launching on Android..."
    cd "$PROJECT_DIR"

    # Verify device/emulator is available
    if command -v adb >/dev/null 2>&1; then
        if ! adb devices 2>/dev/null | grep -qE "device$|emulator"; then
            die "No Android device or emulator found. Start an emulator first: emulator -avd <name>"
        fi
    else
        die "'adb' not found. Ensure Android SDK platform-tools is in your PATH."
    fi

    # Verify APK exists BEFORE starting Metro
    local apk
    apk=$(find android -name "*.apk" -path "*/debug/*" | head -1)
    if [[ -z "$apk" ]]; then
        die "APK not found. Run 'build --android' first."
    fi

    # Start Metro in background with cleanup trap
    log_info "Starting Metro bundler..."
    npx react-native start --reset-cache &
    local metro_pid=$!
    trap 'kill "$metro_pid" 2>/dev/null || true; trap - EXIT INT TERM' EXIT INT TERM

    sleep 5

    # Install and launch APK
    adb install -r "$apk"
    adb shell am start -n "com.calculator/.MainActivity"
    log_success "App launched on Android device/emulator."

    log_info "Metro bundler running (PID: $metro_pid). Press Ctrl+C to stop."
    wait "$metro_pid" || true
    trap - EXIT INT TERM
}

_run_ios() {
    log_step "Launching on iOS Simulator..."
    [[ "$(uname)" == "Darwin" ]] || die "iOS requires macOS."

    # Boot a simulator if none is running
    if ! xcrun simctl list devices 2>/dev/null | grep -q "Booted"; then
        log_info "No simulator running. Booting default iPhone simulator..."
        local sim_id
        sim_id=$(xcrun simctl list devices available 2>/dev/null | grep "iPhone" | tail -1 | sed 's/.*(\([-A-F0-9]*\)).*/\1/')
        if [[ -n "$sim_id" ]]; then
            xcrun simctl boot "$sim_id" 2>/dev/null || true
            log_success "Simulator booted."
        else
            log_warn "Could not find an available iPhone simulator."
        fi
    fi

    cd "$PROJECT_DIR"
    npx react-native run-ios
}

# ---------------------------------------------------------------------------
# clean — Remove generated Gluecodium output
# ---------------------------------------------------------------------------
cmd_clean() {
    log_step "Cleaning generated files..."
    cd "$PROJECT_DIR"

    for dir in typescript react-native cpp; do
        if [[ -d "$dir" ]]; then
            rm -rf "$dir"
            log_success "Removed $dir/"
        fi
    done

    log_success "Clean complete."
}

# ---------------------------------------------------------------------------
# nuke — Remove everything and start fresh
# ---------------------------------------------------------------------------
cmd_nuke() {
    log_step "Removing all generated and downloaded files..."
    cd "$PROJECT_DIR"

    # Remove generated code
    cmd_clean

    # Remove RN project files (keep our managed files)
    local keep_files=("reactnative-ops.sh" "README.md" ".gitignore")
    for item in "$PROJECT_DIR"/*; do
        local basename
        basename=$(basename "$item")
        local should_keep=false
        for keep in "${keep_files[@]}"; do
            if [[ "$basename" == "$keep" ]]; then
                should_keep=true
                break
            fi
        done
        if ! $should_keep; then
            rm -rf "$item"
            log_info "Removed $basename"
        fi
    done

    # Remove hidden files from RN init (but not our .gitignore)
    for item in "$PROJECT_DIR"/.*; do
        local basename
        basename=$(basename "$item")
        if [[ "$basename" == "." ]] || [[ "$basename" == ".." ]] || [[ "$basename" == ".gitignore" ]]; then
            continue
        fi
        rm -rf "$item"
    done

    log_success "Nuke complete. Run 'init' to start fresh."
}

# ---------------------------------------------------------------------------
# help
# ---------------------------------------------------------------------------
cmd_help() {
    cat << 'HELP'
┌─────────────────────────────────────────────────────────────┐
│  reactnative-ops.sh — Gluecodium RN Calculator Automation  │
└─────────────────────────────────────────────────────────────┘

COMMANDS:
  doctor                Check prerequisites and environment
  init                  Create React Native project + apply customizations
  generate              Run Gluecodium (LIME IDL → TypeScript + C++ JSI)
  build --android       Build Android APK (debug)
  build --ios           Build iOS app (simulator)
  run --android         Full pipeline: generate → build → launch (Android)
  run --ios             Full pipeline: generate → build → launch (iOS)
  clean                 Remove generated code (typescript/, react-native/, etc.)
  nuke                  Remove everything (full reset)
  help                  Show this help

WORKFLOW:
  1. ./reactnative-ops.sh doctor         # Check environment
  2. ./reactnative-ops.sh init            # One-time setup
  3. ./reactnative-ops.sh run --android   # Build & run

ARCHITECTURE:
  Calculator.lime → [Gluecodium] → typescript/specs/ (TurboModule spec for RN Codegen)
                                 → typescript/       (TS type declarations)
                                 → react-native/     (Pure C++ JSI module)
                                 → cpp/              (C++ interface + stub)

HELP
}

# ---------------------------------------------------------------------------
# Main entry point
# ---------------------------------------------------------------------------
main() {
    local cmd="${1:-help}"
    shift || true

    case "$cmd" in
        doctor)   cmd_doctor ;;
        init)     cmd_init ;;
        generate) cmd_generate ;;
        build)    cmd_build "$@" ;;
        run)      cmd_run "$@" ;;
        clean)    cmd_clean ;;
        nuke)     cmd_nuke ;;
        help|--help|-h) cmd_help ;;
        *)        die "Unknown command: $cmd. Run './reactnative-ops.sh help' for usage." ;;
    esac
}

main "$@"
