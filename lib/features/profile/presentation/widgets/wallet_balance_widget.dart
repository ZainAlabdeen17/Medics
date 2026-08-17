import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_state.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceBlur,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderBlack),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Wallet Balance",
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            BlocBuilder<WalletBalanceCubit, WalletBalanceState>(
              builder: (context, state) {
                if (state is WalletBalanceLoading) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Center(
                      child: SizedBox(
                        height: 18.h,
                        width: 18.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.borderAccent,
                        ),
                      ),
                    ),
                  );
                }
                if (state is WalletBalanceFailure) {
                  return Text(
                    "No available data",
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textRed,
                      fontFamily: "Inter",
                    ),
                    textAlign: TextAlign.center,
                  );
                }
                if (state is WalletBalanceSuccess) {
                  return Text(
                    "${state.walletBalance.balance.toString()} \$",
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textGreen,
                      fontFamily: "Inter",
                    ),
                    textAlign: TextAlign.center,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
