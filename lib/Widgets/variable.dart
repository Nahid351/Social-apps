import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(double size,[Color color,FontWeight fw=FontWeight.w700]){
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,


  );




}
var userCollection=FirebaseFirestore.instance.collection('users');
var vidioesCollection=FirebaseFirestore.instance.collection('vidioes');


StorageReference vidioesFolder=FirebaseStorage.instance.ref().child('vidioes');
StorageReference imagesFolder=FirebaseStorage.instance.ref().child('images');