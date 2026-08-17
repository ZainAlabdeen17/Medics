import 'package:medics/features/payments/data/models/wallet_balance_model.dart';

abstract class WalletBalanceState {}

final class WalletBalanceInitial extends WalletBalanceState {}

final class WalletBalanceLoading extends WalletBalanceState {}

final class WalletBalanceSuccess extends WalletBalanceState {
  final WalletBalanceModel walletBalance;

  WalletBalanceSuccess({required this.walletBalance});
}

final class WalletBalanceFailure extends WalletBalanceState {
  final String errorMessage;

  WalletBalanceFailure({required this.errorMessage});
}
