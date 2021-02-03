import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Start.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool Isloggedin = false;
  User user;

  checkAuthentification() async{

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if(user == null){
        //home page
        Navigator.pushReplacementNamed(context,"Start") ;
      }
    });

  }

  getUser() async
  {
    User firebaseuser = _auth.currentUser ;
    await firebaseuser?.reload();
    await firebaseuser?.reload();
    firebaseuser = _auth.currentUser ;

    if (firebaseuser != null)
    {
      setState(() {
        this.user = firebaseuser ;
        this.Isloggedin = true;

      });

    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  signOut() async{

    _auth.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.indigo[900] ,
        title: Text("LocalHo") ,
        centerTitle: true,

      ),
      // drawer: MainDrawer(),

      body: Container(

          child: !Isloggedin? CircularProgressIndicator():
          Column(
            children: [
              Container(
                  child: Text('Hello ${user.displayName} you are loggedIn' )
              ),
              RaisedButton(
                padding: EdgeInsets.only(left:30.0, right:30.0,top: 10, bottom: 10),
                onPressed: signOut,
                child: Text('SIGNOUT',
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
          )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        //      getPdfandUpload();
      },
        child: Icon(Icons.add,color:Colors.white),
        backgroundColor: Colors.indigo[900],
      ),
    );
  }
}
