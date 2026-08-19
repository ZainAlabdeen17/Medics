// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GeneralHeader(title: "About Us"),
              SizedBox(height: 16.h),
              SizedBox(
                width: 120.r,
                height: 120.r,

                child: Image.asset(Assets.assetsImagesLogo),
              ),
              SizedBox(height: 12.h),
              Text(
                'Medics Healthcare',
                style: AppTextStyles.head1.copyWith(
                  color: AppColors.textAccent,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Version 1.0.0',
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 24.h),

              // --- بطاقة المحتوى الرئيسي ---
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlur,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.borderBlack),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Welcome to Medics'),
                    SizedBox(height: 8.h),
                    _buildSectionBody(
                      'Medics is your trusted, all-in-one digital healthcare platform designed to bridge the gap between patients and healthcare professionals. Our primary goal is to simplify healthcare management by providing a seamless, fast, and efficient way to discover top-rated doctors, book medical appointments, and manage healthcare wallet packages with ease.',
                    ),
                    SizedBox(height: 20.h),

                    _buildSectionTitle('Our Mission & Vision'),
                    SizedBox(height: 8.h),
                    _buildSectionBody(
                      'We believe that accessing quality medical care should be stress-free and transparent for everyone. Medics empowers patients with real-time appointment scheduling, hassle-free rescheduling options, transparent refund policies, and authentic doctor reviews to ensure you always receive the best possible care.',
                    ),
                    SizedBox(height: 20.h),

                    _buildSectionTitle('Privacy & Data Security'),
                    SizedBox(height: 8.h),
                    _buildSectionBody(
                      'Your personal health information and privacy are our top priorities. Medics adheres to strict international data protection standards and utilizes advanced encryption protocols. All your medical consultations, appointment details, and wallet payment transactions are fully encrypted, confidential, and safely stored to prevent unauthorized access.',
                    ),
                    SizedBox(height: 20.h),

                    _buildSectionTitle('Quality & Verification'),
                    SizedBox(height: 8.h),
                    _buildSectionBody(
                      'Every doctor and medical specialist featured on our platform undergoes a rigorous credentials verification process to guarantee professional excellence. We are dedicated to maintaining an elevated standard of service through continuous platform updates and patient feedback integration.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "TI&B © 2026. All rights reserved.",
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت لعنوان القسم
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.head3.copyWith(color: AppColors.textAccent),
    );
  }

  // ويدجت لمحتوى النص
  Widget _buildSectionBody(String body) {
    return Text(
      body,
      style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
    );
  }
}
