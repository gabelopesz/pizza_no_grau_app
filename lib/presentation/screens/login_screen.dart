import 'package:flutter/material.dart';
import '../themes/my_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true; // Controla se a senha está oculta

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MyColors.background, // Usando a cor de fundo definida no MyColors
      appBar: AppBar(
        title: Text('Entrar', style: TextStyle(color: MyColors.grayText)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0), // Margem das laterais
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título
              Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: MyColors.grayText, // Cor do título
                ),
              ),
              SizedBox(
                  height:
                      30), // Menor distância do título para os campos de entrada

              // Campo de E-mail
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'user@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Bordas arredondadas
                  ),
                  prefixIcon: Icon(Icons.email, color: MyColors.grayText),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),

              // Campo de Senha
              TextField(
                controller: passwordController,
                obscureText: _obscureText, // Controle da visibilidade da senha
                decoration: InputDecoration(
                  labelText: 'Senha',
                  hintText: '**********',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Bordas arredondadas
                  ),
                  prefixIcon: Icon(Icons.lock, color: MyColors.grayText),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility, // Ícone muda conforme o estado
                      color: MyColors.grayText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Alterna o estado de visibilidade da senha
                      });
                    },
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
              SizedBox(height: 8),

              // Esqueci a senha
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: MyColors.redPrimary),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Botão Entrar
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.redPrimary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'ENTRAR',
                  style: TextStyle(
                    color: MyColors.background,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Texto "Não tem conta?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Não tem conta?'),
                  TextButton(
                    onPressed: () {
                      // Navegação para a tela de cadastro
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: MyColors.redPrimary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Redes sociais com ícones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.google),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
