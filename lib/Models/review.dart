
class Review {
  int reviewId;
  int userId ;
  String userName ;
  String avatar ;
  int placeId  ;
  String content;
  double rating;
  String dateCreated;
  String type;

  Review({this.reviewId, this.userId, this.userName, this.avatar, this.placeId, this.content, this.rating, this.dateCreated , this.type, });


  @override
  String toString() {
    return '{ ${this.reviewId}, ${this.userId}, ${this.placeId}, ${this.content}, ${this.rating}, ${this.dateCreated}}';
  }
}

List<Review> demoReview = [
  Review(
    reviewId: 1,
    userId: 1,
    userName: 'baldan',
    avatar: 'assets/images/avatar.png',
    placeId: 3,
    rating: 3.5,
    content: "ene ih goy gazar baina maniahan zaaval aylaarai gej taa buhendee zuwluyduu  bla bla bal lbal bla bla bla",
    dateCreated: "2021/04/22",
  ),
  Review(
    reviewId: 1,
    userId: 1,
    userName: 'dondog',
    avatar: 'assets/images/avatar.png',
    placeId: 3,
    rating: 3.5,
    content: "ene ih goy gazar baina maniahan zaaval aylaarai 1 ",
    dateCreated: "2021/04/22",
  ),  Review(
    reviewId: 1,
    userId: 1,
    userName: 'sandan',
    avatar: 'assets/images/avatar.png',
    placeId: 3,
    rating: 3.5,
    content: "ene ih goy gazar baina maniahan zaaval aylaarai 2",
    dateCreated: "2021/04/22",
  ),
  Review(
    reviewId: 1,
    userId: 1,
    userName: 'sandan',
    avatar: 'assets/images/avatar.png',
    placeId: 3,
    rating: 3.5,
    content: "ene ih goy gazar baina maniahan zaaval aylaarai 2",
    dateCreated: "2021/04/22",
  ),Review(
    reviewId: 1,
    userId: 1,
    userName: 'sandan',
    avatar: 'assets/images/avatar.png',
    placeId: 3,
    rating: 3.5,
    content: "ene ih goy gazar baina maniahan zaaval aylaarai 2",
    dateCreated: "2021/04/22",
  ),Review(
    reviewId: 1,
    userId: 1,
    userName: 'sandan',
    avatar: 'assets/images/avatar.png',
    placeId: 3,
    rating: 3.5,
    content: "ene ih goy gazar baina maniahan zaaval aylaarai 2",
    dateCreated: "2021/04/22",
  ),
];
