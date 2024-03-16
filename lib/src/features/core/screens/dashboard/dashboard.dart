import 'package:CMI/src/constants/colors.dart';
import 'package:CMI/src/constants/image_strings.dart';
import 'package:CMI/src/constants/text_strings.dart';
import 'package:CMI/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:CMI/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:CMI/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Text(
                tDashboardTitle,
                style: txtTheme.bodySmall,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.headlineMedium,
              ),
              const SizedBox(
                height: tDashboardPadding,
              ),
              
              //SearchBox
              DashboardSearchBox(txtTheme: txtTheme),
              const SizedBox(
                height: tDashboardPadding,
              ),
              // categoriesB(txtTheme: txtTheme),
              const SizedBox(
                height: tDashboardPadding,
              ),
              Text(
                tDashboardTopCourses,
                style: txtTheme.headlineSmall?.apply(fontSizeFactor: 1.2),
              ),
              DashboardCategories(txtTheme: txtTheme),
              const SizedBox(
                height: tDashboardPadding,
              ),

              Text(
                tDashboardTopCourses,
                style: txtTheme.headlineSmall?.apply(fontSizeFactor: 1.2),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: 320,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, top:5 ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tCardBgColor),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Flutter Crash Course",
                                      style: txtTheme.headlineSmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Flexible(
                                      child: Image(
                                    image: AssetImage(tTopCourseImage1),
                                    height: 110,
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.play_arrow),
                                  ),
                                  const SizedBox(width: tDashboardCardPadding),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "3 Sections",
                                        style: txtTheme.headlineSmall,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "Programming Languages",
                                        style: txtTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                       SizedBox(
                      width: 320,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Flutter Crash Course",
                                    style: txtTheme.headlineSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Flexible(
                                    child: Image(
                                  image: AssetImage(tTopCourseImage1),
                                  height: 110,
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.play_arrow),
                                ),
                                const SizedBox(width: tDashboardCardPadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "3 Sections",
                                      style: txtTheme.headlineSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Programming Languages",
                                      style: txtTheme.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                       SizedBox(
                      width: 320,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Flutter Crash Course",
                                    style: txtTheme.headlineSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Flexible(
                                    child: Image(
                                  image: AssetImage(tTopCourseImage1),
                                  height: 110,
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.play_arrow),
                                ),
                                const SizedBox(width: tDashboardCardPadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "3 Sections",
                                      style: txtTheme.headlineSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Programming Languages",
                                      style: txtTheme.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    
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

