import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';

class LoadingDialog {
  static show(BuildContext context, {String title = "Loading..."}) {
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
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 15,
                ),
                Text(title)
              ],
            ),
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
