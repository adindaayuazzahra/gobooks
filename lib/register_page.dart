import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobooks/main_page.dart';
import 'package:gobooks/login_page.dart';
import 'package:gobooks/styles.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Text(
                'REGISTER',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Lottie.asset(
                'assets/lottie/register.json',
                height: size.height * 0.30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: secLightColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  cursorColor: secdarkColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: secdarkColor,
                    ),
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: secLightColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  cursorColor: secdarkColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      color: secdarkColor,
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: secLightColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  obscureText: true,
                  cursorColor: secdarkColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: secdarkColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: secdarkColor,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                height: size.height * 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Mainpage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: secdarkColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                    ),
                    child: Text('Register',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.001),
              DeviderOr(size: size),
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/image/google.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        Text('Lanjut dengan Akun Google',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sudah punya Akun ? ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeviderOr extends StatelessWidget {
  const DeviderOr({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: Theme.of(context).textTheme.button?.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
