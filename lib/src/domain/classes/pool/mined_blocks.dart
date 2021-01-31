part of ethller_api_interface;

class MinedBlocks {
	int number;
	String miner;
	DateTime time;

	MinedBlocks({
		this.number,
		this.miner,
		this.time,
	});

	factory MinedBlocks.fromJson(Map<String, dynamic> json) {
		return MinedBlocks(
			number: json['number'] as int,
			miner: json['miner'] as String,
			time: DateTime.fromMillisecondsSinceEpoch(json['time'] * 1000),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'number': number,
			'miner': miner,
			'time': time,
		};
	}
}
