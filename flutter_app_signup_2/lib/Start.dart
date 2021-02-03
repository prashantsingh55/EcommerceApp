import 'package:flutter/material.dart';
import 'package:flutter_app_signup_2/SignUp.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'Login.dart';


class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigateToLogin() async{
    Navigator.pushReplacementNamed(context,"Login") ;
  }
  navigateToRegister() async{
    Navigator.pushReplacementNamed(context,"SignUp") ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child:Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/lake.jpg"),
                      fit: BoxFit.cover  ,
                    ),
                  ),
                )
            ),
            Expanded(
                child: Column(
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                       /*  TextSpan(
                            text: "WELCOME HERE.",
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.display1,
                          ),

                        */
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center  ,
                      children: [
                        RaisedButton(
                          padding: EdgeInsets.only(left:30.0, right:30.0,top: 10, bottom: 10),
                          onPressed: navigateToLogin,
                          child: Text("LOGIN",style: TextStyle(
                            color:  Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular( 10.0),
                          ),
                          color: Colors.deepOrange,
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          padding: EdgeInsets.only(left:30.0, right:30.0,top: 10, bottom: 5),
                          onPressed: navigateToRegister,
                          child: Text("REGISTER",style: TextStyle(
                            color:  Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular( 10.0),
                          ),
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SignInButton(
                      Buttons.Google,
                      padding: EdgeInsets.only(left:30.0, right:30.0,top: 5, bottom: 1),
                    //  text: "Sign up with Google",
                      onPressed: () {},

                    ),
                    SignInButton(
                      Buttons.FacebookNew,
                      padding: EdgeInsets.only(left: 30.0, right:30.0,top:5,bottom: 10),
                      onPressed: (){},
                    ),

                  ],
                ))
          ],
        )
    );
  }
}