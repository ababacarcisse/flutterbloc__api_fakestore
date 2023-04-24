part of 'product_bloc.dart';

abstract class ProductEvent {}
class GetProductEvent extends ProductEvent {}
class GetCategoriesEvent extends ProductEvent {}
// deux nouveaux événements pour gérer l'ajout et la suppression d'éléments du panier.

class AddToCartEvent extends ProductEvent {
  final CartItem item;

   AddToCartEvent({required this.item});
}



class RemoveFromCartEvent extends ProductEvent {
  final CartItem item;

   RemoveFromCartEvent({required this.item});
}