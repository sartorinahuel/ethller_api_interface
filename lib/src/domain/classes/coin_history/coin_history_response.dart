part of ethller_api_interface;

class CoinHistoryResponse {
	String status;
	CoinHistory coinHistory;

	CoinHistoryResponse({this.status, this.coinHistory});

	@override
	String toString() {
		return 'CoinHistoryResponse(status: $status, data: $coinHistory)';
	}

	factory CoinHistoryResponse.fromJson(Map<String, dynamic> json) {
		return CoinHistoryResponse(
			status: json['status'] as String,
			coinHistory: json['coinHistory'] == null
					? null
					: CoinHistory.fromJson(json['coinHistory'] as Map<String, dynamic>),
		);
	}
}
