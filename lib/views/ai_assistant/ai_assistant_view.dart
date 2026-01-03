import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_constants.dart';
import '../../services/ai_service.dart';

class MessageModel {
  final String text;
  final bool isUser;
  MessageModel({required this.text, required this.isUser});
}

class AiAssistantView extends StatefulWidget {
  @override
  _AiAssistantViewState createState() => _AiAssistantViewState();
}

class _AiAssistantViewState extends State<AiAssistantView> {
  bool isTextMode = false;
  String selectedLanguage = 'English';
  List<MessageModel> messages = [];
  bool isChatStarted = false;
  bool _isListening = false;
  String _recognizedText = '';
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startListening() async {
    // Placeholder for STT
    setState(() {
      _isListening = true;
      _recognizedText = '';
    });
    // Simulate listening
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _recognizedText = 'Hello, how can I help you?'; // Simulated text
      _isListening = false;
    });
  }

  Future<String> _getAIResponse(String message, String language) async {
    // Use ai_service
    AiService aiService = AiService();
    return await aiService.generateResponse(message);
  }

  Future<void> _sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      messages.add(MessageModel(text: text, isUser: true));
      isChatStarted = true;
      _recognizedText = '';
      _isListening = false;
    });
    String response = await _getAIResponse(text, selectedLanguage);
    setState(() {
      messages.add(MessageModel(text: response, isUser: false));
    });
  }

  Widget _buildIntroView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppConstants.primaryColor, Color(0xFF1BC8BB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(Icons.smart_toy, color: Colors.white, size: 40),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  "Hi ~ I'm your AI Assistant",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "If you have any questions, you can ask me at any time~",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatView() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        MessageModel msg = messages[index];
        return Align(
          alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: msg.isUser ? AppConstants.primaryColor : Color(0xFF333333),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              msg.text,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Color(0xFF111111),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    List<String> languages = [
                      'English',
                      'Spanish',
                      'French',
                      'German',
                      'Chinese',
                      'Arabic',
                      'Urdu',
                    ];
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: languages.length,
                        itemBuilder: (context, index) {
                          String lang = languages[index];
                          bool isSelected = selectedLanguage == lang;
                          return ListTile(
                            title: Text(
                              lang,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            trailing: isSelected
                                ? Icon(Icons.check, color: Colors.white)
                                : null,
                            onTap: () {
                              setState(() {
                                selectedLanguage = lang;
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.language, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      selectedLanguage,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: isChatStarted ? _buildChatView() : _buildIntroView(),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Color(0xFF2A2A2A),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: isTextMode
                    ? TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Please enter what you want to say ~',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Color(0xFF333333),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      )
                    : OutlinedButton(
                        onPressed: _recognizedText.isNotEmpty
                            ? () => _sendMessage(_recognizedText)
                            : (_isListening ? null : _startListening),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mic),
                            SizedBox(width: 8),
                            Text(
                              _recognizedText.isNotEmpty
                                  ? 'Send'
                                  : (_isListening
                                        ? 'Listening...'
                                        : 'Click and Speak'),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      isTextMode ? Icons.mic : Icons.keyboard,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (isTextMode) {
                        if (_controller.text.isNotEmpty) {
                          _sendMessage(_controller.text);
                          _controller.clear();
                        }
                      } else {
                        setState(() {
                          isTextMode = !isTextMode;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
