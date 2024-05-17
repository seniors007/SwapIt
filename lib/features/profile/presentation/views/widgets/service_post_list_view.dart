import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/profile/presentation/manager/search_cubit/search_cubit.dart';
import 'package:swapit/features/profile/presentation/views/widgets/service_post.dart';

class ServicePostListView extends StatelessWidget {
  const ServicePostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.searchResponseContainer.results.length,
            itemBuilder: (context, index) {
              String? servieName =
                  state.searchResponseContainer.results[index].serviceName;
              String? category =
                  state.searchResponseContainer.results[index].categoryName;
              String? description = state
                  .searchResponseContainer.results[index].serviceDescription;
              int? cost =
                  state.searchResponseContainer.results[index].servicePrice;
              return ServicePostInProfile(
                serviceName: servieName!,
                category: category!,
                cost: cost!,
                description: description!,
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const Center(child: Text('No services available'));
        }
      },
    );
  }
}
