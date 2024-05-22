import 'package:equatable/equatable.dart';

class PendingService extends Equatable {
  final int id;
  final String serviceName;
  final String serviceDescription;
  final int servicePrice;
  final String categoryName;
  final int totalRate;
  final String username;
  final String? profileImagePath;

  const PendingService({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePrice,
    required this.categoryName,
    required this.totalRate,
    required this.username,
    this.profileImagePath,
  });

  factory PendingService.fromJson(Map<String, dynamic> json) {
    return PendingService(
      id: json['id'],
      serviceName: json['serviceName'],
      serviceDescription: json['serviceDescription'],
      servicePrice: json['servicePrice'],
      categoryName: json['categoryName'],
      totalRate: json['totalRate'],
      username: json['username'],
      profileImagePath: json['profileImagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'servicePrice': servicePrice,
      'categoryName': categoryName,
      'totalRate': totalRate,
      'username': username,
      'profileImagePath': profileImagePath,
    };
  }

  @override
  List<Object?> get props => [
        id,
        serviceName,
        serviceDescription,
        servicePrice,
        categoryName,
        totalRate,
        username,
        profileImagePath,
      ];
}

class PendingServiceContainer {
  final List<PendingService> pendingServices;

  PendingServiceContainer({required this.pendingServices});

  factory PendingServiceContainer.fromJson(List<dynamic> json) {
    List<PendingService> pendingServices =
        json.map((e) => PendingService.fromJson(e)).toList();
    return PendingServiceContainer(pendingServices: pendingServices);
  }

  List<dynamic> toJson() => pendingServices.map((e) => e.toJson()).toList();
}
