class User {

  User({
     required this.id,
     required this.username,
     required this.firstName,
     required this.lastName,
  });

  final String id;
  final String username;
  final String firstName;
  final String lastName;

}

class Journal {

  Journal({
      required this.id,
      required this.title,
      required this.body,
      required this.thumbnail,
      required this.deleted,
      required this.isFavorite,
      required this.date,
  });

  final String id;
  final String title;
  final String body;
  final String thumbnail;
  final bool deleted;
  final bool isFavorite;
  final String date;

}
