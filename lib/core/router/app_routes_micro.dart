part of 'router_provider_micro.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class MicroAppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const CustomRouteType(
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: RegisterSetsVballRoute.page),
        AutoRoute(page: TablePointsVoleyRoute.page),
        AutoRoute(page: TableResultVoleyRoute.page),
        AutoRoute(page: RegisterTeamVballRoute.page),
        AutoRoute(page: TournamentDetailRoute.page),
        AutoRoute(page: RegisterTournamentRoute.page),
        //    AutoRoute(page: ComLocationRoute.page)
      ];
}
