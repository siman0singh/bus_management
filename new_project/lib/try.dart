// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FutureBuilder(
//               future: _loadProfileImage(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else if (snapshot.hasData) {
//                   return CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: CachedNetworkImageProvider(snapshot.data),
//                   );
//                 } else {
//                   return CircleAvatar(
//                     radius: 50.0,
//                     backgroundColor: Colors.grey[300],
//                     // Placeholder image or initials can be added here
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<String?> _loadProfileImage() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

//       if (snapshot.exists) {
//         return snapshot.data()?['photoURL'];
//       }
//     }
//     return null;
//   }
// }