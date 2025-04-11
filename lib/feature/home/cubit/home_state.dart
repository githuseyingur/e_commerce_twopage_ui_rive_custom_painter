import 'package:equatable/equatable.dart';
import 'package:flutter_ui/product/global/model/product_model.dart';
import 'package:flutter_ui/product/global/model/user_model.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.homeState,
    required this.selectedCategory,
    required this.filteredProductList,
    required this.favouriteProducts,
  });
  factory HomeState.initial() {
    return HomeState(
      homeState: HomeStates.initial,
      selectedCategory: productList[0].category!,
      filteredProductList: productList
          .where((p) => p.category! == productList[0].category!)
          .toList(),
      favouriteProducts: user.favouriteProducts,
    );
  }
  final HomeStates homeState;
  final String selectedCategory;

  final List<ProductModel> filteredProductList;
  final List<int> favouriteProducts;

  @override
  List<Object?> get props => [
        homeState,
        selectedCategory,
        filteredProductList,
        favouriteProducts,
      ];

  HomeState copyWith({
    HomeStates? homeState,
    String? selectedCategory,
    List<ProductModel>? filteredProductList,
    List<int>? favouriteProducts,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredProductList: filteredProductList ?? this.filteredProductList,
      favouriteProducts: favouriteProducts ?? this.favouriteProducts,
    );
  }
}

enum HomeStates {
  initial,
  loading,
  completed,
  error,
}
