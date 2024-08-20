import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme/theme_bloc.dart';

import '../../core/core.dart';
import '../../di_container.dart';
import '../bloc/poke/poke_bloc.dart';

/// A StatelessWidget that represents the layout of the screen.
/// This screen displays a list of Pokémon data and allows the user to fetch data either via a REST API or GraphQL API.
class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    /// BlocProvider for PokeBloc
    /// Provides the PokeBloc to the widget tree, which is responsible for fetching and managing Pokémon data.
    return BlocProvider(
      create: (context) =>
          PokeBloc(pokeUsecase: getIt())..add(const GetPokesRest(limit: 200)),
      child: Scaffold(
        /// The AppBar of the screen with a centered title
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.layout,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isLightMode
                    ? AppColors.lightOnPrimaryColor
                    : AppColors.darkOnPrimaryColor),
          ),
        ),

        /// The body of the Scaffold uses BlocBuilder to rebuild based on the state of PokeBloc.
        body: BlocBuilder<PokeBloc, PokeState>(
          builder: (context, state) => switch (state) {
            /// If the state is PokeFailure, display an error message and a retry button.
            PokeFailure() => Center(
                child: Column(
                  children: [
                    /// Error message translated based on the current locale
                    Text(
                        "${context.tr.somethingWentWrongMsg}\n${context.tr.pleaseTryAgain}"),

                    /// A refresh button that re-fetches Pokémon data when pressed
                    IconButton(
                        onPressed: () => context
                            .read<PokeBloc>()
                            .add(const GetPokesRest(limit: 200)),
                        icon: const Icon(Icons.refresh_outlined))
                  ],
                ),
              ),

            /// If the state is PokeInitial or PokeLoading, display a loading indicator.
            PokeInitial() ||
            PokeLoading() =>
              const Center(child: CircularProgressIndicator.adaptive()),

            /// If the state is PokeSuccess, display the fetched Pokémon data in a list.
            PokeSuccess(:final pokes, :final type) =>

              /// A sample Column widget to test both REST API and GraphQL fetching and display the data.
              Column(
                children: [
                  /// A row containing three buttons to change the theme.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(themeMode: ThemeMode.dark)),
                        icon: const Icon(Icons.dark_mode_outlined),
                      ),
                      IconButton(
                        onPressed: () => context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(themeMode: ThemeMode.light)),
                        icon: const Icon(Icons.light_mode_outlined),
                      ),
                      IconButton(
                        onPressed: () => context.read<ThemeBloc>().add(
                            const ChangeTheme(themeMode: ThemeMode.system)),
                        icon: const Icon(Icons.auto_awesome_outlined),
                      ),
                    ],
                  ),

                  /// A row containing two buttons to fetch data from REST API or GraphQL API.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            context
                                .read<PokeBloc>()
                                .add(const GetPokesRest(limit: 200));
                          },
                          child: const Text("Rest Api")),
                      OutlinedButton(
                          onPressed: () {
                            context
                                .read<PokeBloc>()
                                .add(const GetPokesGraphql(limit: 10));
                          },
                          child: const Text("Graphql")),
                    ],
                  ),

                  /// Display the type of API used (REST or GraphQL)
                  Text(
                    type,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  /// Display the list of Pokémon names fetched from the API
                  Expanded(
                    child: ListView.separated(
                      itemCount: pokes.length,
                      itemBuilder: (context, index) {
                        return Text(pokes[index]);
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
