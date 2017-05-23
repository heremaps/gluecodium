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

#include "stub/navigation/guidance/GuidanceStub.h"

namespace navigation {

namespace guidance {

namespace internal {

class GuidanceImpl : public GuidanceStub {

    // VoiceOutputStub interface
public:
    NavigationTypes::ErrorCode initVoiceOutput(const VoiceOutputTypes::VoicePackage &voicePackage) override;
    RepeatLastOutputExpected repeatLastOutput() override;

    // GuidanceStub interface
public:
    NavigationTypes::ErrorCode checkForOptimalTtaRoute() override;
    GetAllManeuversExpected getAllManeuvers() override;
    GetAverageSpeedExpected getAverageSpeed() override;
    GetBreakOutCountBeforeManeuverExpected getBreakOutCountBeforeManeuver(const GuidanceTypes::BreakOutManeuver maneuver, const GuidanceTypes::BreakOutType breakType) override;
    GetCountryInfoExpected getCountryInfo() override;
    GetDistanceToNextDecisionPointExpected getDistanceToNextDecisionPoint() override;
    GetDistanceToNextManeuverExpected getDistanceToNextManeuver() override;
    GetElapsedDistanceExpected getElapsedDistance(const GuidanceTypes::RouteScope scope) override;
    GetElapsedTimeExpected getElapsedTime() override;
    GetGuidanceProgressExpected getGuidanceProgress() override;
    GetHeadingToNextManeuverExpected getHeadingToNextManeuver() override;
    GetLastSessionExpected getLastSession() override;
    GetNextManeuverExpected getNextManeuver() override;
    GetRemainingDistanceExpected getRemainingDistance(const GuidanceTypes::RouteScope scope) override;
    GetRemainingManeuversPrimaryExpected getRemainingManeuversPrimary() override;
    GetRemainingManeuversLimitManeuversExpected getRemainingManeuversLimitManeuvers(const uint32_t maxNumberOfRemainingManeuvers) override;
    GetRouteExpected getRoute() override;
    GetTimeToArrivalToManeuverOldExpected getTimeToArrivalToManeuverOld(const routing::RoutingTypes::Maneuver &maneuver) override;
    GetTimeToArrivalToManeuverExpected getTimeToArrivalToManeuver(const routing::RoutingTypes::Maneuver &maneuver, const routing::RoutingTypes::RouterPenalty &penalty) override;
    GetTimeToArrivalToRouteExpected getTimeToArrivalToRoute(const GuidanceTypes::RouteScope scope, const routing::RoutingTypes::RouterPenalty &penalty) override;
    GetTimeToArrivalToRouteOldExpected getTimeToArrivalToRouteOld(const GuidanceTypes::RouteScope scope) override;
    NavigationTypes::ErrorCode pause() override;
    NavigationTypes::ErrorCode resume() override;
    NavigationTypes::ErrorCode startNavigationWithSession(const std::shared_ptr<GuidanceSessionStub> &session) override;
    StartNavigationWithRouteExpected startNavigationWithRoute(const std::shared_ptr<routing::RouteStub> &route, const routing::RoutingTypes::RouteToCompute &alternatives, const GuidanceTypes::NavigationOptions &options) override;
    StartNavigationWithRouteAndWaypointExpected startNavigationWithRouteAndWaypoint(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startWaypointIndex, const routing::RoutingTypes::RouteToCompute &alternatives, const GuidanceTypes::NavigationOptions &options) override;
    StartNavigationWithRouteAndWaypointAndAdditionalOptionsExpected startNavigationWithRouteAndWaypointAndAdditionalOptions(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startWaypointIndex, const routing::RoutingTypes::RouteToCompute &alternatives, const GuidanceTypes::NavigationOptions &options, const GuidanceTypes::MainRouteOptions &mainrouteOptions) override;
    NavigationTypes::ErrorCode startTracking() override;
    NavigationTypes::ErrorCode triggerAvoidanceRerouting() override;
    NavigationTypes::ErrorCode updateNavigationOptions(const GuidanceTypes::NavigationOptions &options) override;
    NavigationTypes::ErrorCode updateRouteNoOptions(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startStopoverIndex) override;
    NavigationTypes::ErrorCode updateRoutePrimary(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startStopoverIndex, const GuidanceTypes::MainRouteOptions &options) override;
    UpdateRouteAlternativesExpected updateRouteAlternatives(const routing::RoutingTypes::RouteToCompute &newRouteAlternatives) override;
    NavigationTypes::ErrorCode updateRoutePlanPrimary(const routing::RoutingTypes::RoutePlan &routePlan, const routing::RoutingTypes::RouterOptions &routerOptions, const routing::RoutingTypes::RouterPenalty &penalty, const uint32_t startStopoverIndex, const GuidanceTypes::MainRouteOptions &mainrouteOptions) override;
    NavigationTypes::ErrorCode updateRoutePlanNoMainRouteOptions(const routing::RoutingTypes::RoutePlan &routePlan, const routing::RoutingTypes::RouterOptions &routerOptions, const routing::RoutingTypes::RouterPenalty &penalty, const uint32_t startStopoverIndex) override;
    GuidanceTypes::NavigationOptions getNavigationOptions() const override;
    GuidanceTypes::GuidanceMode getMode() const override;
    GuidanceTypes::GuidanceState getState() const override;
    routing::RoutingTypes::RouterPenalty getPenalty() const override;
    void setPenalty(const routing::RoutingTypes::RouterPenalty &penalty) override;
};

}

}

}
