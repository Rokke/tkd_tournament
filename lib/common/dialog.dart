import 'package:flutter/material.dart';

enum DialogType { DIALOG_OK, DIALOG_TEXT, DIALOG_YESNO }
Future<String> asyncInputDialog(
    BuildContext context, String text, DialogType dialogType,
    {info: String, title: String, hintText: String}) async {
  String response = '';
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      switch (dialogType) {
        case DialogType.DIALOG_TEXT:
          return AlertDialog(
            title: Text(title ?? 'Warning'),
            content: Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  autofocus: true,
                  decoration:
                      new InputDecoration(labelText: text, hintText: hintText),
                  onChanged: (value) {
                    response = value;
                  },
                ))
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(response);
                },
              ),
            ],
          );
        case DialogType.DIALOG_OK:
          return OKDialog(context, text);
        case DialogType.DIALOG_YESNO:
          return YesNoDialog(context, text);
      }
      return null;
    },
  );
}

class InputDialog extends AlertDialog {
  final String text, hintText;
  final dynamic resp;
  const InputDialog(
    this.text,
    this.hintText,
    this.resp, {
    Key key,
  }) : super(key: key);
}

class OKDialog extends AlertDialog {
  final String text;
  final BuildContext context;
  const OKDialog(this.context, this.text);
  @override
  Widget get title => Text('text');
  @override
  Widget get content {
    return Text('Trykk meg');
  }

  @override
  List<Widget> get actions {
    return [
      FlatButton(
        child: Text('Ok'),
        onPressed: () {
          Navigator.of(context).pop("OK");
        },
      ),
    ];
  }
}

class YesNoDialog extends AlertDialog {
  final String text, titleText;
  final BuildContext context;
  const YesNoDialog(this.context, this.text, {this.titleText});
  @override
  Widget get title => Text(titleText ?? 'Warning');
  @override
  Widget get content {
    return Text(text);
  }

  @override
  List<Widget> get actions {
    return [
      FlatButton(
        child: Text('No'),
        onPressed: () {
          Navigator.of(context).pop("NO");
        },
      ),
      FlatButton(
        child: Text('Yes'),
        onPressed: () {
          Navigator.of(context).pop("YES");
        },
      ),
    ];
  }
}
