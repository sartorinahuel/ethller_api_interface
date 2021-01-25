import 'mined_blocks.dart';
import 'pool_stats.dart';
import 'price.dart';

class PoolData {
	List<dynamic> topMiners;
	List<MinedBlocks> minedBlocks;
	PoolStats poolStats;
	Price price;

	PoolData({
		this.topMiners,
		this.minedBlocks,
		this.poolStats,
		this.price,
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
			price: json['price'] == null
					? null
					: Price.fromJson(json['price'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'topMiners': topMiners,
			'minedBlocks': minedBlocks?.map((e) => e?.toJson())?.toList(),
			'poolStats': poolStats?.toJson(),
			'price': price?.toJson(),
		};
	}
}
