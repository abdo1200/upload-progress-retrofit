part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final String? languageCode;
  final String? modeThem;
  final bool? isLogin;

  const AppState({this.languageCode, this.modeThem, this.isLogin});

  @override
  List<Object> get props => [
        languageCode ?? LocaleConstants.defaultLocale,
        modeThem ?? "light",
        isLogin ?? false
      ];
}

class AppInitial extends AppState {
  const AppInitial(String languageCode, String modeThem)
      : super(languageCode: languageCode, modeThem: modeThem);
}

class AppLogin extends AppState {
  const AppLogin(String languageCode, String modeThem, bool isLogin)
      : super(languageCode: languageCode, modeThem: modeThem, isLogin: isLogin);
}

class ChangeSettings extends AppState {
  const ChangeSettings(String languageCode, String modeThem, bool isLogin)
      : super(languageCode: languageCode, modeThem: modeThem, isLogin: isLogin);
}
