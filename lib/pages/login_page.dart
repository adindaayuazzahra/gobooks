import 'package:gobooks/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.06),
              Text(
                'MASUK',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Lottie.asset(
                'assets/lottie/login.json',
                height: size.height * 0.35,
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
                  controller: emailController,
                  cursorColor: secdarkColor,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
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
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: secdarkColor,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock,
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
                    onPressed: () async {
                      final result = await AuthServices.signIn(
                          emailController.text,
                          passwordController.text
                      );
                      if (result != null && emailController.text != 'gobooks.admin@email.com') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      } else if(emailController.text == ""
                          || passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email / Password tidak boleh kosong.'),
                              duration: Duration(milliseconds: 600),
                            )
                        );
                      } else if(emailController.text == 'gobooks.admin@email.com') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email anda tidak terdaftar sebagai user.'),
                              duration: Duration(milliseconds: 600),
                            )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email / Password salah. Silakan coba lagi.'),
                              duration: Duration(milliseconds: 600),
                            )
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: secdarkColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.001),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                height: size.height * 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await AuthServices.signIn(
                          emailController.text,
                          passwordController.text
                      );
                      if (result != null && emailController.text == 'gobooks.admin@email.com') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminProfilePage(),
                          ),
                        );
                      } else if(emailController.text == ""
                          || passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email / Password tidak boleh kosong.'),
                              duration: Duration(milliseconds: 600),
                            )
                        );
                      } else if(emailController.text != 'gobooks.admin@email.com') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email anda tidak terdaftar sebagai admin.'),
                              duration: Duration(milliseconds: 600),
                            )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email / Password salah. Silakan coba lagi.'),
                              duration: Duration(milliseconds: 600),
                            )
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: accentColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                    ),
                    child: Text(
                      'Masuk sebagai admin',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.001),
              SizedBox(height: size.height * 0.001),
              DeviderOr(size: size),
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: OutlinedButton(
                    onPressed: () async {
                       final result = await AuthServices.signUpWithGoogle();
                       if (result != null) {
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                             builder: (context) => const MainPage(),
                           ),
                         );
                       }
                    },
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
                                ?.copyWith(color: Colors.black, fontSize: 13)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Belum punya Akun ? ",
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
                            return const RegisterPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Daftar",
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
