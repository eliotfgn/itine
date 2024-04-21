import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/chat/chat_controller.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  
  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: Get.height * 0.81,
            width: Get.width,
            child: ListView(
              children: [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomTextFormField(
              hint: 'Ecrire un message',
              visible: true,
              controller: _messageController,
              suffix: const Icon(
                Icons.send_rounded,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
