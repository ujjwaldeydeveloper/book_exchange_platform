import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Padding(
             padding: EdgeInsets.only(left: 8.0),
             child: Row(
               children: [
                 Image(image: AssetImage('assets/images/ic_book_store.png')),
                 Text('Book Exchange Point',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
               ],
             ),
           ),
           Gap(20),
            Row(
              children: [
                Text('HOME',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                Gap(50),
                Text('SHOP',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                Gap(50),
                Text('CONTACT',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                Gap(50),
              ],
            ),
            Gap(20),
            Icon(Icons.shopping_cart),
            Gap(20),
            Row(
              children: [
                Text('Log In',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                Gap(10),
                FittedBox(fit:BoxFit.cover, child : Icon(Icons.account_circle)),
              ],
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}