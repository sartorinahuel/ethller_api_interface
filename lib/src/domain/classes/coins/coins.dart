part of ethller_api_interface;

class Coin {
  String uuid;
  String symbol;
  String name;
  String color;
  String iconUrl;
  String marketCap;
  int listedAt;
  int tier;
  String change;
  int rank;
  String coinrankingUrl;
  String l24hVolume;
  String btcPrice;

  Coin({
    this.uuid,
    this.symbol,
    this.name,
    this.color,
    this.iconUrl,
    this.marketCap,
    this.listedAt,
    this.tier,
    this.change,
    this.rank,
    this.coinrankingUrl,
    this.l24hVolume,
    this.btcPrice,
  });

  @override
  String toString() {
    return 'Coin(uuid: $uuid, symbol: $symbol, name: $name, color: $color, iconUrl: $iconUrl, marketCap: $marketCap, listedAt: $listedAt, tier: $tier, change: $change, rank: $rank, coinrankingUrl: $coinrankingUrl, 24hVolume: $l24hVolume, btcPrice: $btcPrice)';
  }

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      uuid: json['uuid'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      iconUrl: json['iconUrl'] as String,
      marketCap: json['marketCap'] as String,
      listedAt: json['listedAt'] as int,
      tier: json['tier'] as int,
      change: json['change'] as String,
      rank: json['rank'] as int,
      coinrankingUrl: json['coinrankingUrl'] as String,
      l24hVolume: json['l24hVolume'] as String,
      btcPrice: json['btcPrice'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'symbol': symbol,
      'name': name,
      'color': color,
      'iconUrl': iconUrl,
      'marketCap': marketCap,
      'listedAt': listedAt,
      'tier': tier,
      'change': change,
      'rank': rank,
      'coinrankingUrl': coinrankingUrl,
      'l24hVolume': l24hVolume,
      'btcPrice': btcPrice,
    };
  }
}
