
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofinwebapp/models.dart';

class QuoteWidget extends StatelessWidget {
  final String symbol;
  const QuoteWidget({Key? key, required this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote: " + this.symbol),
      ),
      body: FutureBuilder<Quote>(
          future: new QuoteRequest().getQuote(this.symbol),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Table(
                border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      TableCell(child: Text("Symbol")),
                      TableCell(child: Text(snapshot.data!.symbol))
                    ]
                  ),

                  TableRow(
                    children: <Widget>[
                      TableCell(child: Text("DisplayName")),
                      TableCell(child: Text(snapshot.data!.displayName))
                    ]
                  ),

                  TableRow(
                      children: <Widget>[
                        TableCell(child: Text("Ask")),
                        TableCell(child: Text(snapshot.data!.ask.toStringAsFixed(2)))
                      ]
                  ),

                  TableRow(
                      children: <Widget>[
                        TableCell(child: Text("Bid")),
                        TableCell(child: Text(snapshot.data!.bid.toStringAsFixed(2)))
                      ]
                  ),

                  TableRow(
                      children: <Widget>[
                        TableCell(child: Text("Currency")),
                        TableCell(child: Text(snapshot.data!.currency))
                      ]
                  ),

                  TableRow(
                      children: <Widget>[
                        TableCell(child: Text("TrailingPE")),
                        TableCell(child: Text(snapshot.data!.trailingPE.toStringAsFixed(2)))
                      ]
                  ),

                  TableRow(
                      children: <Widget>[
                        TableCell(child: Text("ForwardPE")),
                        TableCell(child: Text(snapshot.data!.forwardPE.toStringAsFixed(2)))
                      ]
                  ),

                ],
              );
            // return Text(snapshot.data!.symbol);
            } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
