// import '../core/primitives/inputs/no_params.dart';
// import '../../core/network/failure.dart';
// import '../../domain/entities/patient_entity.dart';
// import '../../domain/repos/patients_repo.dart';
// import 'package:dartz/dartz.dart';

// import '../contracts/patients.dart';

// class GetPatientsQueryImpl implements GetPatientsQuery {
//   final PatientsRepo _patientsRepo;

//   GetPatientsQueryImpl({required PatientsRepo patientsRepo})
//       : _patientsRepo = patientsRepo;
//   @override
//   Future<Either<Failure, List<PatientEntity>>> call(NoParams params) async {
//     return await _patientsRepo.getPatients();
//   }
// }
