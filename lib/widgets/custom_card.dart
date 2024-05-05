import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Card(

          child: Row(
            children: [
              Image.network('assets/images/TKAMB_1000_3D.png'),
              Column(
                children: [
                  Text('HOME',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                  Gap(50),
                  Text('SHOP',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                  Gap(50),
                  Text('CONTACT',style:TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
                  Gap(50),
                ],
              )
            ],
          ),

          // child: CachedNetworkImage(
          //   imageUrl: 'https://bigaband.com/wp-content/uploads/2020/06/TKAMB_1000_3D.jpg',
          //   fit: BoxFit.cover,
          //   width: 400,
          //   placeholder: (context,url) => const CircularProgressIndicator(),
          //   errorWidget: (context,url,error) => const Icon(Icons.error),
          // ),
        ),
      ),
    );
  }
}
