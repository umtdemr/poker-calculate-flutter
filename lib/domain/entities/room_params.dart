import 'package:equatable/equatable.dart';

class RoomParams extends Equatable {
  final String accesKey;

  const RoomParams(this.accesKey);

  @override
  List<Object> get props => [accesKey];
}
