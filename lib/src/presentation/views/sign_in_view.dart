import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_gym_coach/src/config/router/app_router.dart';
import 'package:my_gym_coach/src/locator.dart';
import 'package:my_gym_coach/src/presentation/views/home_view.dart';
import 'package:my_gym_coach/src/presentation/widgets/buttons.dart';
import 'package:my_gym_coach/src/presentation/widgets/edit_text_style.dart';
import 'package:my_gym_coach/src/utils/constants/app-colors.dart';
import 'package:my_gym_coach/src/utils/constants/general.dart';
import 'package:my_gym_coach/src/utils/constants/images.dart';
import 'package:my_gym_coach/src/utils/constants/strings.dart';
import 'package:my_gym_coach/src/utils/store/app-store.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/AppWidget.dart';

class SignInView extends HookWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    var width = context.width();
    var height = context.height();
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(
                          BuildContext, String)?,
                      imageUrl: t6_ic_logo,
                      width: width),
                ),
                const SizedBox(
                  height: 30,
                ),
                text("Username*",
                    textColor: locator<AppStore>().textSecondaryColor),
                const SizedBox(height: 8),
                EditTextStyle(t6_username),
                const SizedBox(height: 16),
                text("Mobile Number*",
                    textColor: locator<AppStore>().textSecondaryColor),
                const SizedBox(height: 8),
                EditTextStyle(t6_mobileno),
                const SizedBox(height: 10),
                Container(
                    alignment: Alignment.topRight,
                    child: text("Forgot Password?")),
                const SizedBox(height: 16),
                MainButton(
                  textContent: "Sign In",
                  onPressed: () {
                    appRouter.push(const DashboardViewRoute());
                    appRouter.popUntilRouteWithName('WalkthroughView');
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text("New to this Experience?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                        child: const Text("Sign up",
                            style: TextStyle(
                                fontSize: textSizeMedium,
                                decoration: TextDecoration.underline,
                                color: t6form_google)),
                        onTap: () {
                          appRouter.push(SignUpViewRoute());
                        })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    child: text("or with",
                        textAllCaps: true, textColor: t6colorPrimary)),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: t6form_google),
                        width: width / 7.5,
                        height: width / 7.5,
                        padding: EdgeInsets.all(width / 28),
                        child: SvgPicture.asset(
                          t6_google_fill,
                          color: t6white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: t6form_facebook),
                      width: width / 7.5,
                      height: width / 7.5,
                      padding: EdgeInsets.all(width / 28),
                      child: SvgPicture.asset(
                        t6_facebook_fill,
                        color: t6white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
