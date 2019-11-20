import 'package:equatable/equatable.dart';

import '../../util/resource.dart';

abstract class UseCase<Type, Params> {
  Future<DataResource<Type>> execute(Params params);
}

class NoParams extends Equatable {}
