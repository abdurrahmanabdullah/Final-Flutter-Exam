import 'package:exam_2/core/enums/view_state.dart';
import 'package:exam_2/core/view_models/sign_in_view_model.dart';
import 'package:exam_2/ui/route_navigation.dart';
import 'package:exam_2/ui/shared/app_colors.dart';
import 'package:exam_2/ui/shared/ui_helpers.dart';
import 'package:exam_2/ui/views/base_view.dart';
import 'package:exam_2/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

bool obscureText = true;

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
        onModelReady: (model) async {
          // await model.signInAPI();
        },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                centerTitle: true,
                title: const Text('Sign In '),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(UIHelper.bigPadding(context)),
                  child: Form(
                    key: model.formKey,
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  label: const Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Text(
                                        'User Name',
                                        // "Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  alignLabelWithHint: true,
                                  hintText: 'Please Enter Your User Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: model.userNameController,
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
                              TextFieldWidget(
                                textFieldLabel: 'Password',
                                leadingIcon: Icons.password,
                                isLastField: true,
                                passwordField:
                                    model.isPasswordVisible ? false : true,
                                trialWidget: Icon(
                                  model.isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                trialIconOnTap: () {
                                  model.changeIsPasswordVisible();
                                },
                                controller: model.passwordController,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: UIHelper.deviceWidth(context) >
                                            UIHelper.deviceHeight(context)
                                        ? UIHelper.deviceWidth(context) * 0.2
                                        : 0,
                                  ),
                                  Checkbox(
                                    value: model.isCredentialsSaved,
                                    checkColor: Colors.white,
                                    activeColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    onChanged: (value) {
                                      model.toggleIsCredentialsSaved();
                                    },
                                  ),
                                  const Flexible(
                                    child: Text(
                                      'Remember my credentials',
                                      style: TextStyle(
                                        color: kTextSecondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: model.state == ViewState.idle
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          if (await model.signInAPI()!) {
                                            if (context.mounted) {
                                              Navigator.pushNamed(context,
                                                  RouteNavigation.listview);
                                            }
                                          }
                                          // }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.red,
                                          side: const BorderSide(
                                            color: Colors.yellow,
                                            width: 1,
                                          ),
                                          elevation: 4,
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: const Text('Sign In'),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
