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

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.large(
            pinned: true,
            expandedHeight: 300,
            title: Text(context.units.menu),
            flexibleSpace: FlexibleSpaceBar(
              background: BlocBuilder<InfoBloc, InfoState>(
                builder: (context, state) {
                  if (state is InfoLoaded) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
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
                            icon: const SizedBox.shrink(),
                            alignment: Alignment.center,
                            dropdownColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                            borderRadius: AppBorderRadius.all16,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.black,
                                  fontSize: AppTextSizes.medium,
                                ),
                            selectedItemBuilder: (context) {
                              return languages.map((lang) {
                                return Center(child: Text(lang.name));
                              }).toList();
                            },
                            items: languages.map((lang) {
                              return DropdownMenuItem<String>(
                                value: lang.code,
                                child: Center(child: Text(lang.name)),
                              );
                            }).toList(),
                            onChanged: (langCode) {
                              if (langCode != null) {
                                context.read<LanguageCubit>().setLocale(
                                  Locale(langCode),
                                );
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
        ],
        body: BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            if (state is DishLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DishLoaded) {
              final types = state.types;
              final dishesByType = state.groupedDishes;

              return Column(
                children: [
                  AppGaps.gap8,
                  SizedBox(
                    height: 48,
                    child: ListView.separated(
                      padding: AppPadding.horizontal8,
                      scrollDirection: Axis.horizontal,
                      itemCount: types.length,
                      separatorBuilder: (_, __) => AppGaps.gap8,
                      itemBuilder: (context, index) {
                        final isSelected = state.selectedTypeIndex == index;
                        return ChoiceChip(
                          label: Text(types[index].name),
                          selected: isSelected,
                          onSelected: (_) {
                            context.read<DishBloc>().add(
                              DishEvent.changeSelectedType(index),
                            );
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        context.read<DishBloc>().add(
                          DishEvent.changeSelectedType(index),
                        );
                      },
                      itemCount: types.length,
                      itemBuilder: (context, index) {
                        final type = types[index];
                        final dishes = dishesByType[type.id] ?? [];

                        return ListView.builder(
                          key: PageStorageKey('list_view_${type.id}'),
                          primary: false,
                          padding: AppPadding.all16,
                          itemCount: dishes.length,
                          itemBuilder: (context, i) {
                            final dish = dishes[i];
                            return DishCard(dish: dish);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
