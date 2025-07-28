import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu2/core/constants/app_colors.dart';
import 'package:menu2/core/extension/units_localizer.dart';
import 'package:menu2/presentation/widgets/app_drawer.dart';
import 'package:menu2/presentation/widgets/dish_card.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/locale/availabel_language_cubit.dart';
import '../../core/locale/language_cubit.dart';
import '../../domain/entities/language_entity.dart';
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
            title: Text(context.units.menu),
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
                              color: AppColors.white,
                              fontSize: AppTextSizes.title,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontFamily: 'Serif',
                              // або інший бажаний шрифт
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: AppColors.black,
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
              BlocBuilder<AvailableLanguagesCubit, List<LanguageEntity>>(
                builder: (context, languages) {
                  return BlocBuilder<LanguageCubit, Locale>(
                    builder: (context, locale) {
                      return Padding(
                        padding: AppPadding.onlyRight20,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: locale.languageCode,
                            focusColor: Colors.transparent,
                            icon: const SizedBox.shrink(), // прибирає стрілку
                            alignment: Alignment.center,
                            dropdownColor: Theme.of(context).colorScheme.surface,
                            borderRadius: AppBorderRadius.all16,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.black,
                              fontSize: AppTextSizes.medium,
                            ),

                            // прибирає сіре виділення
                            selectedItemBuilder: (context) {
                              return languages.map((lang) {
                                return Center(child: Text(lang.name));
                              }).toList();
                            },

                            items: languages.map(
                                  (lang) {
                                return DropdownMenuItem<String>(
                                  value: lang.code,
                                  child: Container(

                                    decoration: const BoxDecoration(
                                      color: Colors.transparent, // прозорий фон
                                    ),
                                    child: Center(child: Text(lang.name)),
                                  ),
                                );
                              },
                            ).toList(),

                            onChanged: (langCode) {
                              if (langCode != null) {
                                context.read<LanguageCubit>().setLocale(Locale(langCode));
                              }
                            },
                          ),
                        ),
                      );
                    },
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
                  child: SizedBox(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
