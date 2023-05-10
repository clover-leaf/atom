import 'package:atom/packages/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this._userRepository, {
    required String domain,
    required bool isAdmin,
  }) : super(DashboardState(domain: domain, isAdmin: isAdmin));

  final UserRepository _userRepository;

  Stream<dynamic> get dashboard => _userRepository.dashboard(state.domain);
}
