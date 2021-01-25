part of ethller_api_interface;

class PoolData {
	List<dynamic> topMiners;
	List<MinedBlocks> minedBlocks;
	PoolStats poolStats;

	PoolData({
		this.topMiners,
		this.minedBlocks,
		this.poolStats,
	});

	factory PoolData.fromJson(Map<String, dynamic> json) {
		return PoolData(
			topMiners: json['topMiners'] as List<dynamic>,
			minedBlocks: (json['minedBlocks'] as List<MinedBlocks>)?.map((e) {
				return e == null ? null : MinedBlocks.fromJson(e as Map<String, dynamic>);
			})?.toList(),
			poolStats: json['poolStats'] == null
					? null
					: PoolStats.fromJson(json['poolStats'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'topMiners': topMiners,
			'minedBlocks': minedBlocks?.map((e) => e?.toJson())?.toList(),
			'poolStats': poolStats?.toJson(),
		};
	}
}
