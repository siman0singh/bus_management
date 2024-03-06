import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('attendance').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Show loading indicator while fetching data
          }

          var isActive = snapshot.data?.docs[0]['isActive']; // Assuming 'active' is the field in your document

          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Attendance')),
            ),
            body: Center(
              child: Container(
                width: 200,
                height: 100,
                color: isActive ? Colors.green : Colors.grey[800], // Set colors based on the 'active' field
                child: Center(
                  child: Text(
                    isActive ? 'Active' : 'Inactive',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}