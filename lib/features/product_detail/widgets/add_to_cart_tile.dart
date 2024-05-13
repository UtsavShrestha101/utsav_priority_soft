import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/bottom_detail_bar.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';
import 'package:myapp/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:myapp/resources/assets.gen.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddToCartTile extends StatelessWidget {
  final int price;
  const AddToCartTile({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30.sp,
        right: 30.sp,
        bottom: 10.sp,
      ),
      height: 50.sp,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: context.bodyText100.copyWith(
                  color: AppColors.primaryNeutral300,
                ),
              ),
              7.5.verticalSpace,
              Text(
                "\$$price",
                style: context.headline600.copyWith(
                  color: AppColors.primaryNeutral500,
                ),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 50.sp,
            width: 160.sp,
            child: PrimaryButton(
              onPressed: () {
                addQuantity(context, price);
              },
              text: "ADD TO CART",
              textColor: Colors.white,
              color: AppColors.primaryNeutral500,
            ),
          )
        ],
      ),
    );
  }
}

Future<void> addQuantity(BuildContext buildContext, int price) async {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController controller = TextEditingController();
  controller.text = "1";
  buildContext.showBottomSheet(
    BlocConsumer<ProductDetailCubit, AsyncValue<ProductDetailState>>(
      listener: (BuildContext context, AsyncValue<ProductDetailState> state) {
        state.whenOrNull(
          error: (data, message) => buildContext.showErrorSnackBar(message),
          data: (data) {
            buildContext.pop();
            buildContext.addToCartSuccessTile(
              state.data!.quantity,
            );
          },
        );
      },
      bloc: buildContext.read<ProductDetailCubit>(),
      builder: (_, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.sp),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Add to cart",
                      style: buildContext.headline600,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        buildContext.pop();
                      },
                      child: Assets.icons.cancel.svg(
                        height: 18.sp,
                        width: 18.sp,
                      ),
                    )
                  ],
                ),
                20.verticalSpace,
                Text(
                  "Quantity",
                  style: buildContext.headline300,
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  name: "quantity",
                  onChanged: (String? value) {
                    try {
                      buildContext.read<ProductDetailCubit>().updateQuantity(
                          int.parse(value!.isEmpty ? "1" : value));
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.integer(
                      errorText: "Quantity must be valid integer",
                    ),
                    FormBuilderValidators.max(
                      100,
                      errorText: "Quantity must be less or equal to 100",
                    ),
                    FormBuilderValidators.min(
                      1,
                      errorText: "Please select at least 1 quantity",
                    ),
                  ]),
                  decoration: InputDecoration(
                    hintText: "1",
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            try {
                              int quantity = int.parse(controller.text.isEmpty
                                  ? "0"
                                  : controller.text);
                              if (quantity > 1) {
                                controller.text = (quantity - 1).toString();
                                buildContext
                                    .read<ProductDetailCubit>()
                                    .updateQuantity(quantity - 1);
                              }
                            } catch (e) {
                              log(e.toString());
                            }
                          },
                          child: Icon(
                            Icons.remove_circle_outline_outlined,
                            size: 24.sp,
                            color: int.parse(controller.text.isEmpty
                                        ? "1"
                                        : controller.text) ==
                                    1
                                ? AppColors.primaryNeutral300
                                : AppColors.primaryNeutral500,
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            try {
                              int quantity = int.parse(controller.text.isEmpty
                                  ? "0"
                                  : controller.text);
                              controller.text = (quantity + 1).toString();
                              buildContext
                                  .read<ProductDetailCubit>()
                                  .updateQuantity(quantity + 1);
                            } catch (e) {
                              log(e.toString());
                            }
                          },
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            size: 24.sp,
                            color: AppColors.primaryNeutral500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                BottomDetailBar(
                  buttonLabel: "ADD TO CART",
                  title: "Total Price",
                  onPress: () async {
                    if (formKey.currentState!.saveAndValidate()) {
                      buildContext.read<ProductDetailCubit>().addToCart();
                    }
                  },
                  totalPrice: (price * state.data!.quantity).toDouble(),
                  isLoading: state.isLoading,
                ),
                10.verticalSpace,
              ],
            ),
          ),
        );
      },
    ),
    true,
  );
}
