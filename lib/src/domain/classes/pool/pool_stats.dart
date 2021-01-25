class PoolStats {
	double hashRate;
	int miners;
	int workers;
	double blocksPerHour;

	PoolStats({
		this.hashRate,
		this.miners,
		this.workers,
		this.blocksPerHour,
	});

	factory PoolStats.fromJson(Map<String, dynamic> json) {
		return PoolStats(
			hashRate: json['hashRate'] as double,
			miners: json['miners'] as int,
			workers: json['workers'] as int,
			blocksPerHour: json['blocksPerHour'] as double,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'hashRate': hashRate,
			'miners': miners,
			'workers': workers,
			'blocksPerHour': blocksPerHour,
		};
	}
}
