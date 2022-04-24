import 'package:js/js.dart';

@JS()
@anonymous
class TestClass {
  external Function aFunc;
  external Function bFunc;

  external factory TestClass({
    Function aFunc,
    Function bFunc,
  });
}

TestClass _allowInteropTestClass({
  required Function aFunc,
  required Function bFunc,
}) {
  return TestClass(
    aFunc: allowInterop(aFunc),
    bFunc: allowInterop(bFunc),
  );
}

TestClass __createTestClass() {
  print('Hello from Dart!');
  return _allowInteropTestClass(aFunc: () {
    print('aFunc Hello from Dart!');
  }, bFunc: () {
    print('bFunc Hello from Dart!');
  });
}

@JS('testClass')
external set _testClassName(TestClass clazz);

/// Allows calling the assigned function from Dart as well.
@JS()
external TestClass testClass;

void register() {
  _testClassName = __createTestClass();
  // call aFunc()
  testClass.aFunc();
}

@JS('createTestClass')
external set _createTestClass(TestClass Function() f);

/// Allows calling the assigned function from Dart as well.
@JS()
external TestClass createTestClass();

void registerCreate() {
  _createTestClass = allowInterop(__createTestClass);
  // create call bFunc()
  createTestClass().bFunc();
}
