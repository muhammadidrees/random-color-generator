// a mock void callback that keeps
// track of how many times it was called
class MockVoidCallback {
  int _callCount = 0;

  void call() {
    _callCount++;
  }

  bool called(int times) => _callCount == times;
}
