import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/utils/global.colors.dart';
import 'package:final_project/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List catlist = ["All", "Best Selling", "Jackets", "Shirts", "Pants", "Bags"];

  // List imgList = ["Jacket", "Pant", "Tshirt", "Bag"];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Clothes')
            .doc('nfdG3Qg8FRuBfOfwqE82')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          // print(snapshot.data!.docs);
          // List<DocumentSnapshot> documents = snapshot.data!.data()
          Map<dynamic, dynamic> data =
              snapshot.data!.data() as Map<dynamic, dynamic>;

          List<Map<dynamic, dynamic>> allItem = [
            ...data["men"].map((item) => {...item, "category": "men"}),
            ...data["women"].map((item) => {...item, "category": "women"})
          ];
          // print(data['men']); for only man
          // print(data['women']); for only woman
          print(allItem);
          // print(documents);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F8Fa),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text("Find Your Product"),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.notifications_none,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25, top: 20),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "images/cover.png",
                            width: MediaQuery.of(context).size.width / 1.2,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              for (int i = 0; i < catlist.length; i++)
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 18),
                                  decoration: BoxDecoration(
                                    color: catlist[i] == "All"
                                        ? GlobalColors.primaryLightColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    catlist[i],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: catlist[i] == "All"
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.width - 30 - 15) /
                                  (2 * 290),
                          mainAxisSpacing: 45,
                          crossAxisSpacing: 15,
                        ),
                        //Erorr from document
                        itemCount: allItem.length,
                        itemBuilder: (BuildContext context, int i) {
                          if (i % 2 == 0) {
                            return ProductCard(allItem[i]);
                          }
                          return OverflowBox(
                            maxHeight: 290.0 + 80.0,
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: ProductCard(allItem[i]),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // bottomNavigationBar: ButtonNavbar(),
          );
        });
  }
}

// class ButtonNavbar extends StatefulWidget {
//   const ButtonNavbar({super.key});

//   @override
//   State<ButtonNavbar> createState() => _ButtonNavbarState();
// }

// class _ButtonNavbarState extends State<ButtonNavbar> {
//   int _currentIndex = 0;
//   final screens = [HomeScreen(), SavedScreen(), CartScreen(), ProfileScreen()];

//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = HomeScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //body: screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         iconSize: 30,
//         selectedItemColor: GlobalColors.primaryMediumColor,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.heart), label: 'Saved'),
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.cart), label: 'Cart'),
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.person), label: 'Account'),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
