class serverAddDataResponse {
    final String resuldata;
    final String resultcode;
    final String resulttext;

    serverAddDataResponse({this.resuldata, this.resultcode, this.resulttext});

    factory serverAddDataResponse.fromJson(Map<String, dynamic> json) {
        return serverAddDataResponse(
            resuldata: json['resuldata'] as String,
            resultcode: json['resultcode']as String,
            resulttext: json['resulttext']as String,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['resuldata'] = this.resuldata;
        data['resultcode'] = this.resultcode;
        data['resulttext'] = this.resulttext;
        return data;
    }
}