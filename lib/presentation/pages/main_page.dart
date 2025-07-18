import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu2/core/DI/di.dart';
import 'package:menu2/core/constants/app_colors.dart';
import 'package:menu2/presentation/widgets/app_drawer.dart';
import 'package:menu2/presentation/widgets/dish_card.dart';

import '../blocs/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainBloc>()..add(MainInitEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text("MENU")),
        drawer: AppDrawer(),
        backgroundColor: AppColors.black,
        body: BlocBuilder<MainBloc, MainInitial>(
          builder: (context, state) {
            return ListView(
              children: state.dishes
                  .map((dish) => DishCard(dish: dish,))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
