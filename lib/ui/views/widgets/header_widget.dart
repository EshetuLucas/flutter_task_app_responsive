import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    this.onBackButtonTap,
  }) : super(key: key);

  final Function()? onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          verticalSpaceMedium,
          Container(
            constraints: const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            child: FittedBox(
              child: GestureDetector(
                onTap: onBackButtonTap,
                child: const Card(
                  color: kcPrimaryColor,
                  elevation: 10,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 37,
                    ),
                  ),
                ),
              ),
            ),
          ),
          horizontalSpaceMedium,
          const Expanded(
            child: SizedBox(
              height: 55,
              child: Card(
                color: kcLightGrey2,
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
