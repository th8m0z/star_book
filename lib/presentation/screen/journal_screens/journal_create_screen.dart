import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/routes/app_router_name.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';

class JournalCreateScreen extends StatelessWidget {
  const JournalCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_new_outlined,
          label: 'Back',
          onTap: () => context.pop(),
        ),
        center: 'New Thought',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.04),
            const AddNewDetails(),
            SizedBox(height: screenHeight * 0.04),
            SelectableTile(
              title: 'Date',
              onTap: () => context.goNamed(AppRouterName.datePickerScreen),
            ),
            SizedBox(height: screenHeight * 0.04),
            SelectableTile(
              title: 'Mood',
              onTap: () => context.goNamed(AppRouterName.moodPickerScreen),
            ),
            SizedBox(height: screenHeight * 0.04),
            const CustomTextFormField(
                heading: 'Title', label: 'Enter Mood Title'),
            SizedBox(height: screenHeight * 0.04),
            const CustomTextFormField(heading: 'Note', label: 'Write Note'),
          ],
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(

          ///Todo: Here we can't pop screen or we need to handle data from pop()
          onTap: () => context.pop(),

          // onTap: () {
          //   if (isHomeScreen) {
          //     log('If: $isHomeScreen');
          //     context.goNamed(AppRouterName.monthScreen, params: {
          //       'year': year.toString(),
          //       'month': month.toString(),
          //       'isHomeScreen': isHomeScreen.toString(),
          //     });
          //   } else {
          //     log('Else');
          //     context.pop();
          //   }
          // },
          child: const Icon(Icons.check)),
    );
  }
}

class AddNewDetails extends StatelessWidget {
  const AddNewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: screenWidth * 0.02),
        const Image(image: AssetImage('assets/icons/book.png'), height: 36),
        SizedBox(width: screenWidth * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Details',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor,
                  ),
            ),
            SizedBox(height: screenHeight * 0.004),
            Text(
              'Write your today’s thought details below',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
