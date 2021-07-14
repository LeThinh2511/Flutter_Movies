import 'package:equatable/equatable.dart';

abstract class TabBarEvent extends Equatable {
  const TabBarEvent() : super();

  @override
  List<Object?> get props => [];
}

class ChangeTabBarEvent extends TabBarEvent {
  const ChangeTabBarEvent({required this.index}) : super();
  final int index;

  @override
  List<Object?> get props => [index];
}
