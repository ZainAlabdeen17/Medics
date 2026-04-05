import 'package:flutter/material.dart';
import 'package:medics/features/auth/presentation/view/widgets/otp_form_item.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [OtpFormItem(), OtpFormItem(), OtpFormItem(), OtpFormItem()],
      ),
    );
  }
}
