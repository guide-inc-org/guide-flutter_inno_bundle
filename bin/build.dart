import 'dart:io';

import 'package:args/args.dart';
import 'package:inno_bundle/models/app_builder.dart';
import 'package:inno_bundle/models/build_type.dart';
import 'package:inno_bundle/models/config.dart';
import 'package:inno_bundle/models/installer_builder.dart';
import 'package:inno_bundle/models/script_builder.dart';
import 'package:inno_bundle/utils/constants.dart';

/// Builds the application using the provided configuration.
///
/// Returns the directory containing the built application files.
Future<Directory> _buildApp(Config config) async {
  final builder = AppBuilder(config);
  return await builder.build();
}

/// Generates the Inno Setup script file for the installer.
///
/// Returns the generated Inno Setup script file.
Future<File> _buildScript(Config config, Directory appDir) async {
  final builder = ScriptBuilder(config, appDir);
  return await builder.build();
}

/// Builds the installer using the provided configuration and Inno Setup script file.
Future<void> _buildInstaller(Config config, File scriptFile) async {
  final builder = InstallerBuilder(config, scriptFile);
  await builder.build();
}

/// Run to build installer
void main(List<String> arguments) async {
  print(START_MESSAGE);
  final parser = ArgParser()
    ..addFlag(BuildType.release.name, negatable: false)
    ..addFlag(BuildType.profile.name, negatable: false)
    ..addFlag(BuildType.debug.name, negatable: false, help: 'Default flag')
    ..addFlag('app', defaultsTo: true, help: 'build app')
    ..addFlag('installer', defaultsTo: true, help: 'build installer')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Print this help');
  final parsedArgs = parser.parse(arguments);
  final type = BuildType.fromArgs(parsedArgs);
  final app = parsedArgs['app'] as bool;
  final installer = parsedArgs['installer'] as bool;
  final help = parsedArgs['help'] as bool;

  if (help) {
    print("${parser.usage}\n");
    exit(0);
  }

  final config = Config.fromFile(type: type, app: app, installer: installer);
  final appBuildDir = await _buildApp(config);
  final scriptFile = await _buildScript(config, appBuildDir);
  await _buildInstaller(config, scriptFile);

  print(BUILD_END_MESSAGE);
}
