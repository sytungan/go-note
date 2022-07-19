import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';

class ErrorDialog {
  static show(BuildContext context, {String title = "Error..."}) {
    showDialog(
      context: context,
      barrierColor: AppColors.mediumhGray30,
      builder: (context) => WillPopScope(
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error),
                const SizedBox(
                  height: 15,
                ),
                Text(title)
              ],
            ),
          ),
        ),
        onWillPop: () async => true,
      ),
    );
  }
}
