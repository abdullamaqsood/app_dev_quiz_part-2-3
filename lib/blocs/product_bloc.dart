import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

abstract class ProductEvent {}

class ToggleBookmark extends ProductEvent {}

class ProductState {
  final Product product;

  ProductState({required this.product});

  ProductState copyWith({Product? product}) {
    return ProductState(product: product ?? this.product);
  }
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(ProductState(
          product: Product(
            name: "AirPods Max — Silver",
            price: "A\$899.00",
            imageUrl:
                "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604022365000",
          ),
        )) {
    on<ToggleBookmark>((event, emit) {
      emit(ProductState(
        product: state.product.copyWith(
          isBookmarked: !state.product.isBookmarked,
        ),
      ));
    });
  }
}
