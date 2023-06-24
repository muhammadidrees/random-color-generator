# Color Generator
A fluttter package that generates a random color.

## Usage

You can use the `RandomColorGenerator` class to generate a random color.

### Example
```dart
import 'package:color_generator/color_generator.dart';

void main() {
  print(RandomColorGenerator().generate());
}
```

You can also use `RandomUniqueColorGenerator` class to generate a random color that ensures that the same color is not generated twice.

### Example
```dart
import 'package:color_generator/color_generator.dart';

void main() {
  print(RandomUniqueColorGenerator().generate());
}
```

