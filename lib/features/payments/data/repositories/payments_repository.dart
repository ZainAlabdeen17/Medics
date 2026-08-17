import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/payments/data/models/package_model.dart';
import 'package:medics/features/payments/data/models/wallet_balance_model.dart';

class PaymentsRepository {
  final ApiConsumer api;

  PaymentsRepository({required this.api});
  Future<Either<Failure, WalletBalanceModel>> getWalletBalance() async {
    try {
      final response = await api.get(path: 'patient/wallet-balance');
      final balance = WalletBalanceModel.fromJson(response);
      return Right(balance);
    } on ServerExeption catch (e) {
      return Left(Failure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<PackageModel>>> getPackages() async {
    try {
      final response = await api.get(path: 'packages');
      final List<PackageModel> packages = (response["data"] as List)
          .map((data) => PackageModel.fromJson(data))
          .toList();
      return Right(packages);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> chargeWallet({required int packageId}) async {
    try {
      final response = await api.post(
        path: 'invoices/wallet/charge',
        data: {'package_id': packageId},
      );

      final message =
          response['message'] ?? 'Your wallet has been successfully charged.';
      return Right(message);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
