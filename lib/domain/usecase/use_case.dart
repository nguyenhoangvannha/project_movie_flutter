import '../../util/resource.dart';

abstract class UseCase<Type, Params> {
  Future<DataResource<Type>> execute(Params params);
}
