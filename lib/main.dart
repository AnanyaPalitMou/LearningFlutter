import 'package:flutter/material.dart';
import 'quotes.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  // List<String> quotes=[
  //   'Be yourself; everyone else is already taken',
  //   'I have nothing to declare except my genius',
  //   'The truth is rarely pure and never simple'
  // ];

  List<Quotes> quotes=[
    Quotes(text: 'Be yourself; everyone else is already taken', author: 'Oscar Wilde'),
    Quotes(text: 'I have nothing to declare except my genius', author: 'Oscar Wilde'),
    Quotes(text: 'The truth is rarely pure and never simple', author: 'Oscar Wilde'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       title: Text('Awesome Quotes'),
       centerTitle: true,
       backgroundColor: Colors.redAccent,
    ),
      body: Column(
        children: quotes.map((quote){
          return Text('${quote.text}-${quote.author}');
        }).toList(),

      ),
    );
  }
}


