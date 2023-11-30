// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:progress/features/auth/presentation/auth_container.dart' as _i1;
import 'package:progress/features/auth/presentation/pages/sign.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AuthContainer.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthContainer(),
      );
    },
    SignRoute.name: (routeData) {
      final args =
          routeData.argsAs<SignRouteArgs>(orElse: () => const SignRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SignPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthContainer]
class AuthContainer extends _i3.PageRouteInfo<void> {
  const AuthContainer({List<_i3.PageRouteInfo>? children})
      : super(
          AuthContainer.name,
          initialChildren: children,
        );

  static const String name = 'AuthContainer';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignPage]
class SignRoute extends _i3.PageRouteInfo<SignRouteArgs> {
  SignRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SignRoute.name,
          args: SignRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignRoute';

  static const _i3.PageInfo<SignRouteArgs> page =
      _i3.PageInfo<SignRouteArgs>(name);
}

class SignRouteArgs {
  const SignRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'SignRouteArgs{key: $key}';
  }
}
