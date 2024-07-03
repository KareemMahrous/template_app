// import 'package:clinic_package/clinic_package.dart';
// import 'package:dartz/dartz.dart';

// class AddPrescriptionCommandImpl implements AddPrescription {
//   final PrescriptionRepo _prescriptionRepo;
//   AddPrescriptionCommandImpl({required PrescriptionRepo prescriptionRepo})
//       : _prescriptionRepo = prescriptionRepo;
//   @override
//   Future<Either<Failure, PrescriptionEntity>> call(PrescriptionInputs params) {
//     return _prescriptionRepo.addPrescription(
//         patientId: params.patientId,
//         doctorId: params.doctorId,
//         description: params.description,
//         name: params.name,
//         appointmentId: params.appointmentId,
//         dateTime: params.datetime,
//         medicines: params.medicines);
//   }
// }
