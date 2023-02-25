import 'package:flutter/material.dart';
import 'package:my_apps/constant.dart';
// import '../widgets/user_ava.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size ukuran = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: putih,
        body: Stack(
          children: [
            SizedBox(
              width: ukuran.width,
              height: ukuran.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // text Halo, Nama.
                      Container(
                        color: Colors.amber[100],
                        padding:
                            const EdgeInsets.only(top: 40, left: 30, right: 30),
                        height: 250,
                        child: Column(
                          children: const [
                            Text(
                              'Halo!',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Annisa',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),

                      // ava
                      // UserAva(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




        //   Container(
        // height: ukuran.height,
        // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black, width: 3),
        //   color: putih,
        //   borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(50),
        //   ),
        // ),