import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  final List<String> tabs = [
    'Device Pairing',
    'AI Dialog',
    'Free Talk',
    'Translation Machine',
    'Headphones & Phones',
    'Photo Translation',
    'Audio Or Video Translation',
  ];

  final List<List<String>> methods = [
    [
      'Connect your earbuds via Bluetooth',
      'Ensure Bluetooth is enabled on your device',
    ],
    [
      'Enable AI features in settings',
      'Grant microphone and speech recognition permissions',
    ],
    [
      'Start conversations with real-time translation',
      'Select source and target languages',
    ],
    [
      'Use machine translation for documents',
      'Upload or paste text for translation',
    ],
    [
      'Pair headphones and phones for dual audio',
      'Connect both devices simultaneously',
    ],
    [
      'Scan photos for instant text translation',
      'Point camera at text and capture',
    ],
    [
      'Translate audio/video content on the fly',
      'Play media and select translation option',
    ],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // App Title
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'STE',
                style: TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: AppConstants.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Screen Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Quick Start',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppConstants.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Horizontal Tabs
            Container(
              height: 50,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicator: BoxDecoration(),
                dividerColor: Colors.transparent,
                labelColor: AppConstants.textColor,
                unselectedLabelColor: Colors.grey,
                labelPadding: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.zero,
                tabs: tabs
                    .map(
                      (tab) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _currentTabIndex == tabs.indexOf(tab)
                              ? AppConstants.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(tab),
                      ),
                    )
                    .toList(),
              ),
            ),
            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((tab) => _buildTabContent(tab)).toList(),
              ),
            ),
            // Methods Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: AppConstants.textColor,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Methods',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppConstants.textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...methods[_currentTabIndex].asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${entry.key + 1}. ',
                            style: TextStyle(
                              color: AppConstants.textColor,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              entry.value,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: AppConstants.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppConstants.textColor,
                          fontSize: 16,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppConstants.textColor),
                        minimumSize: Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentTabIndex < tabs.length - 1) {
                          _tabController.animateTo(_currentTabIndex + 1);
                        } else {
                          Get.toNamed(AppRoutes.onboarding2);
                        }
                      },
                      child: Text(
                        _currentTabIndex == tabs.length - 1
                            ? 'Get Started'
                            : 'Next Step',
                        style: TextStyle(
                          color: AppConstants.textColor,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.primaryColor,
                        minimumSize: Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String tab) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getIconForTab(tab),
            size: 100,
            color: AppConstants.primaryColor,
          ),
          SizedBox(height: 20),
          Text(
            tab,
            style: TextStyle(
              fontFamily: AppConstants.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppConstants.textColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Placeholder content for $tab',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppConstants.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getIconForTab(String tab) {
    switch (tab) {
      case 'Device Pairing':
        return Icons.bluetooth;
      case 'AI Dialog':
        return Icons.chat;
      case 'Free Talk':
        return Icons.mic;
      case 'Translation Machine':
        return Icons.translate;
      case 'Headphones & Phones':
        return Icons.headphones;
      case 'Photo Translation':
        return Icons.camera_alt;
      case 'Audio Or Video Translation':
        return Icons.video_call;
      default:
        return Icons.help;
    }
  }
}
