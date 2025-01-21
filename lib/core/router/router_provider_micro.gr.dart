// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:proyecto_torneos/presentation/drawer_menu_header/view/drawer_menu_header_screen.dart'
    as _i1;
import 'package:proyecto_torneos/presentation/home/view/home_screen.dart'
    as _i2;
import 'package:proyecto_torneos/presentation/match_detail/match_detail_screen.dart'
    as _i3;
import 'package:proyecto_torneos/presentation/register_statistic/view/volleyball_matches_screen.dart'
    as _i8;
import 'package:proyecto_torneos/presentation/register_team/view/register_team_screen.dart'
    as _i4;
import 'package:proyecto_torneos/presentation/result_record/view/score_register_screen.dart'
    as _i5;
import 'package:proyecto_torneos/presentation/result_table/view/result_table_screen.dart'
    as _i6;
import 'package:proyecto_torneos/presentation/tournament_detail/view/tournament_detail_screen.dart'
    as _i7;

/// generated route for
/// [_i1.DrawerMenuHeaderScreen]
class DrawerMenuHeaderRoute extends _i9.PageRouteInfo<void> {
  const DrawerMenuHeaderRoute({List<_i9.PageRouteInfo>? children})
    : super(DrawerMenuHeaderRoute.name, initialChildren: children);

  static const String name = 'DrawerMenuHeaderRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.DrawerMenuHeaderScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MatchDetailScreen]
class MatchDetailRoute extends _i9.PageRouteInfo<MatchDetailRouteArgs> {
  MatchDetailRoute({
    _i10.Key? key,
    required String matchId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         MatchDetailRoute.name,
         args: MatchDetailRouteArgs(key: key, matchId: matchId),
         initialChildren: children,
       );

  static const String name = 'MatchDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MatchDetailRouteArgs>();
      return _i3.MatchDetailScreen(key: args.key, matchId: args.matchId);
    },
  );
}

class MatchDetailRouteArgs {
  const MatchDetailRouteArgs({this.key, required this.matchId});

  final _i10.Key? key;

  final String matchId;

  @override
  String toString() {
    return 'MatchDetailRouteArgs{key: $key, matchId: $matchId}';
  }
}

/// generated route for
/// [_i4.RegisterTeamScreen]
class RegisterTeamRoute extends _i9.PageRouteInfo<void> {
  const RegisterTeamRoute({List<_i9.PageRouteInfo>? children})
    : super(RegisterTeamRoute.name, initialChildren: children);

  static const String name = 'RegisterTeamRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.RegisterTeamScreen();
    },
  );
}

/// generated route for
/// [_i5.ResultRecordScreen]
class ResultRecordRoute extends _i9.PageRouteInfo<void> {
  const ResultRecordRoute({List<_i9.PageRouteInfo>? children})
    : super(ResultRecordRoute.name, initialChildren: children);

  static const String name = 'ResultRecordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.ResultRecordScreen();
    },
  );
}

/// generated route for
/// [_i6.ResultTableScreen]
class ResultTableRoute extends _i9.PageRouteInfo<void> {
  const ResultTableRoute({List<_i9.PageRouteInfo>? children})
    : super(ResultTableRoute.name, initialChildren: children);

  static const String name = 'ResultTableRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.ResultTableScreen();
    },
  );
}

/// generated route for
/// [_i7.TournamentDetailScreen]
class TournamentDetailRoute
    extends _i9.PageRouteInfo<TournamentDetailRouteArgs> {
  TournamentDetailRoute({
    _i10.Key? key,
    required String tournamentId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         TournamentDetailRoute.name,
         args: TournamentDetailRouteArgs(key: key, tournamentId: tournamentId),
         initialChildren: children,
       );

  static const String name = 'TournamentDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TournamentDetailRouteArgs>();
      return _i7.TournamentDetailScreen(
        key: args.key,
        tournamentId: args.tournamentId,
      );
    },
  );
}

class TournamentDetailRouteArgs {
  const TournamentDetailRouteArgs({this.key, required this.tournamentId});

  final _i10.Key? key;

  final String tournamentId;

  @override
  String toString() {
    return 'TournamentDetailRouteArgs{key: $key, tournamentId: $tournamentId}';
  }
}

/// generated route for
/// [_i8.VolleyballMatchesScreen]
class VolleyballMatchesRoute extends _i9.PageRouteInfo<void> {
  const VolleyballMatchesRoute({List<_i9.PageRouteInfo>? children})
    : super(VolleyballMatchesRoute.name, initialChildren: children);

  static const String name = 'VolleyballMatchesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.VolleyballMatchesScreen();
    },
  );
}
