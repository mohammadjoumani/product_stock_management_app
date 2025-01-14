import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum MessageType { error, success, info }

void showMessage({
  required BuildContext context,
  required String message,
  MessageType messageType = MessageType.error,
}) {
  switch (messageType) {
    case MessageType.error:
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
      break;
    case MessageType.success:
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ),
      );
      break;
    case MessageType.info:
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: message,
        ),
      );
      break;
  }
}
