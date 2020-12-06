import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class DeleteRoundParams extends Equatable {
  final int index;

  DeleteRoundParams({@required this.index})
      : assert(index != null, "Id cannot be null");

  @override
  List<Object> get props => [index];

  @override
  bool get stringify => true;
}
