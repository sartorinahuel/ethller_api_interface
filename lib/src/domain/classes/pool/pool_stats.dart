part of ethller_api_interface;

class PoolStats {
  num hashRate;
  int miners;
  int workers;
  num blocksPerHour;

  PoolStats({
    this.hashRate,
    this.miners,
    this.workers,
    this.blocksPerHour,
  });

  factory PoolStats.fromJson(Map<String, dynamic> json) {
    return PoolStats(
      hashRate: (json['hashRate'] as num) / 1000000000000, //For TH/s
      miners: json['miners'] as int,
      workers: json['workers'] as int,
      blocksPerHour: json['blocksPerHour'] as num,
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
