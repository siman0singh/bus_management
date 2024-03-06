//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:major_project/changename.dart';
//import 'package:major_project/sidebar.dart';
//import 'package:major_project/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:new_project/DashBoard.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Future<User?> getCurrentUser() async {
//     return _auth.currentUser;
//   }

//   Future<Map<String, dynamic>?> getUserDataByUID(String uid) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> userSnapshot =
//           await _firestore.collection('users').doc(uid).get();

//       if (userSnapshot.exists) {
//         return userSnapshot.data();
//       } else {
//         return null; // User data not found
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//       return null;
//     }
//   }

// class PDetail extends StatefulWidget {
//   @override
//   @override
//   State<PDetail> createState() => _PDetail();
// }

// class _PDetail extends State<PDetail> {
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(233, 221, 244, 11),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => {
//             Navigator.pop(
//                 context, MaterialPageRoute(builder: (context) => DashBoard()))
//           },
//         ),
//         title: Center(
//           child: Text(
//             'Profile',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           // Card(
//           //   child: ListTile(
//           //     title: Text(FirebaseAuth.instance.currentUser!.displayName ??
//           //         'User name'),
//           //     onTap: (() => {
//           //           Navigator.push(context,
//           //               MaterialPageRoute(builder: (context) => changename()))
//           //         }),
//           //   ),
//           // ),
//           Card(
//   child: ListTile(
//     title: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Email:'),
//         Text(user.email!),
//       ],
//     ),
//     onTap: () {
//       // Handle onTap action
//     },
//   ),
// ),

//  getCurrentUser();  
    
//           // Card(
//           //   child: ListTile(
//           //     title: Text('Phone\n 9869001579'),
//           //     onTap: () => {},
//           //   ),
//           // ),
//           Card(
//             child: ListTile( 
//               title: Text('Language:\n English'),
//               onTap: () => {},
//             ),
//           )

//         ],
//       ),
//     );
//   }
// }
 

 class ProfilePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

 class _MyHomePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    User? user = _auth.currentUser;

    if (user != null) {
      setState(() {
        _user = user;
      });

      try {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await _firestore.collection('users').doc(user.uid).get();

        if (userSnapshot.exists) {
          setState(() {
            _userData = userSnapshot.data();
          });
        } else {
          print('User data not found');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('User not authenticated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STUDENT INFORMATION'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 50,
                child: Image.asset('images/profile.jpeg'),
              
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Text(_userData?['name']?? 'N/A',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              ),
            ),
              SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 600,
              height: 220,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
               Row(
                
                 children: [
                  Icon(Icons.email),
                   Text('Email: ${_user.email}'),
                 ],
               ),
              // Row(
              //   children: [
              //     Icon(Icons.person),
              //     Text('Name: ${_userData?['name'] ?? 'N/A'}'),
              //   ],
              // ),
              Row(
                children: [
                  Icon(Icons.numbers),
                  Text('Roll Number: ${_userData?['rollNumber'] ?? 'N/A'}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  Text('Gender: ${_userData?['gender'] ?? 'N/A'}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  Text('Phone Number: ${_userData?['phoneNumber'] ?? 'N/A'}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_city),
                  Text('Address: ${_userData?['address'] ?? 'N/A'}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.car_rental),
                  Text('Driver: ${_userData?['driver'] ?? 'Asish Khanal'}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  Text('Contact no: ${_userData?['contact_phone'] ?? '9824374888'}'),
                ],
              ),
              
                ],),
              ),
            ),
                     ],
        ),
      ),
    );
  }
}