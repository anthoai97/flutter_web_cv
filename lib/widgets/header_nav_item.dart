import 'package:flutter/material.dart';
import 'package:my_cv_web/core/utils/responsive.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';

import '../resource/colors.dart';

class HeaderNavbarItem extends StatefulWidget {
  const HeaderNavbarItem({
    Key? key,
    required this.index,
    required this.content,
    required this.onPress,
    this.margin,
    this.padding,
    this.durationMilliseconds,
  }) : super(key: key);

  final int index;
  final String content;
  final Function() onPress;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final int? durationMilliseconds;

  @override
  State<HeaderNavbarItem> createState() => _HeaderNavbarItemState();
}

class _HeaderNavbarItemState extends State<HeaderNavbarItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);

    return CustomAnimationContainer(
      type: CustomTranslateType.down,
      position: 20,
      duration: Duration(
        milliseconds: widget.durationMilliseconds ?? 300,
      ),
      child: Container(
        margin: isDesktop ? null : const EdgeInsets.only(bottom: 20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (_) {
            setState(() {
              _hover = true;
            });
          },
          onExit: (_) {
            _hover = false;
          },
          child: InkWell(
            onTap: widget.onPress,
            splashColor: ColorsDef.kPrimaryColor.withOpacity(0.1),
            focusColor: ColorsDef.kPrimaryColor.withOpacity(0.1),
            child: isDesktop
                ? Container(
                    margin: widget.margin ??
                        const EdgeInsets.symmetric(horizontal: 5),
                    padding: widget.padding ??
                        const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        _buildIndex(isTablet),
                        const SizedBox(width: 5.0),
                        _buildContent(isTablet)
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildIndex(isTablet),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildContent(isTablet),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Text _buildContent(bool isTablet) {
    return Text(
      widget.content,
      style: TextStyle(
        color: _hover ? ColorsDef.kPrimaryColor : ColorsDef.lightestSlate,
        fontSize: isTablet ? 16 : 13,
      ),
    );
  }

  Text _buildIndex(bool isTablet) {
    return Text(
      '0${widget.index}.',
      style: TextStyle(
        color: ColorsDef.kPrimaryColor,
        fontSize: isTablet ? 16 : 13,
      ),
    );
  }
}
