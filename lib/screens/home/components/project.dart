import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cv_web/core/utils/utils.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:my_cv_web/resource/styles.dart';

import 'package:my_cv_web/widgets/custom_animation_container.dart';
import 'package:my_cv_web/widgets/project_widget.dart';

import '../../../core/utils/responsive.dart';
import '../../../widgets/section_title.dart';

class ProjectModel {
  String name;
  String url;
  String image;
  String discription;
  List<String> lib;
  String objectType;

  ProjectModel({
    required this.name,
    required this.url,
    required this.image,
    required this.discription,
    required this.lib,
    required this.objectType,
  });
}

class Project extends StatefulWidget {
  const Project({
    Key? key,
  }) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  void initState() {
    super.initState();
  }

  List<ProjectModel> projects = [
    ProjectModel(
        objectType: 'Featured Project',
        name: 'Phenikaa School',
        url: 'https://apps.apple.com/us/app/phenikaa-school/id1518541982',
        image: 'images/phenikaa_project.png',
        discription:
            'A smart application for parents, students, teachers. Connect is a smart application for parents, students, and teachers. Connect directly with the school.',
        lib: ['Flutter', 'Provider', 'BloC', 'Firebase', 'Native Library']),
    ProjectModel(
        objectType: 'Featured Project',
        name: 'MeCar',
        url: 'https://apps.apple.com/app/id1518751816',
        image: 'images/mecar_project.png',
        discription:
            "MeCar is an app that will contain anything you need for your car. You'll find car detail infos, ratings, suggestions for your first car. And all other services for your car like insurances, car maintenance, car evaluation and trading..",
        lib: ['Flutter', 'BloC', 'Firebase', 'Weblate']),
    ProjectModel(
        objectType: 'Freelancer Project',
        name: 'Sterling Home',
        url: 'https://apps.apple.com/ng/app/sterling-homes/id1554704038',
        image: 'images/sterling_project.png',
        discription:
            "A booking App for UK customer search through hundreds of available homes and use detailed filters such as price, home styles, communities, and more",
        lib: [
          'Flutter',
          'Clean-Architecture',
          'Firebase',
          'Retrofit',
          'Auth0'
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Responsive.screenHeight(context);
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 1000,
        child: CustomAnimationContainer(
          duration: const Duration(milliseconds: 500),
          position: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SectionTitle(
                  indexS: '03.', title: 'Some Things I’ve Built'),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                itemBuilder: ((context, index) => ProjectWidget(
                      project: projects[index],
                      reversed: index % 2 != 0,
                    )),
              ),
              const SizedBox(height: 120),
              Column(
                children: [
                  const Text(
                    'Other Noteworthy Projects',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorsDef.lightestSlate,
                      fontFamily: FontDef.calibre,
                      fontSize: 32,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: const [
                      PersonalProject(),
                      PersonalProject(),
                      PersonalProject(),
                      PersonalProject(),
                      PersonalProject(),
                      PersonalProject(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalProject extends StatelessWidget {
  const PersonalProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorsDef.lightNavy,
          boxShadow: const [
            BoxShadow(
              color: ColorsDef.naviShadow,
              offset: Offset(0, 10),
              blurRadius: 30,
              spreadRadius: -10,
            )
          ]),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.folder_outlined,
              color: ColorsDef.kPrimaryColor,
              size: 40,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  path('images/icon_github.svg'),
                  width: 24,
                  height: 24,
                  color: ColorsDef.lightestSlate,
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.open_in_new,
                  color: ColorsDef.lightestSlate,
                  size: 24,
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
