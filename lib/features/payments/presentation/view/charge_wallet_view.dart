import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/payments/data/models/package_model.dart';
import 'package:medics/features/payments/presentation/cubit/charge_wallet/charge_wallet_cubit.dart';
import 'package:medics/features/payments/presentation/cubit/charge_wallet/charge_wallet_state.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'package:medics/features/profile/presentation/widgets/wallet_balance_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChargeWalletView extends StatelessWidget {
  const ChargeWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChargeWalletCubit, ChargeWalletState>(
      listener: (context, state) {
        if (state.status == ChargeWalletStatus.chargeSuccess) {
          context.read<WalletBalanceCubit>().getWalletBalance();
          showCustomToast(
            context: context,
            title: state.successMessage ?? "Successful Charge",
            primaryColor: AppColors.iconGreen,
            backColor: AppColors.surfaceGreen,
            icon: Icon(Icons.check_sharp, color: AppColors.borderGreen),
            alignment: Alignment.bottomCenter,
          );
        } else if (state.status == ChargeWalletStatus.chargeFailure ||
            state.status == ChargeWalletStatus.packagesFailure) {
          showCustomToast(
            context: context,
            title: state.errorMessage ?? "An error occurred",
            primaryColor: AppColors.iconRed,
            backColor: AppColors.surfaceRed,
            icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
            alignment: Alignment.bottomCenter,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.status == ChargeWalletStatus.charging,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.btnPrimary,
          ),
          child: Scaffold(
            body: SafeArea(
              child: RefreshIndicator(
                backgroundColor: AppColors.surfaceCard,
                color: AppColors.surfaceAccent,
                onRefresh: // Refresh the packages list and wallet balance
                () async {
                  await Future.wait([
                    context.read<ChargeWalletCubit>().fetchPackages(),
                    context.read<WalletBalanceCubit>().getWalletBalance(),
                  ]);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: GeneralHeader(title: "Wallet Charge"),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 8.h)),
                    SliverToBoxAdapter(child: WalletBalanceWidget()),
                    SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                    if (state.status == ChargeWalletStatus.loadingPackages)
                      const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.btnPrimary,
                          ),
                        ),
                      )
                    else if (state.packages.isNotEmpty)
                      SliverList.separated(
                        itemCount: state.packages.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final package = state.packages[index];
                          return PackageWidget(
                            package: package,
                            onTap: () {
                              context.read<ChargeWalletCubit>().chargeWallet(
                                package.id,
                              );
                            },
                          );
                        },
                      )
                    else
                      SliverFillRemaining(child: OnErrorWidget()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PackageWidget extends StatelessWidget {
  final PackageModel package;
  final VoidCallback onTap;

  const PackageWidget({super.key, required this.package, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.baseShimmerColor,
          border: Border.all(color: AppColors.borderBlack),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    package.name,
                    style: AppTextStyles.head2.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${package.balanceAmount} \$",
                    style: AppTextStyles.head2.copyWith(
                      color: AppColors.textGreen,
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColors.btnPrimary,
                      ),
                      child: Text(
                        "Charge",
                        style: AppTextStyles.head3.copyWith(
                          color: AppColors.borderBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
