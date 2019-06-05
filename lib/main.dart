import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counterInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider pattern counter',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => CounterInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider pattern counter'),
        ),
        body: CounterWidget(),
        floatingActionButton: CustomFloatingActionButton(),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterInfo = Provider.of<CounterInfo>(context);
    return Center(
      child: Text(counterInfo.counter.toString()),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterInfo = Provider.of<CounterInfo>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            counterInfo.incrementCounter();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(height: 15),
        FloatingActionButton(
          onPressed: () {
            counterInfo.decrementCounter();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
