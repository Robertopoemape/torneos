// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:proyecto_torneos/presentation/drawer_menu_header/view/drawer_menu_header_screen.dart'
    as _i1;
import 'package:proyecto_torneos/presentation/home/view/home_screen.dart'
    as _i2;
import 'package:proyecto_torneos/presentation/match_detail/match_detail_screen.dart'
    as _i3;
import 'package:proyecto_torneos/presentation/register_points/view/register_sets_vball_screen.dart'
    as _i4;
import 'package:proyecto_torneos/presentation/register_team/view/register_team_vball_screen.dart'
    as _i5;
import 'package:proyecto_torneos/presentation/register_tournament/view/register_tournament_vball_screen.dart'
    as _i6;
import 'package:proyecto_torneos/presentation/result_record/view/score_register_screen.dart'
    as _i7;
import 'package:proyecto_torneos/presentation/table_points/view/table_points_voley_screen.dart'
    as _i8;
import 'package:proyecto_torneos/presentation/table_result/view/table_result_vball_screen.dart'
    as _i9;
import 'package:proyecto_torneos/presentation/tournament_detail/view/tournament_detail_screen.dart'
    as _i10;
import 'package:proyecto_torneos/src/models/models.dart' as _i13;

/// generated route for
/// [_i1.DrawerMenuHeaderScreen]
class DrawerMenuHeaderRoute extends _i11.PageRouteInfo<void> {
  const DrawerMenuHeaderRoute({List<_i11.PageRouteInfo>? children})
    : super(DrawerMenuHeaderRoute.name, initialChildren: children);

  static const String name = 'DrawerMenuHeaderRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.DrawerMenuHeaderScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MatchDetailScreen]
class MatchDetailRoute extends _i11.PageRouteInfo<MatchDetailRouteArgs> {
  MatchDetailRoute({
    _i12.Key? key,
    required String matchId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         MatchDetailRoute.name,
         args: MatchDetailRouteArgs(key: key, matchId: matchId),
         initialChildren: children,
       );

  static const String name = 'MatchDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MatchDetailRouteArgs>();
      return _i3.MatchDetailScreen(key: args.key, matchId: args.matchId);
    },
  );
}

class MatchDetailRouteArgs {
  const MatchDetailRouteArgs({this.key, required this.matchId});

  final _i12.Key? key;

  final String matchId;

  @override
  String toString() {
    return 'MatchDetailRouteArgs{key: $key, matchId: $matchId}';
  }
}

/// generated route for
/// [_i4.RegisterSetsVballScreen]
class RegisterSetsVballRoute
    extends _i11.PageRouteInfo<RegisterSetsVballRouteArgs> {
  RegisterSetsVballRoute({
    required String tournamentId,
    required String localTeam,
    required String visitantTeam,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         RegisterSetsVballRoute.name,
         args: RegisterSetsVballRouteArgs(
           tournamentId: tournamentId,
           localTeam: localTeam,
           visitantTeam: visitantTeam,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'RegisterSetsVballRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterSetsVballRouteArgs>();
      return _i4.RegisterSetsVballScreen(
        tournamentId: args.tournamentId,
        localTeam: args.localTeam,
        visitantTeam: args.visitantTeam,
        key: args.key,
      );
    },
  );
}

class RegisterSetsVballRouteArgs {
  const RegisterSetsVballRouteArgs({
    required this.tournamentId,
    required this.localTeam,
    required this.visitantTeam,
    this.key,
  });

  final String tournamentId;

  final String localTeam;

  final String visitantTeam;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RegisterSetsVballRouteArgs{tournamentId: $tournamentId, localTeam: $localTeam, visitantTeam: $visitantTeam, key: $key}';
  }
}

/// generated route for
/// [_i5.RegisterTeamVballScreen]
class RegisterTeamVballRoute extends _i11.PageRouteInfo<void> {
  const RegisterTeamVballRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterTeamVballRoute.name, initialChildren: children);

  static const String name = 'RegisterTeamVballRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegisterTeamVballScreen();
    },
  );
}

/// generated route for
/// [_i6.RegisterTournamentScreen]
class RegisterTournamentRoute extends _i11.PageRouteInfo<void> {
  const RegisterTournamentRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterTournamentRoute.name, initialChildren: children);

  static const String name = 'RegisterTournamentRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterTournamentScreen();
    },
  );
}

/// generated route for
/// [_i7.ResultRecordScreen]
class ResultRecordRoute extends _i11.PageRouteInfo<void> {
  const ResultRecordRoute({List<_i11.PageRouteInfo>? children})
    : super(ResultRecordRoute.name, initialChildren: children);

  static const String name = 'ResultRecordRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.ResultRecordScreen();
    },
  );
}

/// generated route for
/// [_i8.TablePointsVoleyScreen]
class TablePointsVoleyRoute extends _i11.PageRouteInfo<void> {
  const TablePointsVoleyRoute({List<_i11.PageRouteInfo>? children})
    : super(TablePointsVoleyRoute.name, initialChildren: children);

  static const String name = 'TablePointsVoleyRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.TablePointsVoleyScreen();
    },
  );
}

/// generated route for
/// [_i9.TableResultVoleyScreen]
class TableResultVoleyRoute extends _i11.PageRouteInfo<void> {
  const TableResultVoleyRoute({List<_i11.PageRouteInfo>? children})
    : super(TableResultVoleyRoute.name, initialChildren: children);

  static const String name = 'TableResultVoleyRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.TableResultVoleyScreen();
    },
  );
}

/// generated route for
/// [_i10.TournamentDetailScreen]
class TournamentDetailRoute
    extends _i11.PageRouteInfo<TournamentDetailRouteArgs> {
  TournamentDetailRoute({
    required _i13.TournamentData tournamentData,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         TournamentDetailRoute.name,
         args: TournamentDetailRouteArgs(
           tournamentData: tournamentData,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'TournamentDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TournamentDetailRouteArgs>();
      return _i10.TournamentDetailScreen(
        tournamentData: args.tournamentData,
        key: args.key,
      );
    },
  );
}

class TournamentDetailRouteArgs {
  const TournamentDetailRouteArgs({required this.tournamentData, this.key});

  final _i13.TournamentData tournamentData;

  final _i12.Key? key;

  @override
  String toString() {
    return 'TournamentDetailRouteArgs{tournamentData: $tournamentData, key: $key}';
  }
}
