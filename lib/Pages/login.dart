

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Pages/confirm_page.dart';

import 'package:social_app/Pages/registration.dart';
import 'package:social_app/Widgets/variable.dart';
import 'package:social_app/tabs/add_vidieo.dart';
import 'package:social_app/tabs/search_page.dart';
import 'package:social_app/tabs/vidieo_page.dart';





class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  loginUser(){
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),

      );
    }catch(e){
      SnackBar snackBar=SnackBar(content:Text('Email or Password Invalid'));
      Scaffold.of(context).showSnackBar(snackBar);


    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
     alignment: Alignment.center,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
   Text('Social App',style: myStyle(30,Colors.orangeAccent,FontWeight.bold),
   ),
            SizedBox(height: 10),
            Text('Login',style: myStyle(25,Colors.black,FontWeight.w600),
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
                loginUser();
              },
              child: Container(
              width: MediaQuery.of(context).size.width/1.5,
                height: 50,
                decoration: BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(20),


                ),
                child: Center(
                  child: InkWell(
                      onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>AddVideoPage()));
                      },
                      child: Text('Login',style: myStyle(20,Colors.white,FontWeight.w600),)),

                  
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
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                   },
                   child: InkWell(
                     onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VidieoPage()));
                     },
                     child: Text(
                       'Register',style: myStyle(16,Colors.orangeAccent),
                     ),
                   ),
                 ),




              ],


            )




          ],


        ),




      ),
    );
  }
}
