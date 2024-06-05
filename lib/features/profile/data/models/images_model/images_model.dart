class ImagesModel {
  final String base64Image;
  final String contentType;

  ImagesModel({required this.base64Image, required this.contentType});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      base64Image: json['base64Image'],
      contentType: json['contentType'],
    );
  }
}
