import 'package:gobooks/main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: bgColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.09),
            Text(
              'HALO!',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: accentColor, fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 2),
                Text(
                  ' GOBOOKS ',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: accentColor,
                        backgroundColor: secLightColor,
                      ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Lottie.asset(
              'assets/lottie/books-welcome.json',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.04),
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
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: secLightColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
                  child: Text(
                    'Masuk',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
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
                          return const RegisterPage();
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
                  child: Text('Daftar',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
