// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  final _$allRequestAtom = Atom(name: '_ControllerBase.allRequest');

  @override
  SegmentAndProvider get allRequest {
    _$allRequestAtom.reportRead();
    return super.allRequest;
  }

  @override
  set allRequest(SegmentAndProvider value) {
    _$allRequestAtom.reportWrite(value, super.allRequest, () {
      super.allRequest = value;
    });
  }

  final _$getAllRequesControllerAsyncAction =
      AsyncAction('_ControllerBase.getAllRequesController');

  @override
  Future<dynamic> getAllRequesController() {
    return _$getAllRequesControllerAsyncAction
        .run(() => super.getAllRequesController());
  }

  final _$openBrowserControllerAsyncAction =
      AsyncAction('_ControllerBase.openBrowserController');

  @override
  Future openBrowserController({String url}) {
    return _$openBrowserControllerAsyncAction
        .run(() => super.openBrowserController(url: url));
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  dynamic openSnackBarController(
      {BuildContext context, Color color, String text}) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.openSnackBarController');
    try {
      return super
          .openSnackBarController(context: context, color: color, text: text);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool hasNullDataProviderController(Prestadores provider) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.hasNullDataProviderController');
    try {
      return super.hasNullDataProviderController(provider);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allRequest: ${allRequest}
    ''';
  }
}
