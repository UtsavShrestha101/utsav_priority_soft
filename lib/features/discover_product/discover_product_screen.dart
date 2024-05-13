import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/dependency_injection/di.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/widget/cart_indicator_button.dart';
import 'package:myapp/core/ui/widget/empty_alert_tile.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/discover_product/widgets/category_tile.dart';
import 'package:myapp/features/discover_product/widgets/product_grid_content.dart';
import 'package:myapp/features/filter/widgets/filter_button.dart';

@RoutePage()
class DiscoverProductScreen extends StatefulWidget {
  const DiscoverProductScreen({super.key});

  @override
  State<DiscoverProductScreen> createState() => _DiscoverProductScreenState();
}

class _DiscoverProductScreenState extends State<DiscoverProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<DiscoverProductCubit>()
        ..initCartLengthListener()
        ..getProductList(),
      child:
          BlocConsumer<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
        listener: (context, state) {
          state.whenOrNull(
            error: (data, message) => context.showErrorSnackBar(message),
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30.sp,
                ),
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<DiscoverProductCubit>().refreshContent();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Discover",
                              style: context.headline700,
                            ),
                          ),
                          // const Spacer(),
                          CartIndicatorButton(
                            bloc: context.read<DiscoverProductCubit>(),
                          ),
                        ],
                      ),
                      25.verticalSpace,
                      CategoryTile(),
                      15.verticalSpace,
                      (state.isLoading && state.data!.isListEmpty)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state.hasError
                              ? Text(state.errorMessage)
                              : state.data!.isListEmpty
                                  ? const Expanded(
                                      child: EmptyAlertTile(
                                        msg: "Oops, No product available",
                                      ),
                                    )
                                  : const ProductGridContent()
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: const FilterButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
