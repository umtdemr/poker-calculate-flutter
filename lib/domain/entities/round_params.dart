import 'package:equatable/equatable.dart';

class RoundParams extends Equatable {
  final String accesKey;
  final List users;

  const RoundParams({this.accesKey, this.users});

  @override
  List<Object> get props => [accesKey];
}
