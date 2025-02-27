import 'dart:io';

class ProjectArc {
  ProjectArc() {
    final projectPathWithLib = "${Directory.current.path}/lib";

    print('Please enter a Feature Name: ');
    String? featureName = stdin.readLineSync();

    final directories = [
      //! Assets
      // "$projectPath/assets",
      // "$projectPath/assets/images",
      // "$projectPath/assets/images/icons",
      // "$projectPath/assets/images/icons/1.5x",
      // "$projectPath/assets/images/icons/2.0x",
      // "$projectPath/assets/images/icons/3.0x",
      // "$projectPath/assets/images/icons/4.0x",
      // "$projectPath/assets/images/background",
      // "$projectPath/assets/images/background/1.5x",
      // "$projectPath/assets/images/background/2.0x",
      // "$projectPath/assets/images/background/3.0x",
      // "$projectPath/assets/images/background/4.0x",
      // "$projectPath/assets/images/others",
      // "$projectPath/assets/images/others/1.5x",
      // "$projectPath/assets/images/others/2.0x",
      // "$projectPath/assets/images/others/3.0x",
      // "$projectPath/assets/images/others/4.0x",
      // "$projectPath/assets/fonts",
      // "$projectPath/assets/svg",
      //   //! Config
      //   "$projectPathWithLib/config",
      //   "$projectPathWithLib/config/routes",
      //   "$projectPathWithLib/config/theme",
      //   //!Core
      //   "$projectPathWithLib/core",
      //   "$projectPathWithLib/core/api",
      //   "$projectPathWithLib/core/error",
      //   "$projectPathWithLib/core/caching",
      //   "$projectPathWithLib/core/widgets",
      //   "$projectPathWithLib/core/utils",
      //   // !Features
      //   "$projectPathWithLib/features",
      //! Feature
      "$projectPathWithLib/features/$featureName",
      "$projectPathWithLib/features/$featureName/data",
      "$projectPathWithLib/features/$featureName/data/datasources",
      "$projectPathWithLib/features/$featureName/data/models",
      "$projectPathWithLib/features/$featureName/data/repositories",
      "$projectPathWithLib/features/$featureName/logic",
      "$projectPathWithLib/features/$featureName/presentation",
      "$projectPathWithLib/features/$featureName/presentation/screens",
      "$projectPathWithLib/features/$featureName/presentation/widget",
    ];

    // final directoryFiles = files(projectPathWithLib, featureName);

    _createFolders(directories);
  }

  void _createFolders(List<String> directories) {
    for (var element in directories) {
      final directory = Directory(element);

      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        print('\x1B{33mFolder created: $element\x1B{0m');
      } else {
        print('\x1B{33mFolder already exists: $element\x1B{0m');
      }
    }

    print('\x1B{32mFolders created successfully!\x1B{0m');
  }
}

// Function to define folders and their files
Map<String, List<Map<String, String>>> files(String path, String featureName) {
  return {
    '$path/data/repositories': [
      {
        'fileName': '${featureName.toLowerCase()}_repository.dart',
        'content': '''
        import '${featureName.toLowerCase()}_repository.dart';

        class ${featureName}Repository {
              }
        '''
      }
    ],
    '$path/data/datasources': [
      {
        'fileName': '${featureName.toLowerCase()}_local_datasources.dart',
        'content': '''
        import '${featureName.toLowerCase()}_local_datasources.dart';

        class ${featureName}LocalDataSource {
              }
        '''
      },
      {
        'fileName': '${featureName.toLowerCase()}_remote_datasources.dart',
        'content': '''
        import '${featureName.toLowerCase()}_remote_datasources.dart';

        class ${featureName}RemoteDataSource {
              }
        '''
      }
    ],
    '$path/logic': [
      {
        'fileName': '${featureName.toLowerCase()}_cubit.dart',
        'content': '''
        import 'package:flutter_bloc/flutter_bloc.dart';
        import '${featureName.toLowerCase()}_states.dart';
        class ${featureName}Cubit extends Cubit<${featureName}States>{
        }
        '''
      },
      {
        'fileName': '${featureName.toLowerCase()}_states.dart',
        'content': '''
        class ${featureName}States extends Equatable {
        @override
        List<Object?> get props => [];
        }
        '''
      }
    ],
    '$path/presentation/screens': [
      {
        'fileName': 'add_${featureName.toLowerCase()}_screen.dart',
        'content': '''
          import 'package:flutter/material.dart';
          import '../../../../core/widgets/my_appbar.dart';

          class ${featureName}Screen extends StatelessWidget {
            const ${featureName}Screen({super.key});

            @override
            Widget build(BuildContext context) {
              return const Scaffold(
              appBar: AppBar(),
                body: SingleChildScrollView(
                    child: Column(
                      children: [
                      ],
                    ),
                  ),
              );
            }
          }
        '''
      }
    ],
  };
}

void main(List<String> args) {
  ProjectArc();
}
