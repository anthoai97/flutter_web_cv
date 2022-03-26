class SinglePageAppConfiguration {
  final String? sectionName;
  final bool unknown;

  SinglePageAppConfiguration.home({this.sectionName}) : unknown = false;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        sectionName = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false;
}
