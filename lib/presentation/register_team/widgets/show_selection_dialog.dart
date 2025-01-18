import 'package:flutter/material.dart';

import '../../../core/core.dart';

Future<void> showSelectionDialog({
  required BuildContext context,
  required VoidCallback onTapGalery,
  required VoidCallback onTapCamera,
}) =>
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text(
              'Selecciona una opción para subir tu foto.',
              style: ComTextStyle.body2.sec500,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: onTapGalery,
                    child: Text(
                        'Galería'), /*() {
                                                    viewModel.openGallery();
                                                    autoRouterPop(context);
                                                  },*/
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    onTap: onTapCamera,
                    child: Text(
                        'Camara'), /*() {
                                                    viewModel.openCamera();
                                                    autoRouterPop(context);
                                                  },*/
                  )
                ],
              ),
            )));
