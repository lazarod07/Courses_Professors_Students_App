import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/students_controller.dart';
import 'package:login_navigation/models/student.dart';
import 'package:provider/provider.dart';

class Single_student extends StatefulWidget {

  Student student;
  Single_student({Key key, @required this.student}) : super(key: key);
  @override
  _Singel_studentState createState() => _Singel_studentState(student);
}

class _Singel_studentState extends State<Single_student> {
  Student student;

  Student studentfull;

  String name = "";
  String phone = "";
  String un = "";
  String email = "";
  String city = "";
  String country = "";
  String birthday = "";

  _Singel_studentState(this.student);

  

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(studentfull == null){
      getStudent(pro.user.username, pro.user.token);
      // print(professors.length);
    }

    return studentShow();
  }

  getStudent(String username, String token) async {
    Students().fetchStudent(username, token, student.id, context).then((value){
      if(mounted){
        setState(() {
            studentfull = value;
            name = value.name;
            phone = value.phone;
            un = value.username;
            email = value.email;
            city = value.city;
            country = value.country;
            birthday = value.birthday;
        });
      }
    });
  }

  Widget studentShow(){
    return Scaffold(
      appBar: AppBar(
        title: Text(name)
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Text("Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  color: Color.fromRGBO( 227, 227, 227 , 1),
                  child: Column(
                    children: <Widget>[
                      showInfo("Name:       "+name),
                      Divider(
                        color: Colors.black
                      ),
                      showInfo("Username:      "+un),
                      Divider(
                        color: Colors.black
                      ),
                      showInfo("Phone:        "+phone),
                      Divider(
                        color: Colors.black
                      ),
                      showInfo("Email:       "+email),
                      Divider(
                        color: Colors.black
                      ),
                      showInfo("City:       "+city),
                      Divider(
                        color: Colors.black
                      ),
                      showInfo("Country:    "+country),
                      Divider(
                        color: Colors.black
                      ),
                      showInfo("Birthday:       "+birthday),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showInfo(String info){
    return(
      Expanded(
        child: Container(
          child: Text(info,
          style: TextStyle(fontSize: 16,color: Colors.black),),
          width: double.infinity,
          alignment: Alignment.centerLeft,
        ),
      )
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login_navigation/models/student.dart';

// class Single_student extends StatelessWidget {
//   final Student student;

//   Single_student({Key key, @required this.student}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student'),
//       ),
//       body: Center(
//         child: Container(
//           child: Text(student.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             textAlign: TextAlign.center,
//           )
//         ),
//       ),
//     );
//   }
// }