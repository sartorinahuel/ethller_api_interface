part of ethller_api_interface;

class Data {
	Stats stats;
	List<Coin> coins;

	Data({this.stats, this.coins});

	@override
	String toString() => 'Data(stats: $stats, coins: $coins)';

	factory Data.fromJson(Map<String, dynamic> json) {
		return Data(
			stats: json['stats'] == null
					? null
					: Stats.fromJson(json['stats'] as Map<String, dynamic>),
			coins: (json['coins'] as List<Coin>)?.map((e) {
				return e == null ? null : Coin.fromJson(e as Map<String, dynamic>);
			})?.toList(),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'stats': stats?.toJson(),
			'coins': coins?.map((e) => e?.toJson())?.toList(),
		};
	}
}
