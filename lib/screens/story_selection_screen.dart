import 'package:flutter/material.dart';

class StoryOption {
  final String title;
  final IconData icon;
  final Color color;

  const StoryOption({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class StoryOptionCard extends StatefulWidget {
  final StoryOption option;
  final VoidCallback onTap;
  final int index;

  const StoryOptionCard({
    required this.option,
    required this.onTap,
    required this.index,
    super.key,
  });

  @override
  State<StoryOptionCard> createState() => _StoryOptionCardState();
}

class _StoryOptionCardState extends State<StoryOptionCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        height: 100,
        decoration: BoxDecoration(
          color: _isTapped ? widget.option.color : widget.option.color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: _isTapped
              ? [
            BoxShadow(
              color: widget.option.color,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  widget.option.icon,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(width: 20),
                Text(
                  widget.option.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(
              widget.index == 0 ? Icons.nights_stay_rounded : Icons.arrow_forward_ios,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}


class StorySelectionScreen extends StatelessWidget {
  const StorySelectionScreen({super.key});

  final List<StoryOption> options = const [
    StoryOption(
      title: "Bedtime Stories",
      icon: Icons.nightlight_round,
      color: Color(0xFF8C52FF),
    ),
    StoryOption(
      title: "Adventure Time",
      icon: Icons.person_pin_circle_rounded,
      color: Color(0xFFFF5733),
    ),
    StoryOption(
      title: "Learning Tales",
      icon: Icons.menu_book_rounded,
      color: Color(0xFF4CAF50),
    ),
    StoryOption(
      title: "Make Your Own",
      icon: Icons.star_border_rounded,
      color: Color(0xFFFFC300),
    ),
  ];

  void _onOptionSelected(String title) {
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Center(
          child: Column(
            children: [
            const Text(
            "Hello, Alex!",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "What Story Should We Tell?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          ],
        ),
      ),

      const SizedBox(height: 30),



              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: StoryOptionCard(
                        option: option,
                        onTap: () => _onOptionSelected(option.title),
                        index: index,
                      ),
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Text(
                      "Pick your adventure and let's begin!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.auto_fix_high_rounded, color: Colors.yellow, size: 16),
                        SizedBox(width: 5),
                        Text(
                          "AI will create your unique story",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}