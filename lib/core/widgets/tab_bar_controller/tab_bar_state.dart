import 'package:equatable/equatable.dart';

abstract class TabBarState extends Equatable {
  const TabBarState() : super();

  @override
  List<Object?> get props => [];
}

class TabBarIndexChange extends TabBarState {
  const TabBarIndexChange({required this.from, required this.to}) : super();
  final int from;
  final int to;

  @override
  List<Object?> get props => [from, to];
}
