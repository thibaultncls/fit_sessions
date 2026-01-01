import 'package:fit_sessions/core/common/widgets/custom_elevated_button.dart';
import 'package:fit_sessions/core/config/di.dart';
import 'package:fit_sessions/core/state/async_state.dart';
import 'package:fit_sessions/features/home/domain/entities/product.dart';
import 'package:fit_sessions/features/home/presentation/providers/get_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _getProductProvider = StateNotifierProvider<GetProductProvider, AsyncState<Product>>(
  (ref) => DI.instance<GetProductProvider>()..fetchProduct(),
);

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_getProductProvider);
    final isLoading = state.maybeWhen(orElse: () => false, loading: () => true);
    final product = state.maybeWhen(orElse: () => null, success: (product) => product);

    return Scaffold(
      appBar: AppBar(title: const Text('Payment Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: CustomElevatedButton(
            child: isLoading
                ? CircularProgressIndicator()
                : product != null
                ? Text('Buy ${product.name} for \$${product.price}')
                : Text('Error loading product'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
