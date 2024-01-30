import 'package:dartz/dartz.dart';
import 'package:project_ktp/domain/entities/ktp_entities.dart';

import '../failures/failures.dart';

abstract class KTPRepo {
  Future<Either<Failure, KTPEntity>> getKTPfromDatasource();
}
