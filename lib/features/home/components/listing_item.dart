import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/assets_path.dart';

class ListingItem extends StatefulWidget {
  final String text;
  const ListingItem({super.key, required this.text});

  @override
  State<ListingItem> createState() => _ListingItemState();
}

class _ListingItemState extends State<ListingItem>
    with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _buttonAnimation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.easeInOut,
      ),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeInOut,
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      _buttonController.forward().then((_) {
        _textController.forward();
      });
    });
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 187,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            image: DecorationImage(
              image: AssetImage(
                AssetsPath.listingOne,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: SizedBox(
                    height: 50,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              child: AnimatedBuilder(
                                animation: _textAnimation,
                                builder: (context, child) {
                                  return SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: Opacity(
                                      opacity: _textAnimation.value,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.text,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: AppColors.blackColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).asGlass(
                                    enabled: true,
                                    blurX: 20,
                                    blurY: 20,
                                    tintColor: Colors.white,
                                    clipBorderRadius:
                                        BorderRadius.circular(30.0),
                                  );
                                },
                              ),
                            ),
                            AnimatedBuilder(
                              animation: _buttonAnimation,
                              builder: (context, child) {
                                return Positioned(
                                  top: 0,
                                  left: (_buttonAnimation.value *
                                      (constraints.maxWidth - 60)),
                                  bottom: 0,
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 23,
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: AppColors.beaverColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
