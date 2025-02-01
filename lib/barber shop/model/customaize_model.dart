class BarberShopModel {
  final String barberShopName;
  final bool isActive;
  final String shopType;
  final int id;
  final List<Comment> comments;
  final List<ImageData> images;
  final Location location;

  BarberShopModel({
    required this.barberShopName,
    required this.isActive,
    required this.shopType,
    required this.id,
    required this.comments,
    required this.images,
    required this.location,
  });

  // Factory method to parse the JSON response
  factory BarberShopModel.fromJson(Map<String, dynamic> json) {
    var commentList = (json['comments'] as List)
        .map((comment) => Comment.fromJson(comment))
        .toList();

    var imageList = (json['images'] as List)
        .map((image) => ImageData.fromJson(image))
        .toList();

    var locationData = Location.fromJson(json['location']);

    return BarberShopModel(
      barberShopName: json['barber_shop_name'],
      isActive: json['is_active'],
      shopType: json['shop_type'],
      id: json['id'],
      comments: commentList,
      images: imageList,
      location: locationData,
    );
  }
}

class Comment {
  final int userId;
  final int rating;
  final String comment;
  final String createdAt;

  Comment({
    required this.userId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userId: json['user_id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['created_at'],
    );
  }
}

class ImageData {
  final String fileName;
  final String url;

  ImageData({
    required this.fileName,
    required this.url,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      fileName: json['file_name'],
      url: json['url'],
    );
  }
}

class Location {
  final double latitude;
  final double longitude;
  final int id;

  Location({
    required this.latitude,
    required this.longitude,
    required this.id,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
      id: json['id'],
    );
  }
}
