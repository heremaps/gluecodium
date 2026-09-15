# Gluecodium Calculator — React Native Example

Demonstrates [Gluecodium](../../../README.md) code generation for **React Native Pure C++ TurboModules**.

From a single [LIME IDL](../lime/Calculator.lime) definition, Gluecodium generates:

| Output | Location | Purpose |
|--------|----------|---------|
| TurboModule Spec | `typescript/specs/NativeCalculatorModule.ts` | Input for RN Codegen |
| Idiomatic TS Wrapper | `typescript/wrapper/` | **The app-facing API** — typed classes the app imports |
| Shared C++ Module | `react-native/NativeCalculatorModule.h/.cpp` | Cross-platform JSI implementation |
| C++ Interface | `cpp/include/` | Generated C++ headers |
| C++ Stub | `cpp/src/` | Generated C++ implementation |

> `App.tsx` imports **only** the idiomatic wrapper (`./typescript/wrapper`) — it never touches the
> raw TurboModule spec. The wrapper marshals to the Pure C++ TurboModule underneath.

## Prerequisites

- **Node.js** 22+ ([nodejs.org](https://nodejs.org))
- **Java JDK** 17+ (for Android builds)
- **Android SDK** with `ANDROID_HOME` set (for Android)
- **Xcode** 16+ with Command Line Tools (for iOS, macOS only)
- **Android NDK** 27+ (installed via SDK Manager, for C++ compilation)
- **CocoaPods** (`gem install cocoapods`) (for iOS)

Run `./reactnative-ops.sh doctor` to check your environment.

## Quick Start

```bash
# 1. Check prerequisites
./reactnative-ops.sh doctor

# 2. Create the React Native project (one-time)
./reactnative-ops.sh init

# 3. Generate + build + run on Android
./reactnative-ops.sh run --android

# Or for iOS (macOS only):
./reactnative-ops.sh run --ios
```

## Commands

| Command | Description |
|---------|-------------|
| `doctor` | Check prerequisites and environment |
| `init` | Create React Native project and apply all customizations |
| `generate` | Run Gluecodium to generate TypeScript + C++ from LIME IDL |
| `build --android` | Build Android APK (debug) |
| `build --ios` | Build iOS app (simulator) |
| `run --android` | Full pipeline: generate → build → launch (Android) |
| `run --ios` | Full pipeline: generate → build → launch (iOS) |
| `clean` | Remove generated code (typescript/, react-native/, cpp/) |
| `nuke` | Remove everything (full reset) |

## Architecture

```
Calculator.lime (LIME IDL)
        ↓  [Gluecodium generate]
┌─────────────────────────────────────────────┐
│  typescript/specs/NativeCalculatorModule.ts  │ → Input for RN Codegen
│  typescript/wrapper/...                       │ → Idiomatic TS API (app imports this)
│  react-native/NativeCalculatorModule.h/cpp   │ → Pure C++ JSI module
│  cpp/include/... + cpp/src/...                │ → C++ interface + stub
└─────────────────────────────────────────────┘
        ↓  [React Native Build]
┌─────────────────────────────────────────────┐
│  RN Codegen reads typescript/specs/          │
│    → Generates AppSpecsJSI.h                 │
│  CMake compiles react-native/ + cpp/         │
│    → Links into native app                   │
│  App.tsx imports typescript/wrapper/         │
│    → calls new Calculator().summarize(…)     │
└─────────────────────────────────────────────┘
```

### Idiomatic wrapper over a Pure C++ TurboModule

This example uses the [official Pure C++ TurboModule](https://reactnative.dev/docs/the-new-architecture/pure-cxx-modules) approach from React Native 0.85+. The C++ implementation runs directly in the JSI runtime — no Java/Objective-C bridge needed, resulting in ~50% faster native calls.

Application code (`App.tsx`) imports the generated **idiomatic TypeScript wrapper** (`typescript/wrapper/`), not the raw TurboModule spec. The wrapper turns the flat spec into ergonomic TypeScript:

- `new Calculator()` instead of a module singleton;
- `await calculator.subtract(10, 3)` — a trailing lambda callback is surfaced as a `Promise`;
- `calculator.divide(new CalculatorDivideArguments(10, 3))` returning a typed `CalculatorDivideResult`;
- typed errors (`LibraryError`) and optional parameters/returns (`max(first?, second?)`).

## Running on Device / Emulator

### Android
- Start an emulator: `emulator -avd <name>` (or connect a device via USB with developer mode enabled)
- Run: `./reactnative-ops.sh run --android`
- The script starts Metro in the foreground. Press **Ctrl+C** to stop.

### iOS (macOS only)
- The script boots a simulator automatically if none is running.
- Run: `./reactnative-ops.sh run --ios`

## Calculator Methods

The LIME IDL defines 6 method patterns, each exercised through the idiomatic wrapper in `App.tsx`:

| # | Wrapper call | Pattern |
|---|--------------|---------|
| 1 | `calculator.summarize(5, 3)` | Primitives + typed exception (`LibraryError`) |
| 2 | `await calculator.subtract(10, 3)` | Lambda callback surfaced as a `Promise` |
| 3 | `calculator.multiply(4, 5, { onResult, onError })` | Interface callback |
| 4 | `calculator.divide(new CalculatorDivideArguments(10, 3))` | Struct in → typed struct out |
| 5 | `calculator.min(5, 3)` | Interface return type |
| 6 | `calculator.max(undefined, 3)` | Optional parameters + optional return |

## Generated Directories

| Directory | Purpose | Source |
|-----------|---------|--------|
| `typescript/specs/` | TurboModule specs (RN Codegen input) | `reactnative-ops.sh generate` |
| `typescript/wrapper/` | Idiomatic TypeScript API the app imports | `reactnative-ops.sh generate` |
| `react-native/` | Shared C++ TurboModule (JSI) | `reactnative-ops.sh generate` |
| `cpp/` | C++ interface + implementation stub | `reactnative-ops.sh generate` |
| `native-impl/` | Copy of hand-written C++ implementation | `reactnative-ops.sh generate` |
| `ios/` | iOS native integration (provider, Podfile) | `reactnative-ops.sh init` |
| `android/` | Android gradle + NDK setup | `reactnative-ops.sh init` |

> **Note:** `generate` must be run before building. `App.tsx` imports `./typescript/wrapper`, which
> (with the `typescript/specs/` it depends on) only exists after generation.

## Troubleshooting

### Build fails with "AppSpecsJSI.h not found"
RN Codegen hasn't run. Ensure `specs/NativeCalculatorModule.ts` exists and `codegenConfig` is set in `package.json`.

### "Module not found" at runtime
Check that `OnLoad.cpp` registers the module (look for `NativeCalculatorModule::kModuleName`).

### CMake include path errors
Verify the relative paths in `android/app/src/main/jni/CMakeLists.txt` match the directory structure.

### iOS pod install fails
Run `cd ios && bundle exec pod install --repo-update`.
