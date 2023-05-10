import 'package:atom/packages/models/models.dart';
import 'package:atom/packages/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc(
    this._userRepository, {
    required String domain,
    required bool isAdmin,
    required Group? group,
  }) : super(GroupState(domain: domain, isAdmin: isAdmin, group: group)) {
    on<TabChanged>(_onTabChanged);
    on<GroupChanged>(_onGroupChanged);
  }

  final UserRepository _userRepository;

  Stream<dynamic> get group => _userRepository.group(state.domain);

  Stream<dynamic> get device => _userRepository.device(state.domain);

  void _onTabChanged(TabChanged event, Emitter<GroupState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }

  void _onGroupChanged(GroupChanged event, Emitter<GroupState> emit) {
    emit(state.copyWith(group: event.group));
  }
}
