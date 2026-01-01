import 'package:fit_sessions/features/home/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String userId,
    required String name,
    required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

extension ProductModelMapper on ProductModel {
  Product toEntity() => Product(id: id, userId: userId, name: name, price: price);
}

extension ProductEntityMapper on Product {
  ProductModel toModel() => ProductModel(id: id, userId: userId, name: name, price: price);
}
