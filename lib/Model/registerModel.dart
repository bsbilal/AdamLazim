class registerModel {
    String mail;
    String password;
    String path;
    String shownName;
    String username;

    registerModel({this.mail, this.password, this.path, this.shownName, this.username});

    factory registerModel.fromJson(Map<String, dynamic> json) {
        return registerModel(
            mail: json['mail'], 
            password: json['password'], 
            path: json['path'], 
            shownName: json['shownName'], 
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['mail'] = this.mail;
        data['password'] = this.password;
        data['path'] = this.path;
        data['shownName'] = this.shownName;
        data['username'] = this.username;
        return data;
    }
}