class WalletBalanceModel {
  final double balance;

  WalletBalanceModel({required this.balance});
  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) {
    return WalletBalanceModel(
      balance:
          num.tryParse(json['data']['wallet_balance'].toString())?.toDouble() ??
          0.0,
    );
  }
}
