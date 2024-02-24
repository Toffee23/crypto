class BitcoinPrice {
  final Map<String, dynamic> time;
  final String disclaimer;
  final String chartName;
  final Map<String, dynamic> bpi;

  BitcoinPrice({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    return BitcoinPrice(
      time: json['time'],
      disclaimer: json['disclaimer'],
      chartName: json['chartName'],
      bpi: json['bpi'],
    );
  }

  String get updated => time['updated'];
  String get updatedISO => time['updatedISO'];
  String get updatedUK => time['updateduk'];

  BitcoinPriceData getUsdData() {
    return BitcoinPriceData.fromJson(bpi['USD']);
  }

  BitcoinPriceData getGbpData() {
    return BitcoinPriceData.fromJson(bpi['GBP']);
  }

  BitcoinPriceData getEurData() {
    return BitcoinPriceData.fromJson(bpi['EUR']);
  }
}

class BitcoinPriceData {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  BitcoinPriceData({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory BitcoinPriceData.fromJson(Map<String, dynamic> json) {
    return BitcoinPriceData(
      code: json['code'],
      symbol: json['symbol'],
      rate: json['rate'],
      description: json['description'],
      rateFloat: json['rate_float'].toDouble(),
    );
  }
}