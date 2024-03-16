import 'package:flutter/material.dart';

import '../../../models/dashboard/books_model.dart';
class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
  final list = BooksCategoriesModel.list;

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
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child:
                              Image(image:list[index].Image,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    list[index].title,
                    style: txtTheme.headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(list[index].author,
                      style: txtTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
                  ),
              ),
            ),
        ),
      );


    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         child: Container(
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               color: tCardBgColor),
    //           padding: const EdgeInsets.symmetric(
    //               horizontal: 10, vertical: 20),
    //           child: Column(
    //             children: [
    //               const Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Flexible(
    //                       child:
    //                           Image(image: AssetImage(tBannerImage1))),
    //                 ],
    //               ),
    //               const SizedBox(height: 25),
    //               Text(
    //                 tDashBoardBannerTitle1,
    //                 style: txtTheme.headlineSmall,
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //               Text(tDashboardBannerSubTitle,
    //                   style: txtTheme.bodySmall,
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const SizedBox(
    //         width: tDashboardCardPadding,
    //       ),
    //       Expanded(
    //           child: Column(
    //         children: [
    //           Container(
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 color: tCardBgColor),
    //             padding: const EdgeInsets.symmetric(
    //                 horizontal: 10, vertical: 20),
    //             child: Column(
    //               children: [
    //                 const Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Flexible(
    //                         child: Image(
    //                             image: AssetImage(tBannerImage1))),
    //                   ],
    //                 ),
    //                 Text(
    //                   tDashBoardBannerTitle1,
    //                   style: txtTheme.headlineSmall,
    //                   maxLines: 2,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //                 Text(tDashboardBannerSubTitle,
    //                     style: txtTheme.bodySmall,
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //               width: double.infinity,
    //               // child: OutlinedButton(
    //               //     onPressed: () {},
    //               //     child: const Text(tDashboardButton),
    //               //     ),
    //                   ),
    //         ],
    //       ))
    //     ],
    //   ),
    // );
  }
}
