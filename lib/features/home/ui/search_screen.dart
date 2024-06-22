import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/core/widgets/custom_text_form_field.dart';
import 'package:aflami/features/home/logic/search_cubit.dart/search_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomArrowBack(),
                verticalSpace(20.h),
                const Text(
                  'Search for a movie:',
                  style: TextStyles.font26WhiteBold,
                ),
                verticalSpace(20.h),
                CustomTextFormField(
                  controller: context.read<SearchCubit>().movieNameController,
                  hintText: 'e.g Reacher',
                  onChanged: (value) {
                    context.read<SearchCubit>().onTextChanged(value);
                  },
                ),
                verticalSpace(40.h),
                const Text(
                  'Results:',
                  style: TextStyles.font26WhiteBold,
                ),
                verticalSpace(10.h),
                if (state is SearchInitialState)
                  const Text(
                    'Start typing to search for movies',
                    style: TextStyle(color: Colors.grey),
                  )
                else if (state is SearchLoadingState)
                  const Center(child: CircularProgressIndicator())
                else if (state is SearchFailureState)
                  Text(state.errorMessage)
                else if (state is SearchSuccessState)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) => CustomMovieItem(
                        moviesModel: state.movies[index],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
