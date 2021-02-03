import'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email, _password, _name ;


  checkAuthentification() async{

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if(user != null){
        //home page
        Navigator.pushReplacementNamed(context,"/") ;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  Signup() async{


    if (_formkey.currentState.validate())
    {
      _formkey.currentState.save();
      try{
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);


        if (user!= null){

          await _auth.currentUser.updateProfile(displayName: _name);
          await Navigator.pushReplacementNamed(context,"/") ;
        }
      }
      catch (e)
      {
        showError(e.errormessage);
      }
    }

  }

  showError(String message)
  {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title:Text('ERROR'),
            content: Text(message),
            actions:<Widget> [

              FlatButton(
                  onPressed: ()
                  {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        }

    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.indigo[700],

        child: Stack(
          children: <Widget>[
            // Center Circle
            Align(
              child: Material(
                color: Colors.indigo,

                child: Container(
                  width: 400,
                  height: 600,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[
                    Image.asset('images/lake.jpg', width: 100, height: 100),
                    Container(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [

                            Container(
                              child: TextFormField(
                                cursorColor: Colors.deepOrange ,
                                validator: (input) {
                                  // ignore: missing_return
                                  if (input.isEmpty)
                                    return "Please Enter Name";
                                },
                                decoration:
                                InputDecoration(
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person)
                                ),
                                onSaved:
                                    (input) => _name = input,

                              ),
                            ),

                            SizedBox(height: 20),

                            Container(
                              child: TextFormField(
                                cursorColor: Colors.deepOrange ,
                                validator: (input) {
                                  // ignore: missing_return
                                  if (input.isEmpty)
                                    return "Please Enter Email id";
                                },
                                decoration:
                                InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email)
                                ),
                                onSaved:
                                    (input) => _email = input,

                              ),
                            ),
                            SizedBox(height: 20),
                            //password
                            Container(
                              child: TextFormField(
                                cursorColor: Colors.deepOrange ,
                                validator: (input) {
                                  // ignore: missing_return
                                  if (input.length < 6)
                                    return "Please provide minimum 10 character";
                                },
                                decoration:
                                InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  focusColor: Colors.deepOrange ,

                                ),
                                obscureText: true,
                                onSaved:
                                    (input) => _password = input,

                              ),
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              padding: EdgeInsets.only(left:30.0, right:30.0,top: 10, bottom: 10),
                              onPressed: Signup,
                              child: Text('SIGNUP',
                                  style: TextStyle(
                                    color:  Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular( 10.0),
                              ),
                              color: Colors.deepOrange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
