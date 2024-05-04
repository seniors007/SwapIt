import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/profile_information.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: ProfileInfo(),
        ),
        Text(
          'Hi user \nHere what is \ngoing on today.',
          style: TextStyle(
            fontSize: 45,
            color: kYellowColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        kDivider,
        SizedBox(
          height: 5,
        ),
        Text(
          'Services For You',
          style: TextStyle(
            fontSize: 20,
            color: kGreenColor,
          ),
        ),
      ],
    );
  }
}



//---------->not used <-----------------------
//  Container(
//             height: 175,
//             width: 350,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                     blurRadius: 20,
//                     color: Colors.grey.withOpacity(.50),
//                     spreadRadius: 0,
//                     offset: const Offset(10, 10)),
//               ],
//             ),
//             child: Card(
//               elevation: 0,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'No tasks schduled today',
//                       style: TextStyle(color: Colors.black, fontSize: 20),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     const Text(
//                       'Make sure your avilability is up to date so \n         that you can receive new tasks',
//                       style: TextStyle(color: Colors.grey, fontSize: 13),
//                     ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Text(
                    //     'See my Avilability',
                    //     style: TextStyle(
                    //         decoration: TextDecoration.underline,
                    //         color: kYellowColor,
                    //         fontSize: 20),
                    //   ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),