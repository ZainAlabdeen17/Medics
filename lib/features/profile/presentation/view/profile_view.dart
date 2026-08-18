import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/functions/user_functions.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'package:medics/features/profile/presentation/widgets/profile_option.dart';
import 'package:medics/features/profile/presentation/widgets/show_log_out_dialog.dart';
import 'package:medics/features/profile/presentation/widgets/user_profile_widget.dart';
import 'package:medics/features/profile/presentation/widgets/wallet_balance_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final user = UserFunctions.getUser();
    return VisibilityDetector(
      key: const Key('profile_view_key'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 1.0) {
          context.read<WalletBalanceCubit>().getWalletBalance();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await context.read<WalletBalanceCubit>().getWalletBalance();
            },
            backgroundColor: AppColors.surfaceCard,
            color: AppColors.borderAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Profile",
                        style: AppTextStyles.head1.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: UserProfileWidget(user: user)),
                  SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                  SliverToBoxAdapter(child: WalletBalanceWidget()),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                  SliverToBoxAdapter(
                    child: ProfileOption(
                      title: "Wallet Charge",
                      icon: Assets.assetsImagesAppointmentsPay,
                      onTap: () {
                        context.push(
                          '/WalletCharge',
                          extra: context.read<WalletBalanceCubit>(),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProfileOption(
                      title: "About Us",
                      icon: Assets.assetsImagesAppointmentsVerification,
                      onTap: () {},
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProfileOption(
                      title: "Logout",
                      icon: Assets.assetsImagesIconsGeneralLogout,
                      onTap: () {
                        showLogOutConfirmationDialog(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
