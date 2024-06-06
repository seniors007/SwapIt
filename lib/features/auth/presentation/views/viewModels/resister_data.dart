import 'dart:io';

class RegisterData {
  String? userName;
  String? password;
  String? email;
  String? phoneNumber;
  String? birthYear;
  String? birthMonth;
  String? dateOfBirth;
  String? birthDay;
  String? jobTitle;
  String? address;
  File? profileImage;
  File? idImage;

  RegisterData({
    this.userName,
    this.password,
    this.email,
    this.phoneNumber,
    this.birthYear,
    this.birthMonth,
    this.dateOfBirth,
    this.birthDay,
    this.jobTitle,
    this.address,
    this.profileImage,
    this.idImage,
  });
}
