import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/ui/widget/priority_soft_app_bar.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/filter/widgets/brand_content.dart';
import 'package:myapp/features/filter/widgets/color_content.dart';
import 'package:myapp/features/filter/widgets/filter_bottom_tile.dart';
import 'package:myapp/features/filter/widgets/gender_content.dart';
import 'package:myapp/features/filter/widgets/price_range_tile.dart';
import 'package:myapp/features/filter/widgets/sort_by_content.dart';

@RoutePage()
class FilterScreen extends StatelessWidget {
  final DiscoverProductCubit cubit;
  const FilterScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: const PrioritySoftAppBar(
          text: "Filter",
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                BrandContent(),
                30.verticalSpace,
                const PriceRangeTile(),
                30.verticalSpace,
                SortByContent(),
                30.verticalSpace,
                GenderSelectContent(),
                30.verticalSpace,
                ColorSelectContent(),
                20.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: const FilterBottomTile(),
      ),
    );
  }
}
