part of ethller_api_interface;

class CoinHistories {
  String status;
  CoinHistoriesData data;

  CoinHistories({this.status, this.data});

  CoinHistories.fromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.data = json['data'] == null ? null : CoinHistoriesData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    // ignore: omit_local_variable_types
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) data['data'] = this.data.toJson();
    return data;
  }
}

class CoinHistoriesData {
  String change;
  List<History> history;

  CoinHistoriesData({this.change, this.history});

  CoinHistoriesData.fromJson(Map<String, dynamic> json) {
    this.change = json['change'];
    this.history = json['history'] == null ? [] : (json['history'] as List).map((e) => History.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['change'] = this.change;
    if (this.history != null) data['history'] = this.history.map((e) => e.toJson()).toList();
    return data;
  }
}

class History {
  String price;
  int timestamp;

  History({this.price, this.timestamp});

  History.fromJson(Map<String, dynamic> json) {
    this.price = json['price'];
    this.timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
