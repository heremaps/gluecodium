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

public class CollectionOf<T> : Collection, ExpressibleByArrayLiteral {

    private var elements: Array<T> = []

    init() {
        self.startIndex = 0
        self.endIndex = 0
    }

    public init(_ elements: Array<T>) {
        self.elements = elements
        self.startIndex = 0
        self.endIndex = elements.count
    }

    public func index(after i: Int) -> Int {
        return i+1
    }

    public subscript(position: Int) -> T {
        return elements[position]
    }

    public var startIndex: Int
    public var endIndex: Int

    public typealias Element = T
    public typealias Index = Int

    required public convenience init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension CollectionOf: CustomDebugStringConvertible {
    public var debugDescription: String {
        return self.compactMap{String(describing: $0)}.joined(separator:" ")
    }
}

extension CollectionOf: Equatable where T: Equatable  {
    public static func == (lhs: CollectionOf<T>, rhs: CollectionOf<T>) -> Bool {
        return lhs.elements == rhs.elements
    }
}
