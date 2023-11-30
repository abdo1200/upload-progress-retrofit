// import 'package:golden_host/src/core/navigation/routes/AppRouter.gr.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';

// import '../../../feature/auth/domain/use_cases/firebase_token_use_case.dart';
// import '../navigation/routes/AppRouter.dart';

// const AndroidNotificationChannel channelUser = AndroidNotificationChannel(
//     'high_importance_channel_golden', // id
//     'High Importance Notifications', // title
//     importance: Importance.max,
//     sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//     playSound: true);

// var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// @Injectable()
// class FirebaseNotificationUserClass {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   static final FirebaseTokenUseCase _firebaseTokenUseCase =
//       GetIt.instance.get<FirebaseTokenUseCase>();

//   static void initFirebase() async {
//     _messaging.getToken().then((value) {
//       _firebaseTokenUseCase(params: value);
//     });
//     _messaging.onTokenRefresh.listen((event) {
//       _firebaseTokenUseCase(params: event);
//     });
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channelUser);
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .requestPermission()
//         .then((value) {
//       print('noti value');
//       print(value);
//     });
//     await _messaging.setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);

//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User granted provisional permission');
//     } else {
//       print('User declined or has not accepted permission');
//     }

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       if (kDebugMode) {
//         print("NewMessage");
//       }
//       RemoteNotification notification = message.notification!;
//       AndroidNotification? android = message.notification?.android;
//       if (android != null) {
//         if (kDebugMode) {
//           print(
//               "foreground received:: ${message.notification!.title}/${message.notification!.body}");
//         }
//         //
//         // showSimpleNotification(
//         //   slideDismissDirection: DismissDirection.horizontal,
//         //   Row(
//         //     crossAxisAlignment: CrossAxisAlignment.center,
//         //     children: [
//         //       Assets.images.notificationLogo.image(width: 30),
//         //       Text(
//         //         S.current.app_name,
//         //         style: AppTextStyles.s13Secondary(),
//         //       )
//         //     ],
//         //   ),
//         //   subtitle: Column(
//         //     crossAxisAlignment: CrossAxisAlignment.start,
//         //     children: [
//         //       Text(
//         //         '٣٩ " هدااااااااف اهلي طرابلس ٢-٠ الأتحاد',
//         //         style: AppTextStyles.s16Black(),
//         //       ),
//         //       const SizedBox(height: 5),
//         //       Text(
//         //         'يوضح هـا النص تفاصيل الهدف والذي عادة ما يتكون من عدة اسطر يوضح هـا النص تفاصيل الهدف والذي عادة ما يتكون من عدة اسطر',
//         //         style: AppTextStyles.s13Secondary(),
//         //       ),
//         //       const SizedBox(height: 5),
//         //     ],
//         //   ),
//         //   foreground: AppColors.current.primaryColor,
//         //   background: const Color(0xFFEBEBEB),
//         //   duration: const Duration(seconds: 2),
//         // );

//         // dynamic bigImage = downloadAndSaveFile(
//         //     "${message.data["image"]}", "${message.data["title"]}");
//         // AwesomeNotifications().createNotification(
//         //     content: NotificationContent(
//         //         id: -1, // -1 is replaced by a random number
//         //         channelKey: 'alerts',
//         //         title: notification.title,
//         //         body:
//         //             "A small step for a man, but a giant leap to Flutter's community!",
//         //         bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
//         //         largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
//         //         //'asset://assets/images/balloons-in-sky.jpg',
//         //         notificationLayout: NotificationLayout.BigPicture,
//         //         payload: {'notificationId': '1234567890'}),
//         //     actionButtons: [
//         //       NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
//         //       NotificationActionButton(
//         //           key: 'REPLY',
//         //           label: 'Reply Message',
//         //           requireInputText: true,
//         //           actionType: ActionType.SilentAction),
//         //       NotificationActionButton(
//         //           key: 'DISMISS',
//         //           label: 'Dismiss',
//         //           actionType: ActionType.DismissAction,
//         //           isDangerousOption: true)
//         //     ]);
//       } else {
//         await _messaging.setForegroundNotificationPresentationOptions(
//           alert: true, // Required to display a heads up notification
//           badge: true,
//           sound: true,
//         );
//       }
//       final appRouter = GetIt.instance.get<AppRouter>();
//       if (appRouter.currentPath != '/home-container-route/chats-route') {

//         flutterLocalNotificationsPlugin.show(
//             1,
//             message.notification!.title!,
//             message.notification!.body!,
//             NotificationDetails(
//               iOS:DarwinNotificationDetails(sound: 'slow_spring_board.aiff') ,
//                 android: AndroidNotificationDetails(
//               channelUser.id,
//               channelUser.name,
//               sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//               playSound: true,
//             )));
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         if (kDebugMode) {
//           var appRouter = GetIt.instance.get<AppRouter>();

//           appRouter.push(SplashRoute(
//             notificationTyp: message.data["type"],
//             orderId: message.data["order_id"],
//             flatId: message.data["flat_id"],
//             mode: message.data["mode"],
//             roomid: message.data["room_id"],
//             senderid: message.data["sender_id"],
//             status: message.data["status"],
//             transactionId: message.data["transaction_id"],
//           ));

//           print("background clicked:: ${message.data}");
//         }
//       }

//       //_handleMessage(message);
//     });
//     flutterLocalNotificationsPlugin.initialize(
//       const InitializationSettings(
//         android: AndroidInitializationSettings("@drawable/not_logo"),
//         iOS: DarwinInitializationSettings(),
//       ),
//     );

//     // AwesomeNotifications().initialize(
//     //     // set the icon to null if you want to use the default app icon
//     //     'resource://drawable/launch_background',
//     //     [
//     //       NotificationChannel(
//     //           channelGroupKey: 'basic_channel_group',
//     //           channelKey: 'basic_channel',
//     //           channelName: 'Basic notifications',
//     //           channelDescription: 'Notification channel for basic tests',
//     //           defaultColor: const Color(0xFF9D50DD),
//     //           ledColor: Colors.white)
//     //     ],
//     //     // Channel groups are only visual and are not required
//     //     channelGroups: [

//     //       NotificationChannelGroup(
//     //           channelGroupKey: 'basic_channel_group',
//     //           channelGroupName: 'Basic group')
//     //     ],
//     //     debug: true);
//   }

// // static void _handleMessage(RemoteMessage message) {
// //   final appRouter = GetIt.instance.get<AppRouter>();
// //   // if (message.data['type'] == 'product') {
// //   //   _appRouter.push(ProductDetailsRoute(
// //   //     itemId: message.data['item_id'],
// //   //   ));
// //   // } else if (message.data['type'] == 'order') {
// //   //   _appRouter.push(OrderTracking(orderId: message.data['order_id'] ));
// //   // } else if (message.data['link'] != null) {
// //   //   _notificationMessageUrl(url: Uri.parse("${message.data['link']}"));
// //   // }
// // }
// }
