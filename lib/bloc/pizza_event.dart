part of 'pizza_bloc.dart';

sealed class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}

class LoadPizzaCounter extends PizzaEvent {}

class AddPizza extends PizzaEvent {
  final Pizza pizzas;

  const AddPizza(this.pizzas);

  @override
  List<Object> get props => [pizzas];
}

class RemovePizza extends PizzaEvent {
  final Pizza pizzas;

  const RemovePizza(this.pizzas);

  @override
  List<Object> get props => [pizzas];
}
