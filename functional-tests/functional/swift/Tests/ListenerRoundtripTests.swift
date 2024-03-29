// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

import XCTest
import functional

class ListenerRoundtripTests: XCTestCase {

    var providerImplWasCalled = false
    var route: Route?
    var routeImpl: RouteImpl?

    class RouteImpl: Route {
    }

    class RouteProviderImpl: RouteProvider {

        var parent: ListenerRoundtripTests

        init(_ parent: ListenerRoundtripTests) {
            self.parent = parent
        }

        public func setRoute(route: Route) {
            parent.providerImplWasCalled = true
            parent.route = route
            parent.routeImpl = route as? RouteImpl
        }
    }

    func testListenerRoundTripPreservesType() {
        Nlp.setRoute(routeProvider: RouteProviderImpl(self), route: RouteImpl())

        XCTAssertTrue(providerImplWasCalled)
        XCTAssertNotNil(route)
        XCTAssertNotNil(routeImpl)
    }

    func testOriginalSwiftObjectIsReturnedBack() {
        let route = RouteImpl()
        RouteStorage.route = route
        XCTAssertTrue(RouteStorage.route === route)
    }

    func testChildClassRoundTrip() {
        let listener = SomeIndicator()

        XCTAssertTrue(RealBase.compareListenerToInitial(listener))
    }

    func testConvolutedRoundTrip() {
        let listener = SomeIndicator()
        let base = RealBase()

        base.addLifecycleListener(listener)

        XCTAssertTrue(listener.isWeakPtrAlive())
    }

    static var allTests = [
        ("testListenerRoundTripPreservesType", testListenerRoundTripPreservesType),
        ("testOriginalSwiftObjectIsReturnedBack", testOriginalSwiftObjectIsReturnedBack),
        ("testChildClassRoundTrip", testChildClassRoundTrip),
        ("testConvolutedRoundTrip", testConvolutedRoundTrip)
    ]
}
