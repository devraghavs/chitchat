import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
      String _userEmail='';
    String _userName='';
    String _userPassword='';
    var _isLogin=true;
   
  void _trySubmit(){
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus(); //it closes the keybord as we completed the entry


    if (isValid){
      _formKey.currentState.save();
      print(_userEmail);
      print(_userName);
      print(_userPassword);
      //use values to send our auth request
    }
  }
  @override

  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key:ValueKey('email'), //halt code to  our own identifier
                    validator: (value){
                      if (value.isEmpty || !value.contains('@')){
                        return 'Please enter a valid email address.';
                      }
                      return null;

                    },

                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                    onChanged:(value){
                      _userEmail=value;
                    },
                  ),
                  if (!_isLogin)
                  TextFormField(
                    key:ValueKey('Username'),
                    inputFormatters: [LengthLimitingTextInputFormatter(5)],
                     validator: (value){
                      if (value.isEmpty || value.length < 8){
                        return 'Username must be at least 8 characters long!';
                      }
                      return null;

                    },
                    

                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Username'),
                    onChanged:(value){
                      _userName=value;
                    },
                  ),
                  TextFormField(
                    key:ValueKey('Password'),
                     validator: (value){
                      if (value.isEmpty || value.length < 8){
                        return 'Password must be at least 8 characters long!';
                      }
                      return null;

                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    onChanged:(value){
                      _userPassword=value;
                    },
                  ),
                  SizedBox(height: 12),
                  RaisedButton(
                    child: Text(_isLogin?'Login': 'Signup'),
                    onPressed: _trySubmit,

                  ),
                  FlatButton(
                    //textColor: Theme.of(context).primaryColor,
                    child: Text(_isLogin ? 'Create new account': 'I already have an account'),onPressed: (){
                      setState(() {
                        _isLogin=!_isLogin;
                      });
                    },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
