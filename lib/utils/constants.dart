// ignore_for_file: constant_identifier_names

import 'package:inno_bundle/utils/functions.dart';

/// Start message for the CLI
const String START_MESSAGE = '''\n
╔════════════════════════════════════════════════════╗
║                                                    ║
║              ✨✨   INNO BUNDLE  ✨✨              ║
║                                                    ║
╚════════════════════════════════════════════════════╝
\n''';

/// Header message for ISS script
const String scriptHeader = '''
; Script generated by inno_bundle package for a flutter app.
; Maintainer: https://www.linkedin.com/in/hahouari/
\n''';

/// End message for the CLI
const String BUILD_END_MESSAGE = '''\n
=========> INSTALLER GENERATED SUCCESSFULLY <=========
                  ❤️  THANK YOU!  ❤️
''';

/// End message for the CLI
const String GUID_END_MESSAGE = '''\n
============> GUID GENERATED SUCCESSFULLY <===========
                  ❤️  THANK YOU!  ❤️
''';

const innoDownloadLink = "https://jrsoftware.org/isdl.php";
const appBuildDir = ["build", "windows", "x64", "runner"];
const installerBuildDir = ["build", "windows", "x64", "installer"];
const system32 = ["C:", "Windows", "System32"];
const vcDllFiles = ["msvcp140.dll", "vcruntime140.dll", "vcruntime140_1.dll"];
const innoSysDirPath = ["C:", "Program Files (x86)", "Inno Setup 6"];
final innoUserDirPath = [
  getHomeDir(),
  "AppData",
  "Local",
  "Programs",
  "Inno Setup 6"
];

const defaultInstallerIconPlaceholder = "__default_installer__icon__";
