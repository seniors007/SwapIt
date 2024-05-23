import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/search_cubit/search_cubit.dart';
import 'package:swapit/features/search/presentation/views/widgets/custom_title.dart';
import 'package:swapit/features/search/presentation/views/widgets/search_bar.dart';
import 'package:swapit/features/search/presentation/views/widgets/service_post_in_search.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchBar(),
                  kDivider,
                  const CustomTitle(),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is SearchSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final service =
                          state.searchResponseContainer.results[index];
                      return ServicePostInSearch(
                        serviceId: service.id!,
                        serviceName: service.serviceName!,
                        description: service.serviceDescription!,
                        category: service.categoryName!,
                        cost: service.servicePrice!,
                      );
                    },
                    childCount: state.searchResponseContainer.results.length,
                  ),
                );
              } else if (state is SearchFailure) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text("somthing wnt wrong try again later"),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('Search for whatever you need'),
                  ),
                );
              }
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
