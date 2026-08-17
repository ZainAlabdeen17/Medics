import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/payments/data/repositories/payments_repository.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_state.dart';

class WalletBalanceCubit extends Cubit<WalletBalanceState> {
  final PaymentsRepository repository;
  WalletBalanceCubit(this.repository) : super(WalletBalanceInitial());
  Future<void> getWalletBalance() async {
    emit(WalletBalanceLoading());
    final result = await repository.getWalletBalance();
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(WalletBalanceFailure(errorMessage: failure.message));
        }
      },
      (walletBalance) {
        if (!isClosed) {
          emit(WalletBalanceSuccess(walletBalance: walletBalance));
        }
      },
    );
  }
}
