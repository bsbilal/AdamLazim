class serverAddDataResponse {
    String resultcode;
    String resuldata;
    String resulttext;

    serverAddDataResponse({this.resultcode, this.resuldata, this.resulttext});

    serverAddDataResponse.fromJson(Map<String, dynamic> json) {
        resultcode = json['resultcode'];
        resuldata = json['resuldata'];
        resulttext = json['resulttext'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['resultcode'] = this.resultcode;
        data['resuldata'] = this.resuldata;
        data['resulttext'] = this.resulttext;
        return data;
    }
}