import 'package:gobooks/main.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  decoration: const InputDecoration(
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
                  controller: emailController,
                  cursorColor: secdarkColor,
                  decoration: const InputDecoration(
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
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: secdarkColor,
                  decoration: const InputDecoration(
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
                    onPressed: () async {
                      final result = await AuthServices.signUp(emailController.text, passwordController.text);
                       if (result != null) {
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                             builder: (context) => const MainPage(),
                           ),
                         );
                       }
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
                width: size.width * 0.75,
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
                        Text('Sign Up dengan Akun Google',
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
