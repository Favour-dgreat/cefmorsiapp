import 'package:CMI/src/features/core/models/dashboard/categories_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class categoriesB extends StatelessWidget {
  const categoriesB({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
              width: 170,
              height: 45,
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: tDarkColor),
                    child: Center(
                      child: Text(
                        list[index].title,
                        style: txtTheme.headlineSmall
                            ?.apply(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list[index].heading,
                          style: txtTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          list[index].subHeading,
                          style: txtTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        ),
        // children: [
         
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: tDarkColor),
        //           child: Center(
        //             child: Text(
        //               "JS",
        //               style: txtTheme.headlineSmall
        //                   ?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(width: 5),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'JavaScript',
        //                 style: txtTheme.headlineSmall,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 Lessons',
        //                 style: txtTheme.bodySmall,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: tDarkColor),
        //           child: Center(
        //             child: Text(
        //               "JS",
        //               style: txtTheme.headlineSmall
        //                   ?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(width: 5),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'JavaScript',
        //                 style: txtTheme.headlineSmall,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 Lessons',
        //                 style: txtTheme.bodySmall,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}

