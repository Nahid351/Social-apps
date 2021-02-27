import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Widgets/variable.dart';


class ProfilePage extends StatefulWidget {
  final String uId;
  ProfilePage(this.uId);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username;
  String onlineUser;
  String profilePic;
  int likes =0;
  Future myVideos;
  bool dataIsThere = false;

  getAllData()async{
    // get video as future
    myVideos = vidioesCollection.where('uId',isEqualTo: widget.uId).get();
    //get userdata
    DocumentSnapshot userDoc = await userCollection.doc(widget.uId).get();
    username = userDoc.data()['username'];
    profilePic = userDoc.data()['profilePic'];
    // get likes
    var documents = await vidioesCollection.where('uId',isEqualTo: widget.uId).get();
    for(var item in documents.docs){
      likes = item.data()['likes'].length + likes;
    }
    setState(() {
      dataIsThere = true;
    });
  }
  @override
  void initState() {
    super.initState();
    getAllData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataIsThere == false ? Center(
        child: CircularProgressIndicator(),// run app
      ): SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.greenAccent,
                backgroundImage: NetworkImage(profilePic),
              ),
              SizedBox(height: 20),
              Text(username,style: myStyle(20,Colors.black,FontWeight.w500)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('25',style: myStyle(20,Colors.black,FontWeight.bold)),
                  Text('50',style: myStyle(20,Colors.black,FontWeight.bold)),
                  Text(likes.toString(),style: myStyle(20,Colors.black,FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Following',style: myStyle(15,Colors.grey,FontWeight.w600)),
                  Text('Fans',style: myStyle(15,Colors.grey,FontWeight.w600)),
                  Text('Hearts',style: myStyle(15,Colors.grey,FontWeight.w600)),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 40,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Edit Profile',style: myStyle(20,Colors.white,FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('My Videos',style: myStyle(20)),
              SizedBox(height: 10),
              FutureBuilder(
                future: myVideos,
                builder: (BuildContext context, snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext contex, int index){
                      DocumentSnapshot video = snapshot.data.docs[index];
                      return Container(
                        child: Image(
                          image: NetworkImage(video.data()['previewImage']),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
