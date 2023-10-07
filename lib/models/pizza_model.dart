import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({
    required this.name,
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> pizzas = [
    Pizza(
      name: 'pizza',
      id: '0',
      image: Image.asset('images/pizza.png'),
    ),
    Pizza(
      name: 'pizza_peperoni',
      id: '1',
      image: Image.asset('images/pizza_peperoni.png'),
    ),
  ];
}
