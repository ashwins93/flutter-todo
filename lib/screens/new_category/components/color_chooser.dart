import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorChooser extends StatefulWidget {
  @override
  _ColorChooserState createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooser> {
  Color _chosenColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ButtonStyle(
              alignment: Alignment.centerRight,
              elevation: MaterialStateProperty.all(8.0),
              shadowColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.bodyText1!.color),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))))),
          onPressed: () {
            _openDialog(context);
          },
          child: Row(children: [
            Text(
              'Choose Color ',
              style: TextStyle(fontSize: 16),
            ),
            Icon(
              Icons.palette,
              color: _chosenColor,
            )
          ]),
        )
      ],
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Choose Color'),
              contentPadding: const EdgeInsets.all(6.0),
              content: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 240),
                child: MaterialColorPicker(
                    selectedColor: _chosenColor,
                    onColorChange: (value) {
                      setState(() {
                        _chosenColor = value;
                      });
                    }),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
              // content: Text('Hello'),
            ));
  }
}
