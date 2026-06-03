import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';

class HelperBotScreen extends ConsumerStatefulWidget {
  const HelperBotScreen({super.key});

  @override
  ConsumerState<HelperBotScreen> createState() => _HelperBotScreenState();
}

class _HelperBotScreenState extends ConsumerState<HelperBotScreen> {
  final List<String> _messages = [
    "Hello. I am the RoadSoS Helper Bot.",
    "Are there any casualties? Reply YES or NO.",
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add("You: ${_controller.text}");
      // Simple offline mock logic
      if (_controller.text.trim().toUpperCase() == 'YES') {
        _messages.add("Bot: Upgrading severity to P1_CRITICAL. Dispatching medical services.");
      } else {
        _messages.add("Bot: Acknowledged. Please stay safe while we connect to services.");
      }
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Helper Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final isUser = _messages[index].startsWith('You:');
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: isUser ? ColorTokens.accentPrimary : ColorTokens.bgElevated,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _messages[index].replaceFirst(isUser ? 'You: ' : 'Bot: ', ''),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isUser ? Colors.white : ColorTokens.textPrimary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  icon: const Icon(Icons.send, color: ColorTokens.accentPrimary),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
