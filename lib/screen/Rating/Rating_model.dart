class RatingModel {
  final int id;
  final int rating;
  final String comment;
  final String userName;
  final String createdAt;
  final String userImage;

  RatingModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.userName,
    required this.createdAt,
    required this.userImage,
  });

  factory RatingModel.fromJson(Map<String, dynamic> j) {
    return RatingModel(
      id: int.parse(j['id'].toString()),
      rating: int.parse(j['rating'].toString()),
      comment: j['comment']?.toString() ?? '',
      userName: j['user_name']?.toString() ?? '',
      createdAt: j['created_at']?.toString() ?? '',
      userImage: j['user_image']?.toString() ?? '',
    );
  }
}