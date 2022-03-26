import 'package:equatable/equatable.dart';

class SectionModel extends Equatable {
  final String name;
  final SectionSelectionSource source;

  const SectionModel({required this.name, required this.source});

  @override
  List<Object?> get props => [name, source];
}

enum SectionSelectionSource {
  fromScroll,
  fromButtonClick,
  fromBrowserAddressBar
}
