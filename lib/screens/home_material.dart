import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeMaterial extends StatefulWidget{
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formkey = GlobalKey<FormState>();
  final _user = User();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
            padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
              builder: (context) => Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Please Input your First name';
                        }
                      },
                      onSaved: (val) => setState(() => _user.firstName = val),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Please Input your First name';
                        }
                      },
                      onSaved: (val) => setState(() => _user.lastName = val),
                      ),
                    Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Text('Subscribe'),
                    ),
                    SwitchListTile(
                      title: const Text('Monthly Newsletter'),
                      value: _user.newletter,
                      onChanged: (bool val){
                        setState(() => _user.newletter = val);
                      },
                      
                    ),
                    Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Text('Interests'),
                    ),
                    CheckboxListTile(
                      title: const Text('Cooking'),
                      value: _user.passions[User.PassionCooking],
                      onChanged: (val){
                        setState(() => _user
                          .passions[User.PassionCooking] = val );
                      }
                    ),
                    CheckboxListTile(
                      title: const Text('Hiking'),
                      value: _user.passions[User.PassionHiking],
                      onChanged: (val){
                        setState(() => _user
                          .passions[User.PassionHiking] = val );
                      }
                    ),
                    CheckboxListTile(
                      title: const Text('Traveling'),
                      value: _user.passions[User.PassionTraveling],
                      onChanged: (val){
                        setState(() => _user
                          .passions[User.PassionTraveling] = val );
                      }
                    ),
                    Container(
                      
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0
                      ),
                      child: RaisedButton(
                        onPressed: (){
                        final form = _formkey.currentState;

                        if(form.validate()){
                          form.save();
                          _user.save();
                          _showDialog(context);
                        }
                      },
                      child: Text('Save'),

                      ),
                      
                    )


                  ],
                )
              )
            )
      ),
    );
  }
}
_showDialog(BuildContext context){
  Scaffold.of(context)
      .showSnackBar(SnackBar(content: Text('Submitting form')));
}