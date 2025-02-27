import 'dart:io';

void main() {
  while (true) {
    print('Please enter a name: ');
    String? inputName = stdin.readLineSync();
    if (inputName == null || inputName.isEmpty) {
      print('Exiting...');
      break;
    } else {
      String formattedName = camelToSnakeCase(inputName.toString().trim());
      print(formattedName);
    }
  }
}

String camelToSnakeCase(String input) {
  return '${input.replaceAllMapped(RegExp(r'([A-Z])'), (match) {
    return '_${match.group(0)!.toLowerCase()}';
  }).replaceFirst('_', '')}.dart';
}
