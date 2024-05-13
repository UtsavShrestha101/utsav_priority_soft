import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';

@singleton
class PushNotificationService {
  @PostConstruct(preResolve: true)
  Future<void> initialize() async {
    AwesomeNotifications().initialize(
      'resource://drawable/logo',
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          ledColor: AppColors.information500,
          enableLights: true,
          enableVibration: true,
          playSound: true,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        )
      ],
    );
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  // to display notification with image

  Future<void> displayBigNotification(
      String title, String body, String imageAssets) async {
    int id = Random().nextInt(1000);
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        bigPicture: imageAssets,
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  // to display simple notification

  Future<void> displaySimpleNotification(
    String title,
    String body,
  ) async {
    int id = Random().nextInt(1000);
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }
}
