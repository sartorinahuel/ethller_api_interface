part of ethller_api_interface;

class CoinsResponse {
	String status;
	Data data;

	CoinsResponse({this.status, this.data});

	@override
	String toString() {
		return 'CoinsData(status: $status, data: $data)';
	}

	factory CoinsResponse.fromJson(Map<String, dynamic> json) {
		return CoinsResponse(
			status: json['status'] as String,
			data: json['data'] == null
					? null
					: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}
}
