import 'dart:convert';

class NotificationModel {
  final int userNotificationId;
  final bool isRead;
  final int applicationUserId;
  final String notificationType;
  final String content;

  NotificationModel({
    required this.userNotificationId,
    required this.isRead,
    required this.applicationUserId,
    required this.notificationType,
    required this.content,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      userNotificationId: json['userNotificationId'],
      isRead: json['isRead'],
      applicationUserId: json['applicationUserId'],
      notificationType: json['notificationType'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userNotificationId': userNotificationId,
      'isRead': isRead,
      'applicationUserId': applicationUserId,
      'notificationType': notificationType,
      'content': content,
    };
  }

  static List<NotificationModel> listFromJson(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((item) => NotificationModel.fromJson(item)).toList();
  }
}

class NotificationList {
  final List<NotificationModel> notifications;

  NotificationList({required this.notifications});

  factory NotificationList.fromJson(List<dynamic> json) {
    return NotificationList(
      notifications:
          json.map((item) => NotificationModel.fromJson(item)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return notifications.map((notification) => notification.toJson()).toList();
  }
}
