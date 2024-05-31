// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';

class SearchForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Animation<double> scaleAnimation;
  const SearchForm({
    super.key,
    required this.formKey,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeTransition(
              opacity: scaleAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  size: 22,
                  color: AppColors.blackColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
