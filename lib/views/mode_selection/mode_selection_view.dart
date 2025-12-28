import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_constants.dart';

class ModeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text('Select Mode', style: AppConstants.textTheme.headlineSmall),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildModeButton('Translator', '/translator'),
            _buildModeButton('Free Talk', '/free_talk'),
            _buildModeButton('Earbud + Phone', '/earbud_phone'),
            _buildModeButton('Photo Translation', '/photo_translation'),
            _buildModeButton('AI Dialogue', '/ai_dialogue'),
          ],
        ),
      ),
    );
  }

  Widget _buildModeButton(String title, String route) {
    return Card(
      color: AppConstants.secondaryColor,
      child: InkWell(
        onTap: () => Get.toNamed(route),
        child: Center(
          child: Text(
            title,
            style: AppConstants.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
