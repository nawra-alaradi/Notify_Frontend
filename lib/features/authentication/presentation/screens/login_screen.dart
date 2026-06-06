import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/core/widgets/skeleton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Skeleton(
      childWidget: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: .center,
              children: [
                Image.asset(
                  'assets/images/${Theme.of(context).brightness == Brightness.dark ? 'icon-dark.png' : 'icon-light.png'}',
                  width: 100.w,
                  height: 95.h,
                ),
                Text(
                  "Notify",
                  textAlign: .center,
                  style: textTheme.headlineMedium,
                ),
                // SizedBox(height: 10.h),
                // Text(
                //   "Welcome back",
                //   textAlign: .center,
                //   style: textTheme.titleLarge,
                // ),
                SizedBox(height: 10.h),

                Text(
                  "Sign in to access your intelligent notes",
                  textAlign: .center,
                  style: textTheme.labelLarge,
                ),
                SizedBox(height: 20.h),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? Colors.black
                        : const Color(0xFFF9007D),
                    alignment:
                        Alignment.centerLeft, // aligns icon+text consistently
                  ),
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.google, size: 24.w),
                  label: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue with Google",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? Colors.black
                        : const Color(0xFFF9007D),
                    alignment:
                        Alignment.centerLeft, // aligns icon+text consistently
                  ),
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.facebook, size: 24.w),
                  label: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue with Facebook",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),

                Text("OR", textAlign: .center, style: textTheme.labelLarge),
                SizedBox(height: 15.h),
                TextFormField(
                  keyboardType: .text,

                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'name@example.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 60.h),

                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(),
    );
  }
}
