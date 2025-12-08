import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';

class ChatPhotoInput extends StatefulWidget {
  final String? initialValue; // Path to existing photo
  final Function(String) onPhotoSelected;
  final ThemeVariant variant;

  const ChatPhotoInput({
    super.key,
    this.initialValue,
    required this.onPhotoSelected,
    this.variant = ThemeVariant.neutral,
  });

  @override
  State<ChatPhotoInput> createState() => _ChatPhotoInputState();
}

class _ChatPhotoInputState extends State<ChatPhotoInput> {
  final ImagePicker _picker = ImagePicker();
  String? _photoPath;

  @override
  void initState() {
    super.initState();
    _photoPath = widget.initialValue;
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _photoPath = image.path;
        });
        widget.onPhotoSelected(image.path);
      }
    } catch (e) {
      // Handle errors (permissions, etc.)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Errore nel caricamento della foto: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.photo_camera,
                    color: AppTheme.getPrimaryColor(widget.variant),
                  ),
                  title: const Text('Scatta una foto'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    color: AppTheme.getPrimaryColor(widget.variant),
                  ),
                  title: const Text('Scegli dalla galleria'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                if (_photoPath != null)
                  ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: AppTheme.errorColor,
                    ),
                    title: const Text('Rimuovi foto'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _photoPath = null;
                      });
                      widget.onPhotoSelected('');
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: InkWell(
        onTap: _showPickerOptions,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.getSurfaceColor(widget.variant),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: _photoPath != null
                  ? AppTheme.getPrimaryColor(widget.variant)
                  : AppTheme.neutralTextHintColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: _photoPath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(File(_photoPath!), fit: BoxFit.cover),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.getPrimaryColor(widget.variant),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.check,
                                color: AppTheme.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 48,
                          color: AppTheme.getPrimaryColor(widget.variant),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Aggiungi una foto',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.getPrimaryColor(widget.variant),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Scatta o scegli dalla galleria',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.neutralTextHintColor,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
