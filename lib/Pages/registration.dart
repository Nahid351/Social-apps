import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Pages/login.dart';
import 'package:social_app/Widgets/variable.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  registerUser(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
     email: emailController.text.trim(),
      password: passwordController.text.trim(),


    ).then((signedUser){
    userCollection.doc(signedUser.user.uid).set({
      'username':usernameController.text,
      'Password':passwordController.text,
      'email':emailController.text,
      'uId':signedUser.user.uid,
      'profilePic':'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
    });

    });
    Navigator.pop(context);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Social App',style: myStyle(30,Colors.orangeAccent,FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Registration',style: myStyle(25,Colors.black,FontWeight.w600),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      labelStyle: myStyle(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )


                  ),



                ),



              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail),
                      labelStyle: myStyle(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )


                  ),



                ),



              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      labelStyle: myStyle(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )


                  ),



                ),



              ),
              SizedBox(height: 10,),
              InkWell(
                onTap:(){
                registerUser();


                } ,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),


                  ),
                  child: Center(
                    child: Text('Register',style: myStyle(20,Colors.white,FontWeight.w600),),


                  ),


                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don,t have an account?',style: myStyle(16),),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginPage()));

                    },
                    child: Text(
                      'Login',style: myStyle(16,Colors.orangeAccent),
                    ),
                  ),



                ],


              )




            ],


          ),




        ),
      ),
    );
  }
}
