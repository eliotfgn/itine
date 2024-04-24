import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itine/core/services/api/chat/chat_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/domains/models/chat/chat.dart';
import 'package:itine/domains/models/chat/message.dart';
import 'package:itine/domains/models/user/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final SessionStorageService _sessionStorageService = SessionStorageService();
  final ChatService _chatService = ChatService();

  ScrollController scrollController = ScrollController();

  RxList<Message> messages = <Message>[].obs;
  Rxn<Chat> chat = Rxn<Chat>();

  IO.Socket socket = IO.io(
      'https://07d3-137-255-20-77.ngrok-free.app',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  @override
  void onInit() async {
    await loadMessages();

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);

    socket = socket.connect();
    socket.onConnect((data) {
      print('connexion to socket');
    });

    User? user = await _sessionStorageService.getConnectedUser();
    socket.emit('join-chat', user?.id);

    socket.on('new-message', (data) {
      messages.add(Message.fromJson(data));

      print('scrolling');
      print(scrollController.position.maxScrollExtent);
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
    super.onInit();
  }

  loadMessages() async {
    chat.value = await _chatService.getCustomerChat();
    List<Message> data = await _chatService.getMessages(chat.value?.id ?? -1);
    messages.addAll(data);
  }

  Future<void> sendMessage(
      String text, ScrollController scrollController) async {
    SessionStorageService storageService = SessionStorageService();
    User? user = await storageService.getConnectedUser();

    socket.emit('chat', {"senderId": user?.id, "chatId": 1, "text": text});
  }
}
