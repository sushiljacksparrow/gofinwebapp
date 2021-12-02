import 'dart:convert';
import 'package:http/http.dart';


class QuoteRequest {


  Future<Quote> getQuote(String symbol) async {

    // await http.Get(Uri.Parse("http://localhost:8000/AMZN"));
    var uri = Uri.parse("http://localhost:8000/AMZN");
    Client client = Client();


    Response response = await client.get(uri, headers: {
     /* "Access-Control-Allow-Origin": "*",
      "Accept": "application/json",
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"*/
    });
    print(response.body);
    /*var encodedQuote = jsonEncode(new Quote(symbol: "AMZN", quoteType: "Equity", displayName: "Amazon.com", bid: 3300.00, ask: 3300.00, quoteSourceName: "NASDAQ", currency: "USD", trailingPE: 30.0, forwardPE: 15.0));
    print(encodedQuote);*/
    var quote = Quote.fromJson(jsonDecode(response.body));
      return quote;
  }
}

class Quote {
  final String symbol;
  final String quoteType;
  final String displayName;
  final double bid;
  final double ask;
  final String quoteSourceName;
  final String currency;
  final double trailingPE;
  final double forwardPE;

  Quote({
    required this.symbol,
    required this.quoteType,
    required this.displayName,
    required this.bid,
    required this.ask,
    required this.quoteSourceName,
    required this.currency,
    required this.trailingPE,
    required this.forwardPE,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      symbol: json['symbol'],
      quoteType: json['quoteType'],
      displayName: json['DisplayName'],
      bid: json['Bid'],
      ask: json['Ask'],
      quoteSourceName: json['QuoteSourceName'],
      currency: json['Currency'],
      trailingPE: json['TrailingPE'],
      forwardPE: json['ForwardPE']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': this.symbol,
      'quoteType': this.quoteType,
      'displayName': this.displayName,
      'bid': this.bid,
      'ask': this.ask,
      'quoteSourceName': this.quoteSourceName,
      'currency': this.currency,
      'trailingPE': this.trailingPE,
      'forwardPE': this.forwardPE
    };
  }
}