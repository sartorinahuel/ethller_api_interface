import 'data.dart';

class Pools {
	String status;
	PoolData poolData;

	Pools({this.status, this.poolData});

	factory Pools.fromJson(Map<String, dynamic> json) {
		return Pools(
			status: json['status'] as String,
			poolData: json['data'] == null
					? null
					: PoolData.fromJson(json['data'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'status': status,
			'poolData': poolData?.toJson(),
		};
	}
}
