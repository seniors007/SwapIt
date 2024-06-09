import 'package:equatable/equatable.dart';

class ServiceResposeModel extends Equatable {
  final int id;
  final String serviceName;
  final String serviceDescription;
  final int servicePrice;
  final String categoryName;
  final int totalRate;
  final String username;
  final String? profileImagePath;
  final String? notes;
  final String? feedback;
  final String? requestImage;
  final int serviceRequestId;

  const ServiceResposeModel({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePrice,
    required this.categoryName,
    required this.totalRate,
    required this.username,
    this.profileImagePath,
    this.notes,
    this.feedback,
    this.requestImage,
    required this.serviceRequestId,
  });

  factory ServiceResposeModel.fromJson(Map<String, dynamic> json) {
    return ServiceResposeModel(
      id: json['id'],
      serviceName: json['serviceName'],
      serviceDescription: json['serviceDescription'],
      servicePrice: json['servicePrice'],
      categoryName: json['categoryName'],
      totalRate: json['totalRate'],
      username: json['username'],
      profileImagePath: json['profileImagePath'],
      notes: json['notes'],
      feedback: json['feedback'],
      requestImage: json['requestImage'],
      serviceRequestId: json['serviceRequestId'],
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
      'notes': notes,
      'feedback': feedback,
      'requestImage': requestImage,
      'serviceRequestId': serviceRequestId,
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
        notes,
        feedback,
        requestImage,
        serviceRequestId,
      ];
}

class ServiceResponseContainer {
  final List<ServiceResposeModel> pendingServices;

  ServiceResponseContainer({required this.pendingServices});

  factory ServiceResponseContainer.fromJson(List<dynamic> json) {
    List<ServiceResposeModel> pendingServices =
        json.map((e) => ServiceResposeModel.fromJson(e)).toList();
    return ServiceResponseContainer(pendingServices: pendingServices);
  }

  List<dynamic> toJson() => pendingServices.map((e) => e.toJson()).toList();
}
