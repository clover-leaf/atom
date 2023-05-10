part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends GroupEvent {
  const TabChanged(this.tab);

  final GroupTab tab;

  @override
  List<Object> get props => [tab];
}

class GroupChanged extends GroupEvent {
  const GroupChanged(this.group);

  final Group group;

  @override
  List<Object> get props => [group];
}
