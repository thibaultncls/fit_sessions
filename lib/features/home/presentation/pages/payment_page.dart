import 'package:fit_sessions/core/common/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: CustomElevatedButton(child: Text("Payer"), onPressed: () {}),
        ),
      ),
    );
  }
}
