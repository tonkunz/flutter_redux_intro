import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_intro/store/app_actions.dart';
import 'package:flutter_redux_intro/store/app_state.dart';
import 'package:flutter_redux_intro/store/app_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: MaterialApp(
        title: 'Flutter Demo With Redux',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.purple
        ),
        home: MyHomePage(title: 'Flutter With Redux'),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have tapped the button this many times:',
            ),
            StoreConnector<AppState, int>(
              converter: (store) => store.state.counter,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed:  () {
              StoreProvider.of<AppState>(context)
                .dispatch(DecrementCounter());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context)
                .dispatch(IncrementCounter());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }
}