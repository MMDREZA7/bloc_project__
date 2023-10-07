import 'dart:math';

import 'package:bloc_project/bloc/pizza_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/pizza_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Pizza Bloc'),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator(color: Colors.orange);
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.pizzas.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.pizzas.length;
                            index++)
                          Positioned(
                            left: random.nextInt(250).toDouble(),
                            right: random.nextInt(250).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.pizzas[index].image,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('SomeThing went wrong!!!');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(
                    AddPizza(
                      Pizza.pizzas[0],
                    ),
                  );
            },
            child: const Icon(Icons.local_pizza_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(
                    RemovePizza(
                      Pizza.pizzas[0],
                    ),
                  );
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[500],
            onPressed: () {
              context.read<PizzaBloc>().add(
                    AddPizza(
                      Pizza.pizzas[1],
                    ),
                  );
            },
            child: const Icon(Icons.local_pizza),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[500],
            onPressed: () async {
              context.read<PizzaBloc>().add(
                    RemovePizza(
                      Pizza.pizzas[1],
                    ),
                  );
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
