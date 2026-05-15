import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_architecture/screens/login_screen.dart';

void main() {
  testWidgets(
    'Deve renderizar a tela de login corretamente',
    (WidgetTester tester) async {
      print('\n==============================');
      print('INICIANDO TESTE LOGIN SCREEN');
      print('==============================\n');

      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(find.byKey(const Key('email_input')), findsOneWidget);
      print('✓ Campo de e-mail encontrado');

      expect(find.byKey(const Key('password_input')), findsOneWidget);
      print('✓ Campo de senha encontrado');

      expect(find.byKey(const Key('login_button')), findsOneWidget);
      print('✓ Botão login encontrado');

      expect(find.byKey(const Key('create_account_button')), findsOneWidget);
      print('✓ Botão criar conta encontrado');

      print('\n==============================');
      print('TESTE FINALIZADO COM SUCESSO');
      print('==============================\n');
    },
  );

  testWidgets(
    'Deve exibir mensagem de erro ao informar email inválido',
    (WidgetTester tester) async {
      print('\n==============================');
      print('INICIANDO TESTE LOGIN INVÁLIDO');
      print('==============================\n');

      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      print('✓ Tela de login carregada');

      await tester.enterText(
        find.byKey(const Key('email_input')),
        'emailinvalido',
      );

      print('✓ E-mail inválido digitado');

      await tester.enterText(
        find.byKey(const Key('password_input')),
        '12345678',
      );

      print('✓ Senha digitada');

      await tester.tap(
        find.byKey(const Key('login_button')),
      );

      print('✓ Botão ENTRAR acionado');

      await tester.pump();

      expect(
        find.text('Digite um e-mail válido'),
        findsOneWidget,
      );

      print('✓ Mensagem de erro encontrada');

      expect(
        find.text('Dashboard QA'),
        findsNothing,
      );

      print('✓ Usuário permaneceu na tela de login');

      print('\n==============================');
      print('TESTE FINALIZADO COM SUCESSO');
      print('==============================\n');
    },
  );

  testWidgets(
    'Deve realizar login válido e navegar para o Dashboard',
    (WidgetTester tester) async {
      print('\n==============================');
      print('INICIANDO TESTE LOGIN VÁLIDO');
      print('==============================\n');

      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      print('✓ Tela de login carregada');

      await tester.enterText(
        find.byKey(const Key('email_input')),
        'admin@flutter.com',
      );

      print('✓ E-mail válido digitado');

      await tester.enterText(
        find.byKey(const Key('password_input')),
        '12345678',
      );

      print('✓ Senha válida digitada');

      await tester.tap(
        find.byKey(const Key('login_button')),
      );

      print('✓ Botão ENTRAR acionado');

      await tester.pumpAndSettle();

      expect(
        find.text('Dashboard QA'),
        findsOneWidget,
      );

      print('✓ Dashboard carregado com sucesso');

      expect(
        find.byKey(const Key('logout_button')),
        findsOneWidget,
      );

      print('✓ Botão de logout encontrado');

      print('\n==============================');
      print('TESTE FINALIZADO COM SUCESSO');
      print('==============================\n');
    },
  );

  testWidgets(
    'Deve realizar logout e retornar para login com campos limpos',
    (WidgetTester tester) async {
      print('\n==============================');
      print('INICIANDO TESTE DE LOGOUT');
      print('==============================\n');

      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      print('✓ Tela de login carregada');

      await tester.enterText(
        find.byKey(const Key('email_input')),
        'admin@flutter.com',
      );

      print('✓ E-mail válido digitado');

      await tester.enterText(
        find.byKey(const Key('password_input')),
        '12345678',
      );

      print('✓ Senha válida digitada');

      await tester.tap(
        find.byKey(const Key('login_button')),
      );

      print('✓ Login acionado');

      await tester.pumpAndSettle();

      expect(
        find.text('Dashboard QA'),
        findsOneWidget,
      );

      print('✓ Dashboard carregado');

      await tester.tap(
        find.byKey(const Key('logout_button')),
      );

      print('✓ Logout acionado');

      await tester.pumpAndSettle();

      expect(
        find.text('Flutter Test Architecture'),
        findsOneWidget,
      );

      print('✓ Retornou para tela de login');

      expect(
        find.text('admin@flutter.com'),
        findsNothing,
      );

      expect(
        find.text('12345678'),
        findsNothing,
      );

      print('✓ Campos de login foram limpos');

      print('\n==============================');
      print('TESTE FINALIZADO COM SUCESSO');
      print('==============================\n');
    },
  );

  testWidgets(
    'Deve navegar do Dashboard para o Test Runner e retornar',
    (WidgetTester tester) async {
      print('\n==============================');
      print('INICIANDO TESTE DE NAVEGAÇÃO TEST RUNNER');
      print('==============================\n');

      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      print('✓ Tela de login carregada');

      await tester.enterText(
        find.byKey(const Key('email_input')),
        'admin@flutter.com',
      );

      print('✓ E-mail válido digitado');

      await tester.enterText(
        find.byKey(const Key('password_input')),
        '12345678',
      );

      print('✓ Senha válida digitada');

      await tester.tap(
        find.byKey(const Key('login_button')),
      );

      print('✓ Login acionado');

      await tester.pumpAndSettle();

      expect(
        find.text('Dashboard QA'),
        findsOneWidget,
      );

      print('✓ Dashboard carregado');

      await tester.tap(
        find.byKey(const Key('open_test_runner_button')),
      );

      print('✓ Navegação para Test Runner acionada');

      await tester.pumpAndSettle();

      expect(
        find.text('Test Runner'),
        findsOneWidget,
      );

      print('✓ Tela Test Runner carregada');

      expect(
        find.text('Cobertura Geral'),
        findsOneWidget,
      );

      print('✓ Informações de cobertura encontradas');

      await tester.ensureVisible(
        find.byKey(const Key('back_home_button')),
      );

      await tester.tap(
        find.byKey(const Key('back_home_button')),
        warnIfMissed: false,
      );

      print('✓ Botão voltar acionado');

      await tester.pumpAndSettle();

      expect(
        find.text('Dashboard QA'),
        findsOneWidget,
      );

      print('✓ Retornou para o Dashboard');

      print('\n==============================');
      print('TESTE FINALIZADO COM SUCESSO');
      print('==============================\n');
    },
  );
}