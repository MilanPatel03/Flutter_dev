class CommentsModel {
  List<Comments>? comments;
  int? total;
  int? skip;
  int? limit;

  CommentsModel({this.comments, this.total, this.skip, this.limit});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Comments {
  int? id;
  String? body;
  int? postId;
  int? likes;
  User? user;

  // Add a new field for storing sentiment
  String? sentiment; // Possible values: "Positive", "Negative", "Neutral"

  Comments({this.id, this.body, this.postId, this.likes, this.user, this.sentiment});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    postId = json['postId'];
    likes = json['likes'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    // Default sentiment to null; to be updated later via API
    sentiment = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['postId'] = this.postId;
    data['likes'] = this.likes;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    // Include sentiment in JSON if available
    if (this.sentiment != null) {
      data['sentiment'] = this.sentiment;
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? fullName;

  User({this.id, this.username, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    return data;
  }
}
