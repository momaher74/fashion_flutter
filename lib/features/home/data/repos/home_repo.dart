import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either> getHome()  ;
}


class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either> getHome() {
    // TODO: implement getHome
    throw UnimplementedError();
  }

}

