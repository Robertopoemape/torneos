part of 'router_provider_micro.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class MicroAppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const CustomRouteType(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: VolleyballMatchesRoute.page),
        AutoRoute(page: ResultTableRoute.page),
        AutoRoute(page: RegisterTeamRoute.page),
        AutoRoute(page: TournamentDetailRoute.page),
      ];
}
