import 'package:flutter/material.dart';
import 'package:my_cv_web/core/utils/utils.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:my_cv_web/resource/styles.dart';
import 'package:my_cv_web/screens/home/components/project.dart';
import 'package:my_cv_web/widgets/mouse_region.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    Key? key,
    required this.project,
    this.reversed = false,
  }) : super(key: key);

  final ProjectModel project;
  final bool reversed;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _opacity = Tween<double>(begin: 0.8, end: 0).animate(_controller);
  }

  List<Widget> get buildImageBg {
    return [
      Expanded(
        flex: 7,
        child: CustomMouseRegion(
          onHoverCallback: (hover) {
            if (hover) {
              _controller.forward();
            } else {
              _controller.reset();
            }
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  path(widget.project.image),
                  height: 365,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (context, snapshot) {
                    return Opacity(
                      opacity: _opacity.value,
                      child: Container(
                        width: double.infinity,
                        height: 365,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorsDef.green,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      const Spacer(
        flex: 5,
      ),
    ];
  }

  List<Widget> get buildContent => [
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 5,
          child: Container(
            alignment:
                widget.reversed ? Alignment.topLeft : Alignment.centerRight,
            height: 365,
            child: Column(
              crossAxisAlignment: widget.reversed
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.project.objectType,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorsDef.kPrimaryColor,
                    ),
                  ),
                ),
                CustomMouseRegion(
                  child: InkWell(
                    onTap: () {
                      launchURL(widget.project.url);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: widget.reversed
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.project.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: ColorsDef.lightestSlate,
                              fontFamily: FontDef.calibre,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.open_in_new,
                          size: 24,
                          color: ColorsDef.lightSlate,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(25).copyWith(bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsDef.lightNavy,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsDef.naviShadow,
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        spreadRadius: -10,
                      )
                    ],
                  ),
                  child: Text(
                    widget.project.discription,
                    style: const TextStyle(
                        fontSize: 16,
                        color: ColorsDef.lightSlate,
                        fontFamily: FontDef.calibre,
                        height: 1.3),
                    textAlign:
                        widget.reversed ? TextAlign.start : TextAlign.end,
                  ),
                ),
                Wrap(
                  children: [
                    for (var item in widget.project.lib)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 13,
                            color: ColorsDef.lightSlate,
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: Stack(
        children: [
          Row(
            children:
                widget.reversed ? buildImageBg.reversed.toList() : buildImageBg,
          ),
          Row(
            children:
                widget.reversed ? buildContent.reversed.toList() : buildContent,
          )
        ],
      ),
    );
  }
}
