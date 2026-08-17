import 'package:medics/features/payments/data/models/package_model.dart';

enum ChargeWalletStatus {
  initial,
  loadingPackages,
  packagesSuccess,
  packagesFailure,
  charging,
  chargeSuccess,
  chargeFailure,
}

class ChargeWalletState {
  final ChargeWalletStatus status;
  final List<PackageModel> packages;
  final String? errorMessage;
  final String? successMessage;

  const ChargeWalletState({
    this.status = ChargeWalletStatus.initial,
    this.packages = const [],
    this.errorMessage,
    this.successMessage,
  });

  ChargeWalletState copyWith({
    ChargeWalletStatus? status,
    List<PackageModel>? packages,
    String? errorMessage,
    String? successMessage,
  }) {
    return ChargeWalletState(
      status: status ?? this.status,
      packages: packages ?? this.packages,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
