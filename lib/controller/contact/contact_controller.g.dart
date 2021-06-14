// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactController on _ContactControllerBase, Store {
  final _$editedAtom = Atom(name: '_ContactControllerBase.edited');

  @override
  bool get edited {
    _$editedAtom.reportRead();
    return super.edited;
  }

  @override
  set edited(bool value) {
    _$editedAtom.reportWrite(value, super.edited, () {
      super.edited = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ContactControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$formAtom = Atom(name: '_ContactControllerBase.form');

  @override
  GlobalKey<FormState> get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(GlobalKey<FormState> value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  final _$nameAtom = Atom(name: '_ContactControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_ContactControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$emailAtom = Atom(name: '_ContactControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$subjectMatterAtom =
      Atom(name: '_ContactControllerBase.subjectMatter');

  @override
  String get subjectMatter {
    _$subjectMatterAtom.reportRead();
    return super.subjectMatter;
  }

  @override
  set subjectMatter(String value) {
    _$subjectMatterAtom.reportWrite(value, super.subjectMatter, () {
      super.subjectMatter = value;
    });
  }

  final _$textAtom = Atom(name: '_ContactControllerBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$sendMessageContactAsyncAction =
      AsyncAction('_ContactControllerBase.sendMessageContact');

  @override
  Future<http.Response> sendMessageContact({BuildContext context}) {
    return _$sendMessageContactAsyncAction
        .run(() => super.sendMessageContact(context: context));
  }

  final _$validateFormAsyncAction =
      AsyncAction('_ContactControllerBase.validateForm');

  @override
  Future validateForm({BuildContext context}) {
    return _$validateFormAsyncAction
        .run(() => super.validateForm(context: context));
  }

  final _$requestPopAsyncAction =
      AsyncAction('_ContactControllerBase.requestPop');

  @override
  Future<bool> requestPop(dynamic context) {
    return _$requestPopAsyncAction.run(() => super.requestPop(context));
  }

  final _$_ContactControllerBaseActionController =
      ActionController(name: '_ContactControllerBase');

  @override
  void changeName(String newValue) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.changeName');
    try {
      return super.changeName(newValue);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePhone(String newValue) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.changePhone');
    try {
      return super.changePhone(newValue);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmail(String newValue) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.changeEmail');
    try {
      return super.changeEmail(newValue);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSubjectMatter(String newValue) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.changeSubjectMatter');
    try {
      return super.changeSubjectMatter(newValue);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeText(String newValue) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.changeText');
    try {
      return super.changeText(newValue);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateNumber(String value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.validateNumber');
    try {
      return super.validateNumber(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateName(dynamic value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateEmail(dynamic value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateText(dynamic value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.validateText');
    try {
      return super.validateText(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic snackBarContactController(
      {BuildContext context, String text, Color color}) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.snackBarContactController');
    try {
      return super.snackBarContactController(
          context: context, text: text, color: color);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
edited: ${edited},
isLoading: ${isLoading},
form: ${form},
name: ${name},
phone: ${phone},
email: ${email},
subjectMatter: ${subjectMatter},
text: ${text}
    ''';
  }
}
