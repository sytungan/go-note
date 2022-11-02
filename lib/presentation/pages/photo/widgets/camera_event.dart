import 'dart:async';

enum CameraEvent {
  capture,
  record,
  toggleCam,
  toggleFlash,
}

typedef CameraEventController = StreamController<CameraEvent>;
