export 'database/unsupported.dart'
    if (dart.library.ffi) 'database/drift_native.dart'
    if (dart.library.html) 'database/drift_web.dart';
