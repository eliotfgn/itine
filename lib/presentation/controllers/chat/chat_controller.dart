import 'package:get/get.dart';
import 'package:itine/core/services/api/chat/chat_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/domains/models/chat/chat.dart';
import 'package:itine/domains/models/chat/message.dart';
import 'package:itine/domains/models/user/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final ChatService _chatService = ChatService();

  RxList<Message> messages = <Message>[].obs;

  IO.Socket socket = IO.io(
      'https://047c-137-255-34-104.ngrok-free.app/',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  @override
  void onInit() {
    loadMessages();

    socket = socket.connect();
    socket.onConnect((data) {});

    socket.on('chat', (data) {
      print(data);
    });
    super.onInit();
  }

  loadMessages() async {
    Chat chat = await _chatService.getCustomerChat();
    List<Message> data = await _chatService.getMessages(chat.id);
    messages.addAll(data);
  }

  Future<void> sendMessage(String text) async {
    SessionStorageService storageService = SessionStorageService();
    User? user = await storageService.getConnectedUser();

    socket.emit('chat', {"senderId": user?.id, "chatId": 8, "text": text});
  }
}
