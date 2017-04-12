#include "GuidanceImpl.h"

#include "stub/navigation/guidance/GuidanceStub.h"
#include "stub/navigation/routing/RoutingTypes.h"

namespace navigation {

namespace guidance {

namespace internal {

NavigationTypes::ErrorCode GuidanceImpl::initVoiceOutput(const VoiceOutputTypes::VoicePackage &voicePackage)
{
}

VoiceOutputStub::RepeatLastOutputExpected GuidanceImpl::repeatLastOutput()
{
}

NavigationTypes::ErrorCode GuidanceImpl::checkForOptimalTtaRoute()
{
    return NavigationTypes::ErrorCode::TimeOut;
}

GuidanceStub::GetAllManeuversExpected GuidanceImpl::getAllManeuvers()
{
    notifyGpsLost();
    return GetAllManeuversExpected::result( { { }, { }, { } } );
}

GuidanceStub::GetAverageSpeedExpected GuidanceImpl::getAverageSpeed()
{
}

GuidanceStub::GetBreakOutCountBeforeManeuverExpected GuidanceImpl::getBreakOutCountBeforeManeuver(const GuidanceTypes::BreakOutManeuver maneuver, const GuidanceTypes::BreakOutType breakType)
{
}

GuidanceStub::GetCountryInfoExpected GuidanceImpl::getCountryInfo()
{
}

GuidanceStub::GetDistanceToNextDecisionPointExpected GuidanceImpl::getDistanceToNextDecisionPoint()
{
}

GuidanceStub::GetDistanceToNextManeuverExpected GuidanceImpl::getDistanceToNextManeuver()
{
}

GuidanceStub::GetElapsedDistanceExpected GuidanceImpl::getElapsedDistance(const GuidanceTypes::RouteScope scope)
{
}

GuidanceStub::GetElapsedTimeExpected GuidanceImpl::getElapsedTime()
{
}

GuidanceStub::GetGuidanceProgressExpected GuidanceImpl::getGuidanceProgress()
{
}

GuidanceStub::GetHeadingToNextManeuverExpected GuidanceImpl::getHeadingToNextManeuver()
{
}

GuidanceStub::GetLastSessionExpected GuidanceImpl::getLastSession()
{
}

GuidanceStub::GetNextManeuverExpected GuidanceImpl::getNextManeuver()
{
}

GuidanceStub::GetRemainingDistanceExpected GuidanceImpl::getRemainingDistance(const GuidanceTypes::RouteScope scope)
{
}

GuidanceStub::GetRemainingManeuversPrimaryExpected GuidanceImpl::getRemainingManeuversPrimary()
{
}

GuidanceStub::GetRemainingManeuversLimitManeuversExpected GuidanceImpl::getRemainingManeuversLimitManeuvers(const uint32_t maxNumberOfRemainingManeuvers)
{
}

GuidanceStub::GetRouteExpected GuidanceImpl::getRoute()
{
}

GuidanceStub::GetTimeToArrivalToManeuverOldExpected GuidanceImpl::getTimeToArrivalToManeuverOld(const routing::RoutingTypes::Maneuver &maneuver)
{
}

GuidanceStub::GetTimeToArrivalToManeuverExpected GuidanceImpl::getTimeToArrivalToManeuver(const routing::RoutingTypes::Maneuver &maneuver, const routing::RoutingTypes::RouterPenalty &penalty)
{
}

GuidanceStub::GetTimeToArrivalToRouteExpected GuidanceImpl::getTimeToArrivalToRoute(const GuidanceTypes::RouteScope scope, const routing::RoutingTypes::RouterPenalty &penalty)
{
}

GuidanceStub::GetTimeToArrivalToRouteOldExpected GuidanceImpl::getTimeToArrivalToRouteOld(const GuidanceTypes::RouteScope scope)
{
}

NavigationTypes::ErrorCode GuidanceImpl::pause()
{
}

NavigationTypes::ErrorCode GuidanceImpl::resume()
{
}

NavigationTypes::ErrorCode GuidanceImpl::startNavigationWithSession(const std::shared_ptr<GuidanceSessionStub> &session)
{
}

GuidanceStub::StartNavigationWithRouteExpected GuidanceImpl::startNavigationWithRoute(const std::shared_ptr<routing::RouteStub> &route, const routing::RoutingTypes::RouteToCompute &alternatives, const GuidanceTypes::NavigationOptions &options)
{
}

GuidanceStub::StartNavigationWithRouteAndWaypointExpected GuidanceImpl::startNavigationWithRouteAndWaypoint(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startWaypointIndex, const routing::RoutingTypes::RouteToCompute &alternatives, const GuidanceTypes::NavigationOptions &options)
{
}

GuidanceStub::StartNavigationWithRouteAndWaypointAndAdditionalOptionsExpected GuidanceImpl::startNavigationWithRouteAndWaypointAndAdditionalOptions(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startWaypointIndex, const routing::RoutingTypes::RouteToCompute &alternatives, const GuidanceTypes::NavigationOptions &options, const GuidanceTypes::MainRouteOptions &mainrouteOptions)
{
}

NavigationTypes::ErrorCode GuidanceImpl::startTracking()
{
}

NavigationTypes::ErrorCode GuidanceImpl::triggerAvoidanceRerouting()
{
}

NavigationTypes::ErrorCode GuidanceImpl::updateNavigationOptions(const GuidanceTypes::NavigationOptions &options)
{
}

NavigationTypes::ErrorCode GuidanceImpl::updateRouteNoOptions(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startStopoverIndex)
{
}

NavigationTypes::ErrorCode GuidanceImpl::updateRoutePrimary(const std::shared_ptr<routing::RouteStub> &route, const uint32_t startStopoverIndex, const GuidanceTypes::MainRouteOptions &options)
{
}

GuidanceStub::UpdateRouteAlternativesExpected GuidanceImpl::updateRouteAlternatives(const routing::RoutingTypes::RouteToCompute &newRouteAlternatives)
{
}

NavigationTypes::ErrorCode GuidanceImpl::updateRoutePlanPrimary(const routing::RoutingTypes::RoutePlan &routePlan, const routing::RoutingTypes::RouterOptions &routerOptions, const routing::RoutingTypes::RouterPenalty &penalty, const uint32_t startStopoverIndex, const GuidanceTypes::MainRouteOptions &mainrouteOptions)
{
}

NavigationTypes::ErrorCode GuidanceImpl::updateRoutePlanNoMainRouteOptions(const routing::RoutingTypes::RoutePlan &routePlan, const routing::RoutingTypes::RouterOptions &routerOptions, const routing::RoutingTypes::RouterPenalty &penalty, const uint32_t startStopoverIndex)
{
}

GuidanceTypes::NavigationOptions GuidanceImpl::getNavigationOptions() const
{
}

GuidanceTypes::GuidanceMode GuidanceImpl::getMode() const
{
}

GuidanceTypes::GuidanceState GuidanceImpl::getState() const
{
}

routing::RoutingTypes::RouterPenalty GuidanceImpl::getPenalty() const
{
}

void GuidanceImpl::setPenalty(const routing::RoutingTypes::RouterPenalty &penalty)
{
}

} // internal
} // guidance
} // navigation
