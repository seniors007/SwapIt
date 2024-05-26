class GetUserModel {
  int userId;
  String username;
  String email;
  DateTime dateOfBirth;
  String address;
  String phoneNumber;
  String jobTitle;
  String profileImagePath;
  int totalRate;

  GetUserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.address,
    required this.phoneNumber,
    required this.jobTitle,
    required this.profileImagePath,
    required this.totalRate,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return GetUserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      jobTitle: json['jobTitle'],
      profileImagePath: json['profileImagePath'],
      totalRate: json['totalRate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['dateOfBirth'] = this.dateOfBirth.toIso8601String();
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['jobTitle'] = this.jobTitle;
    data['profileImagePath'] = this.profileImagePath;
    data['totalRate'] = this.totalRate;
    return data;
  }
}
