import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/payments/data/repositories/payments_repository.dart';
import 'package:medics/features/payments/presentation/cubit/charge_wallet/charge_wallet_state.dart';

class ChargeWalletCubit extends Cubit<ChargeWalletState> {
  final PaymentsRepository repository;
  ChargeWalletCubit(this.repository) : super(const ChargeWalletState());
  Future<void> fetchPackages() async {
    emit(state.copyWith(status: ChargeWalletStatus.loadingPackages));

    final result = await repository.getPackages();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ChargeWalletStatus.packagesFailure,
          errorMessage: failure.message,
        ),
      ),
      (packages) => emit(
        state.copyWith(
          status: ChargeWalletStatus.packagesSuccess,
          packages: packages,
        ),
      ),
    );
  }

  Future<void> chargeWallet(int packageId) async {
    emit(state.copyWith(status: ChargeWalletStatus.charging));

    final result = await repository.chargeWallet(packageId: packageId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ChargeWalletStatus.chargeFailure,
          errorMessage: failure.message,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: ChargeWalletStatus.chargeSuccess,
          successMessage: message,
        ),
      ),
    );
  }
}
