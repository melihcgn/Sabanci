// class User {
//   String username;
//   String email;
//   String password;
//   int followers = 0;
//   int following = 0;
//   late TempUser posts;
//   Topic? topics;
//   // Notification? notifications;
//
//   User({
//     required this.username,
//     required this.email,
//     required this.password,
//   });
//
//   @override
//   String toString() {
//     // TODO: implement toString
//     print('$this.username, $this.email, $this.password');
//     return super.toString();
//   }
// }
class Post1{
  String caption;
  List<String> topics;
  String image;
  int likes;
  int comments;

  Post1 ({
    required this.caption,
    required this.topics,
    required this.image,
    required this.likes,
    required this.comments,
});
}

class User { // i changed post to this for now, ill edit it later. its the exact same as post, just different variable names so you can still use it like before
  String TempUsername;
  String pass;
  //String TempCaption;
  //int likes;
  //int comments;
 // String topics;
 // String image;
  String Email;
  String Location;
  Post1 post1;


  User({
    required this.TempUsername,
    required this.pass,
   // required this.TempCaption,
   // required this.likes,
   // required this.comments,
    //required this.topics,
    //required this.image,
    required this.Email,
    required this.Location,
    required this.post1,
  });
}

class searchFor{
  //TempUser tempuser;
  //String topics;

  //searchFor({
    //required this.topics,
   // required this.tempuser,
 // });
}

class Topic {
  String name;

  Topic({
    required this.name
  });
}

class tempNotification {
  String name;
  DateTime time;
  String Info;

  tempNotification(
      {required this.name, required this.time, required this.Info});
}
