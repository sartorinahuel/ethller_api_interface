class Price {
	double usd;
	double btc;

	Price({this.usd, this.btc});

	factory Price.fromJson(Map<String, dynamic> json) {
		return Price(
			usd: json['usd'] as double,
			btc: json['btc'] as double,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'usd': usd,
			'btc': btc,
		};
	}
}
