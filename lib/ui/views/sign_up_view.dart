import 'package:exam_2/core/enums/view_state.dart';
import 'package:exam_2/core/view_models/sign_up_view_model.dart';
import 'package:exam_2/ui/route_navigation.dart';
import 'package:exam_2/ui/shared/ui_helpers.dart';
import 'package:exam_2/ui/views/base_view.dart';
import 'package:exam_2/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

bool obscureText = true;

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        onModelReady: (model) async {},
        builder: (context, model, child) => Scaffold(
              // resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.green,
                centerTitle: true,
                title: const Text('Sign Up '),
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
                                        'Name',
                                        // "Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // labelText: 'Name',
                                  alignLabelWithHint: true,
                                  hintText: 'Please Enter Your Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  // prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white10,
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
                                      color: Colors.red,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.indigoAccent,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: model.nameController,
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
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
                                  // labelText: 'Name',
                                  alignLabelWithHint: true,
                                  hintText: 'Please Enter Your User Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  // prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white10,
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
                                      color: Colors.red,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.indigoAccent,
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
                                noBottomPadding: true,
                                trialWidget: Icon(
                                  model.isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                trialIconOnTap: () {
                                  model.changeIsPasswordVisible();
                                },
                                controller: model.passwordController,
                                formValidator: (input) =>
                                    model.passwordValidator(input!),
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: const Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Text(
                                        'Mobile Number',
                                        // "Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // labelText: 'Name',
                                  alignLabelWithHint: true,
                                  hintText: 'Please Enter Your Mobile Number',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  // prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white10,
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
                                      color: Colors.red,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.indigoAccent,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: model.mobile_numberController,
                                validator: (value) =>
                                    model.mobileNumberValidator(value!),
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: const Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Text(
                                        'Email',
                                        // "Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // labelText: 'Name',
                                  alignLabelWithHint: true,
                                  hintText: 'Please Enter Your Email',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  // prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white10,
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
                                      color: Colors.red,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.indigoAccent,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: model.emailController,
                                // validator: (value) =>
                                // model.mobileNumberValidator(value!),
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: const Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Text(
                                        'Address',
                                        // "Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // labelText: 'Name',
                                  alignLabelWithHint: true,
                                  hintText: 'Please Enter Your Address',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  // prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Colors.blueAccent,
                                  filled: true,
                                  fillColor: Colors.white10,
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
                                      color: Colors.red,
                                      width: 4.5,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.indigoAccent,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: model.addressController,
                              ),
                              SizedBox(
                                height: UIHelper.extraBigSpacing(context),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: model.state == ViewState.idle
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          if (model.formKey.currentState!
                                              .validate()) {
                                            if (await model.signUpAPI()!) {
                                              if (context.mounted) {
                                                Navigator.pushNamed(context,
                                                    RouteNavigation.signIn);
                                              }
                                            }
                                          }
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
                                        child: const Text('Sign Up'),
                                      )
                                    : const CircularProgressIndicator(),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
