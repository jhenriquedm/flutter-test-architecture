import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/phone_container.dart';
import 'test_runner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PhoneContainer(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dashboard QA',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Gerenciamento de testes automatizados',
                              style: TextStyle(
                                color: AppColors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        key: const Key('logout_button'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status Geral',
                          style: TextStyle(
                            color: AppColors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '124 Testes Executados',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    buttonKey: const Key('open_test_runner_button'),
                    text: 'Abrir Test Runner',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TestRunnerScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  buildInfoCard(
                    'Performance',
                    'Excelente estabilidade nos testes',
                    Icons.speed,
                  ),

                  buildInfoCard(
                    'Integração',
                    'APIs conectadas corretamente',
                    Icons.api,
                  ),

                  buildInfoCard(
                    'Cobertura',
                    '92% da aplicação validada',
                    Icons.verified,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 32,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}