import 'package:di/di.dart';
import 'package:angular/angular.dart';

import 'homepage.dart';

// This annotation allows Dart to shake away any classes
// not used from Dart code nor listed in another @MirrorsUsed.
//
// If you create classes that are referenced from the Angular
// expressions, you must include a library target in @MirrorsUsed.
@MirrorsUsed(targets: const[
  'angular',
  'angular.core',
  'angular.core.dom',
  'angular.filter',
  'angular.perf',
  'angular.directive',
  'angular.routing',
  'angular.core.parser.dynamic_parser',
  'angular.core.parser.lexer',
  'homepage',
  'perf_api',
  'List',
  'NodeTreeSanitizer'
  ],
  override: '*')
import 'dart:mirrors';
import 'dart:html';

main() {

  var module = new Module()
    ..type(HomepageController)
    ..type(ServerController);
     
  ngBootstrap(module: module);
}