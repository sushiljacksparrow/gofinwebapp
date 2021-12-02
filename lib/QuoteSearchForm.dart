import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofinwebapp/Quote.dart';

class QuoteSearchStatefulForm extends StatefulWidget {
  @override
  State<QuoteSearchStatefulForm> createState() => _QuoteSearchStatefulForm();

}

class _QuoteSearchStatefulForm extends State<QuoteSearchStatefulForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          // TextFormField(
          //   decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Enter Symbol'),
          //   controller: _controller,
          // ),
          TextField(
            textInputAction: TextInputAction.go,
            onSubmitted: (value)  {
              setState(() {
                print("state set");
                new Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: QuoteWidget(symbol: value),
                );
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search ',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            ),
          )
        ],
      ),
    );
  }

}
