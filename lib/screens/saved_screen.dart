import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/screens/testData.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class SavedScreen extends StatefulWidget {
  SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<String> docIDs = [];

  // Future getDocID() async {
  //   await FirebaseFirestore.instance.collection('Clothes').get().then(
  //         (snapshot) => snapshot.docs.forEach((document) {
  //           print(document.reference);
  //           docIDs.add(document.reference.id);
  //         }),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavbar()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 22,
                      ),
                    ),
                    Text(
                      "Saved",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.more_horiz,
                        size: 22,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Expanded(
                    //     child: FutureBuilder(
                    //       future: getDocID(),
                    //       builder: (context, snapshot) {
                    //         return ListView.builder(
                    //           itemCount: docIDs.length,
                    //           itemBuilder: (context, index) {
                    //             return Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: ListTile(
                    //                 title: GetData(documentId: docIDs[index]),
                    //                 tileColor: Colors.deepPurple,
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
