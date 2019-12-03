import 'package:flutter/material.dart';
import 'package:hello_world/scoped_models/scoped_counters.dart';
// import  'package:scoped_models/scoped_model.dart';
// import '../../scoped_models/scoped_coutners.dart';
import 'package:scoped_model/scoped_model.dart';
import 'widget1.dart';
import 'widget2.dart';
import 'widget3.dart';


class MyHomePage extends StatelessWidget{
  final ScopedCounter scopedCounter = ScopedCounter();

  @override
  Widget build(BuildContext context){
    return ScopedModel<ScopedCounter>(
      model: scopedCounter,
      child: Scaffold(
        appBar: AppBar(
          title: Text('hello world with Scoped Model')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Widget1(),
              Widget2(),  
              Widget3(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => scopedCounter.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      )
    );
  }
  
}