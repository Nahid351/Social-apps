import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Widgets/variable.dart';




class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<QuerySnapshot> searchResults;
  searchUser(String searchUser){
    var users = userCollection.where('username',isGreaterThanOrEqualTo: searchUser).get();
    setState(() {
      searchResults = users;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            hintText: 'Search For User',
            hintStyle: myStyle(18),
          ),
          onFieldSubmitted: searchUser,
        ),
      ),
      body: searchResults == null ? Center(
        child: Text('Search User',style: myStyle(25)),
      ):FutureBuilder(
        future: searchResults,
        builder: (BuildContext context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index){
              DocumentSnapshot user = snapshot.data.docs[index];
              return ListTile(
                leading: Icon(Icons.search),
                trailing: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(user.data()['profilePic']),
                ),
                title: Text(
                  user.data()['username'],style: myStyle(20),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
