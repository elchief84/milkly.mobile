import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/core/utils/theme_extensions.dart';

class ChatInputField extends StatefulWidget {
  final String? placeholder;
  final TextInputType keyboardType;
  final String? initialValue;
  final bool enabled;
  final Function(String) onSend;
  final ThemeVariant variant;

  const ChatInputField({
    super.key,
    this.placeholder,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    this.enabled = true,
    required this.onSend,
    this.variant = ThemeVariant.neutral,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _handleSend() {
    if (_hasText && widget.enabled) {
      widget.onSend(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: context.colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: widget.keyboardType,
              enabled: widget.enabled,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
              ),
              onSubmitted: (_) => _handleSend(),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: _hasText && widget.enabled
                  ? AppTheme.getPrimaryColor(widget.variant)
                  : AppTheme.getPrimaryLightColor(widget.variant),
            ),
            onPressed: _hasText && widget.enabled ? _handleSend : null,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
