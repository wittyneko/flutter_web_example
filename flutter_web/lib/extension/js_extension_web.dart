// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

extension JsExtension<F extends Function> on F {
  F get allowInterop => js.allowInterop(this);
}
