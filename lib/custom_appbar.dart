import 'package:book_exchange_platform/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/ic_book_store.png')),
                  Text(
                    'Book Exchange Point',
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/'),
                    child: const Text(
                      'HOME',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    )),
                const Gap(50),
                GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/shop'),
                    child: const Text(
                      'SHOP',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    )),
                const Gap(50),
                const Text(
                  'CONTACT',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                const Gap(50),
              ],
            ),
            const Gap(20),
            const Icon(Icons.shopping_cart),
            const Gap(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        appBar: AppBar(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('User Profile'),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset('assets/images/ic_book_store.png')
                            ],
                          ),
                        ),
                        actions: [
                          SignedOutAction((context) async {
                            Navigator.of(context).pop();
                            //first debug sol not working
                            await FirebaseAuth.instance.signOut();

                            //second debug sol not working
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.signOut().then((res) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );

                            ////
                            });
                          })
                        ],
                      ),
                    ));
              },
              child: const Row(
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  FittedBox(
                      fit: BoxFit.cover, child: Icon(Icons.account_circle)),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
