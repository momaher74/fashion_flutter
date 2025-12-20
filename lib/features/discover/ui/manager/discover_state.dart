part of 'discover_cubit.dart';


class DiscoverState {
 final List<ProductModel> products;
 final String? error;
 final bool isLoading;

 const DiscoverState({
  this.products = const [],
  this.error,
  this.isLoading = false,
 });

 // Helper method to copy state with changes
 DiscoverState copyWith({
  List<ProductModel>? products,
  String? error,
  bool? isLoading,
 }) {
  return DiscoverState(
   products: products ?? this.products,
   error: error,
   isLoading: isLoading ?? this.isLoading,
  );
 }
}
