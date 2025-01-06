import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/_core/component/button_component.dart';
import 'package:github_user_technical/_core/constant/typography.dart';
import '../components/user_card.dart';

class PopularListScreen extends StatelessWidget {
  const PopularListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TypographyStyles.h5('Github User Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Handle icon button press
                print('Settings button pressed');
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: 'Popular',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              buildPopularContent(),
              buildFavoriteContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          UserCard(
            imageUrl: "https://picsum.photos/200",
            name: "John Doe",
            role: "User",
          ),
        ],
      ),
    );
  }

  Widget buildFavoriteContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          UserCard(
            imageUrl: "https://picsum.photos/200",
            name: "John Doe",
            role: "User",
          ),
        ],
      ),
    );
  }

  Widget buildEmptyStateFavorite() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypographyStyles.bodyMainBold(
            'No Favorites Yet!',
          ),
          SizedBox(height: 10.h),
          TypographyStyles.bodyCaptionRegular(
            'Star repositories or bookmark projects to easily find them here later. Let’s build your list of go-to resources!',
          ),
          ButtonComponent(
            text: 'Refresh',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
