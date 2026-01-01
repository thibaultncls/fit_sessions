import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/core/state/async_state.dart';
import 'package:fit_sessions/core/use_case/use_case.dart';
import 'package:fit_sessions/features/home/domain/use_cases/get_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetProductProvider extends StateNotifier<AsyncState> {
  final GetProduct _getProductUseCase;
  GetProductProvider({required GetProduct getProductUseCase})
    : _getProductUseCase = getProductUseCase,
      super(const AsyncState.initial());

  Future<void> fetchProduct() async {
    state = const AsyncState.loading();

    final result = await _getProductUseCase(NoParams());

    result.fold(
      (failure) {
        state = AsyncState.error(failure.message);
      },
      (product) {
        state = AsyncState.success(product);
      },
    );
  }
}
