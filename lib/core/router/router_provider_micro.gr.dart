// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:proyecto_torneos/presentation/drawer_menu_header/view/drawer_menu_header_screen.dart'
    as _i1;
import 'package:proyecto_torneos/presentation/home/view/home_screen.dart'
    as _i2;
import 'package:proyecto_torneos/presentation/register_statistic/view/volleyball_matches_screen.dart'
    as _i6;
import 'package:proyecto_torneos/presentation/register_team/view/register_team_screen.dart'
    as _i3;
import 'package:proyecto_torneos/presentation/result_record/view/score_register_screen.dart'
    as _i4;
import 'package:proyecto_torneos/presentation/result_table/view/result_table_screen.dart'
    as _i5;

/// generated route for
/// [_i1.DrawerMenuHeaderScreen]
class DrawerMenuHeaderRoute extends _i7.PageRouteInfo<void> {
  const DrawerMenuHeaderRoute({List<_i7.PageRouteInfo>? children})
    : super(DrawerMenuHeaderRoute.name, initialChildren: children);

  static const String name = 'DrawerMenuHeaderRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.DrawerMenuHeaderScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterTeamScreen]
class RegisterTeamRoute extends _i7.PageRouteInfo<void> {
  const RegisterTeamRoute({List<_i7.PageRouteInfo>? children})
    : super(RegisterTeamRoute.name, initialChildren: children);

  static const String name = 'RegisterTeamRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterTeamScreen();
    },
  );
}

/// generated route for
/// [_i4.ResultRecordScreen]
class ResultRecordRoute extends _i7.PageRouteInfo<void> {
  const ResultRecordRoute({List<_i7.PageRouteInfo>? children})
    : super(ResultRecordRoute.name, initialChildren: children);

  static const String name = 'ResultRecordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ResultRecordScreen();
    },
  );
}

/// generated route for
/// [_i5.ResultTableScreen]
class ResultTableRoute extends _i7.PageRouteInfo<void> {
  const ResultTableRoute({List<_i7.PageRouteInfo>? children})
    : super(ResultTableRoute.name, initialChildren: children);

  static const String name = 'ResultTableRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ResultTableScreen();
    },
  );
}

/// generated route for
/// [_i6.VolleyballMatchesScreen]
class VolleyballMatchesRoute extends _i7.PageRouteInfo<void> {
  const VolleyballMatchesRoute({List<_i7.PageRouteInfo>? children})
    : super(VolleyballMatchesRoute.name, initialChildren: children);

  static const String name = 'VolleyballMatchesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.VolleyballMatchesScreen();
    },
  );
}
