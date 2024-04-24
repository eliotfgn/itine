import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/chat/chat_controller.dart';
import 'package:itine/presentation/widgets/chat/admin_message_widget.dart';
import 'package:itine/presentation/widgets/chat/user_message_widget.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ChatController _chatController = Get.put(ChatController());
  late ScrollController scrollController;
  int userId = 1;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = _chatController.scrollController;
    super.initState();
  }

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
            child: Obx(
              () => ListView(
                controller: scrollController,
                children: _chatController.messages
                    .map((message) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: message.senderId == userId
                              ? UserMessageWidget(message.text)
                              : AdminMessageWidget(message.text),
                        ))
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomTextFormField(
              hint: 'Ecrire un message',
              visible: true,
              controller: _messageController,
              suffix: GestureDetector(
                onTap: () async {
                  await _chatController.sendMessage(
                      _messageController.text, scrollController);
                  _messageController.text = '';
                },
                child: const Icon(
                  Icons.send_rounded,
                  color: AppColors.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
