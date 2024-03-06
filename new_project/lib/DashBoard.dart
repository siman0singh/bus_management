import 'package:flutter/material.dart';
import 'package:new_project/Notification.dart';
import 'package:new_project/attendance.dart';
import 'package:new_project/maps.dart';
import 'package:new_project/profile.dart';
// import 'package:new_project/Notification.dart';
//mport 'package:new_project/profile1.dart';


//import 'package:new_project/maps.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 247, 235, 11),
          title: const Text('BUS MANAGEMENT')),
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: IconButton(
                          icon: Image.asset(
                            "images/profile.jpeg",
                            width: 100,
                            height: 100,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  ProfilePage()));
                          },
                        ),
                      ),
                      const Text('profile',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "images/present.jpeg",
                          width: 100,
                          height: 100,
                        ),
                       onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Attendance()));
                        },
                      ),
                      const Text('attendance',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "images/map.jpeg",
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  MapScreen()));
                        },
                      ),
                      const Text(
                        'map',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "images/notification.jpeg",
                          width: 100,
                          height: 100,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  NotificationPage()));
                        },
                      ),
                      const Text('notification',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
