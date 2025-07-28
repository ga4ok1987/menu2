import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu2/core/constants/app_colors.dart';
import 'package:menu2/presentation/widgets/app_drawer.dart';
import 'package:menu2/presentation/widgets/dish_card.dart';

import '../../core/locale/language_cubit.dart';
import '../blocs/dish_bloc.dart';
import '../blocs/info_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state is InfoLoaded) {
            return AppDrawer(info: state.info);
          } else if (state is InfoLoading) {
            return const Drawer(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Drawer();
          }
        },
      ),
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            expandedHeight: 300,
            title: const Text("МЕНЮ"),
            // показується при скролі
            flexibleSpace: FlexibleSpaceBar(
              background: BlocBuilder<InfoBloc, InfoState>(
                builder: (context, state) {
                  if (state is InfoLoaded) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        // Зображення банера
                        ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,

                            child: Image.network(
                              state.info.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,

                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),

                        // Назва ресторану в центрі
                        Center(
                          child: Text(
                            state.info.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 46,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontFamily: 'Serif',
                              // або інший бажаний шрифт
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black45,
                                  offset: Offset(1, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            actions: [
              BlocBuilder<LanguageCubit, Locale>(
                builder: (context, locale) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: locale.languageCode,
                      icon: const Icon(Icons.language, color: Colors.white),
                      items: const [
                        DropdownMenuItem(
                          value: 'uk',
                          child: Text('Українська'),
                        ),
                        DropdownMenuItem(value: 'en', child: Text('English')),
                      ],
                      onChanged: (langCode) {
                        if (langCode != null) {
                          context.read<LanguageCubit>().setLocale(
                            Locale(langCode),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          BlocBuilder<DishBloc, DishState>(
            builder: (context, state) {
              if (state is DishLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is DishLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final dish = state.dishes[index];
                    return DishCard(dish: dish);
                  }, childCount: state.dishes.length),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(child: Text('Помилка завантаження')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
