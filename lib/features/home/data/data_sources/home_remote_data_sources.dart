import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_sessions/core/errors/exception.dart';
import 'package:fit_sessions/features/home/data/models/product_model.dart';

abstract interface class HomeRemoteDataSources {
  Future<ProductModel> fetchProduct();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  final FirebaseFirestore _firestore;

  HomeRemoteDataSourcesImpl({required FirebaseFirestore firestore}) : _firestore = firestore;

  @override
  Future<ProductModel> fetchProduct() async {
    try {
      final doc = await _firestore.collection('products').doc('prod_ThuQ1I6hf5niEP').get();
      if (doc.exists) {
        return ProductModel.fromJson(doc.data()!);
      } else {
        throw ServerException(message: 'Product not found');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
