import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/widgets/chats/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chats/my_messa_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar : AppBar (
      leading: const Padding(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://scontent.fbog2-5.fna.fbcdn.net/v/t39.30808-6/430128595_10160497608911378_6872502731495612408_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=_WGS7FTNMmcAX9rAvYf&_nc_ht=scontent.fbog2-5.fna&oh=00_AfDUD2ounICvW-5sCCC2eTPJdPEizN-Dv7HASJT_pndJxg&oe=65FD7DC2'),
        ),
      ),
      title: const Text('Mi amor ❤️'),
      centerTitle: false,
    ),

    body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                       
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message  )
                          : MyMessageBubble( message: message );
                    })),

            /// Caja de texto de mensajes
           MessageFieldBox(
            onValue: chatProvider.sendMessage,
           ),
          ],
        ),
      ),
    );
  }
}


 