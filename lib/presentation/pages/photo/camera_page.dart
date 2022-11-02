import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final cameraEventController = StreamController<CameraEvent>();

  @override
  void dispose() {
    cameraEventController.close();
    super.dispose();
  }

  onCapPicture() {
    cameraEventController.add(CameraEvent.capture);
  }

  onRecordVideo() {
    cameraEventController.add(CameraEvent.record);
  }

  onChangeCam() {
    cameraEventController.add(CameraEvent.toggleCam);
  }

  onChangeFlashMode() {
    cameraEventController.add(CameraEvent.toggleFlash);
  }

  onSavedFile(XFile? file) {
    log(file?.path.toString() ?? '');
  }

  onError(String? error) {}

  onProcessing(bool isProcessing) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CameraView(
            controller: cameraEventController,
            onSavedFile: onSavedFile,
            onError: onError,
            onProcessing: onProcessing,
            onFlashModeChanged: (p) {
              print(p);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              child: Text("Cap"),
              onPressed: onCapPicture,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text("Video"),
              onPressed: onRecordVideo,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              child: Text("Cam"),
              onPressed: onChangeCam,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              child: Text("Flash"),
              onPressed: onChangeFlashMode,
            ),
          )
        ],
      ),
    );
  }
}
