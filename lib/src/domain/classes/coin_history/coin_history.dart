part of ethller_api_interface;

class CoinHistory {
  String coinId;
	double price;
	DateTime date;

	CoinHistory({this.price, this.date, this.coinId});

	@override
	String toString() {
		return 'CoinHistory(price: $price, date: $date, coinId: $coinId)';
	}

	factory CoinHistory.fromJson(Map<String, dynamic> json) {
		return CoinHistory(
			price: json['price'] as double,
			date: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int),
		);
	}

	Map<String, dynamic> toJson() {
		return {
      'coinId': coinId,
			'date': date.millisecondsSinceEpoch,
			'price': price,
		};
	}
}
