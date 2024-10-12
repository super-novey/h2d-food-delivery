import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class MenuTextField extends StatelessWidget {
  const MenuTextField({
    super.key,
    required this.textController,
    required this.label,
    this.maxLines = 1,
    this.textAlign,
  });

  final String label;
  final TextEditingController textController;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            textAlign: textAlign ?? TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: MyColors.primaryTextColor,
                  height: 2,
                ),
            controller: textController,
            maxLines: maxLines,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: label,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: MyColors.secondaryTextColor,
                  ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }
}
