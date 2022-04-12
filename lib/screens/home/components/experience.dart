import 'package:flutter/material.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';
import 'package:my_cv_web/widgets/mouse_region.dart';

import '../../../core/utils/responsive.dart';
import '../../../resource/colors.dart';
import '../../../widgets/content_line.dart';
import '../../../widgets/section_title.dart';

class Experience extends StatefulWidget {
  const Experience({
    Key? key,
  }) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final double _buttonHeight = 44;
  final int _companyLength = 4;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Responsive.screenHeight(context);

    final List<Widget> jobContentWidget = [
      _jobContent('MOBILE APPLICATION DEVELOPER', 'Feb 2022 - Present', [
        'Use Flutter/React Native to build Hotelier Booking/Management/Checking applications projects.',
        'Working closely with CEO and designers to translate mockups of new features into scalable components of the apps.',
        'Communicate with multi-disciplinary teams of engineers, designers, producers, and clients on a daily basis',
        'Building reusable code base projects for the team.',
        'Research and apply Blockchain, Smart Contract, Web3, Token, NFT for project',
        'Mentoring junior, intern members, review code.',
      ]),
      _jobContent('MOBILE APPLICATION DEVELOPER', 'Jun 2020 - Jan 2022', [
        'Use Flutter to build School-Learning/Management/Checking> applications for company Edutech projects.',
        'Working closely with CEO and designers to translate mockups of new features into scalable components of the apps.',
        'Technologies and tools used: Flutter, Provider, BloC Pattern, Firebase, Native Library, React Native, Redux, Native Base,...',
        'Fix bug, maintain code and improve performance (lazy load, caching, isolate,...)',
        'Achieved: Team working, communication, and estimate time for task',
      ]),
      _jobContent('MOBILE APPLICATION DEVELOPER', 'Dec 2019 - May 2020', [
        'Use Flutter to build Car Social Network applications',
        'Working closely with designers, backend developers and the business department to meet demanding project requirements',
        'Fix bug and improve performance',
        'Technologies and tools used: Flutter, BloC Pattern, Firebase, Charles Proxy, Weblate for localozation',
      ]),
      _jobContent('MOBILE APPLICATION DEVELOPER', 'Jun 2019 - Dec 2019', [
        'Use React Native to build product app for company',
        'Work closely with backend developers to keep app updated following requirements and style guides',
        'Technologies and tools used: React Native, Redux, Material, Firebase,...',
      ]),
    ];

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      alignment: Alignment.center,
      child: SizedBox(
        width: 900,
        child: CustomAnimationContainer(
          duration: const Duration(milliseconds: 500),
          position: 50,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SectionTitle(indexS: '02.', title: 'Where I\'ve Worked'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: _buttonHeight * _companyLength,
                            width: 1.5,
                            color: ColorsDef.slate,
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            top: _currentIndex * _buttonHeight,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: 1.5,
                              height: _buttonHeight,
                              color: ColorsDef.kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          height: _buttonHeight * _companyLength,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCompany('Hash Consulting Group', 0),
                              _buildCompany('Phenikaa Mass', 1),
                              _buildCompany('Mecar', 2),
                              _buildCompany('iBenefit', 3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: jobContentWidget[_currentIndex],
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget _jobContent(String title, String time, List<String> jobContent) {
    return Container(
      constraints:
          BoxConstraints(minHeight: _buttonHeight * _companyLength * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(color: ColorsDef.lightestSlate),
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: const TextStyle(color: ColorsDef.lightSlate, fontSize: 12),
          ),
          const SizedBox(height: 18),
          for (var content in jobContent)
            ContentLineWigdet(
              content: content,
              margin: const EdgeInsets.only(
                bottom: 8,
              ),
            )
        ],
      ),
    );
  }

  Widget _buildCompany(String name, int index) {
    return CustomMouseRegion(
      child: InkWell(
        onTap: () {
          if (index == _currentIndex) return;

          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(minWidth: 130),
          color:
              _currentIndex == index ? ColorsDef.slate.withOpacity(0.1) : null,
          height: _buttonHeight,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Text(
            name,
            style: const TextStyle(
              color: ColorsDef.kPrimaryColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
