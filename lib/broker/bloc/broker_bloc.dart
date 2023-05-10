import 'package:atom/packages/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'broker_event.dart';
part 'broker_state.dart';

class BrokerBloc extends Bloc<BrokerEvent, BrokerState> {
  BrokerBloc(this._userRepository,
      {required String domain, required bool isAdmin})
      : super(BrokerState(domain: domain, isAdmin: isAdmin));

  final UserRepository _userRepository;

  Stream<dynamic> get broker => _userRepository.broker(state.domain);
}
