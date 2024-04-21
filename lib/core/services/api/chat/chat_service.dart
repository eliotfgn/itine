import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/domains/models/chat/chat.dart';
import 'package:itine/domains/models/chat/message.dart';
import 'package:itine/domains/models/user/user.dart';

class ChatService extends ApiService {
  Future<Chat> getCustomerChat() async {
    SessionStorageService storageService = SessionStorageService();
    User? user = await storageService.getConnectedUser();

    Response response =
        await client.get('${ApiEndpoints.chat}/customer/${user?.id}');

    return Chat.fromJson(response.data);
  }

  Future<List<Message>> getMessages(int chatId) async {
    List<Message> messages = [];

    Response response =
        await client.get('${ApiEndpoints.chat}/$chatId/messages');

    response.data.forEach((message) {
      messages.add(Message.fromJson(message));
    });

    return messages;
  }
}
