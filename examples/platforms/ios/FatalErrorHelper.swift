// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

import Foundation

public struct FatalErrorHelper {

    static var fatalErrorHandler: (String, StaticString, UInt) -> Never = defaultFatalErrorHandler

    private static let defaultFatalErrorHandler = { Swift.fatalError($0, file: $1, line: $2) }

    public static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Never) {
        fatalErrorHandler = closure
    }

    public static func restoreFatalError() {
        fatalErrorHandler = defaultFatalErrorHandler
    }
}

func fatalError(_ message: @autoclosure () -> String = "",
                file: StaticString = #file,
                line: UInt = #line) -> Never {
    FatalErrorHelper.fatalErrorHandler(message(), file, line)
}
