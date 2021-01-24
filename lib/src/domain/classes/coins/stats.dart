part of ethller_api_interface;

class Stats {
	int total;
	int totalMarkets;
	int totalExchanges;
	String totalMarketCap;
	String total24hVolume;

	Stats({
		this.total,
		this.totalMarkets,
		this.totalExchanges,
		this.totalMarketCap,
		this.total24hVolume,
	});

	@override
	String toString() {
		return 'Stats(total: $total, totalMarkets: $totalMarkets, totalExchanges: $totalExchanges, totalMarketCap: $totalMarketCap, total24hVolume: $total24hVolume)';
	}

	factory Stats.fromJson(Map<String, dynamic> json) {
		return Stats(
			total: json['total'] as int,
			totalMarkets: json['totalMarkets'] as int,
			totalExchanges: json['totalExchanges'] as int,
			totalMarketCap: json['totalMarketCap'] as String,
			total24hVolume: json['total24hVolume'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'total': total,
			'totalMarkets': totalMarkets,
			'totalExchanges': totalExchanges,
			'totalMarketCap': totalMarketCap,
			'total24hVolume': total24hVolume,
		};
	}
}
