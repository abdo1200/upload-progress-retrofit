import 'package:progress/src/core/local/locale_constants.dart';
import 'package:progress/src/core/preferences/Prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:el3ab/feature/auth/data/remote/models/init_response.dart';
// import 'package:el3ab/feature/auth/data/remote/models/login_response.dart';
// import 'package:el3ab/feature/auth/domain/use_cases/init_use_case.dart';

import 'package:injectable/injectable.dart';

import '../../../resource/styles/app_themes.dart';

part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final Prefs prefs;

  // final InitUseCase _initUseCase;
  // final HomeUseCase _homeUseCase;

  bool isLogin = false;
  String languageCode = LocaleConstants.defaultLocale;
  String modeThem = "light";
  // InitResponse? initResponse;
  bool showTutorial = false;

  String? name;

  String? email;

  String? phone;

  String? userMode = "user";

  String? password;

  bool hasOrder;

//  List<Categories>? categories;

  // Profile? profile = Profile();

  AppBloc(
      {required this.prefs,
      required this.languageCode,
      required this.modeThem,
      required this.hasOrder})
      : super(AppInitial(languageCode, modeThem)) {
    on<InitEvent>(_init);
    on<LogUserEvent>(_logUser);
    on<LanguageEvent>(_changeLanguage);
    on<ThemEvent>(_changeThem);
  }

  void _init(InitEvent event, Emitter<AppState> emit) async {
    _updateThemeSetting(modeThem == "dark");
    emit(ChangeSettings(languageCode, "modeThem", isLogin));
    await prefs.isLoginBool.then((value) => isLogin = value);
    await prefs.userModeString.then((value) {
      if (value.isNotEmpty) {
        userMode = value;
      }
    });
    // _appInit();
    await prefs.isTutorialBool.then((value) => showTutorial = value);
    await prefs.languageString.then((value) {
      if (value.isNotEmpty) {
        languageCode = value;
      }
    });
    await prefs.phoneString.then((value) => phone = value);
    await prefs.themString.then((value) {
      if (value.isNotEmpty) {
        modeThem = value;
      }
    });
    if (isLogin) {
      getUserData();
    }
  }

  Future<void> login(bool val) async {
    await prefs.setIsLoginBool(val);
  }

  void getUserData() {
    prefs.nameString.then((value) => name = value);
    prefs.userModeString.then((value) => userMode = value);
    prefs.emailString.then((value) => email = value);
    prefs.passwordString.then((value) => password = value);
  }

  // Future<void> _appInit() async {
  //   print("$userMode mmmmmm");
  //   var dataState;
  //   if (userMode != "user") {
  //     var data = await Future.value(
  //         [await _homeUseCase(), await _initUseCase(params: "")]);

  //     dataState = (data[1]);
  //     categories = ((data[0].data) as HomeResponse).categories;
  //   } else {
  //     dataState = await _initUseCase(params: "");
  //   }

  //   if (dataState is DataSuccess) {
  //     initResponse = (dataState.data) as InitResponse;
  //     print("hhhhhhhh $initResponse ");
  //     prefs.setInitData(jsonEncode(initResponse));
  //   }
  //   if (dataState is DataFailed || dataState is DataFailedMessage) {
  //     prefs.initDataString.then(
  //         (value) => initResponse = InitResponse.fromJson(jsonDecode(value)));
  //   }
  // }

  void _logUser(LogUserEvent event, Emitter<AppState> emit) async {
    isLogin = event.isLogin;
    if (!event.isLogin) {
      // emit(AppLogin(languageCode, modeThem, true));
      await prefs.clear();
      // emit(AppLogin(languageCode, modeThem, false));
    } else {
      await prefs.setIsLoginBool(true);
      getUserData();
    }
  }

  void _changeLanguage(LanguageEvent event, Emitter<AppState> emit) async {
    languageCode = event.languageCode;
    await prefs.setLanguageString(event.languageCode);
    emit(ChangeSettings(languageCode, modeThem, isLogin));
  }

  void _changeThem(ThemEvent event, Emitter<AppState> emit) async {
    modeThem = event.them;
    await prefs.setThemString(event.them);
    _updateThemeSetting(modeThem == "dark");
    emit(ChangeSettings(languageCode, modeThem, isLogin));
  }

  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType =
        isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }
}
