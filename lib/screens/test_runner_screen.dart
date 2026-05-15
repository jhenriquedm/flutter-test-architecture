import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/phone_container.dart';

class TestRunnerScreen extends StatelessWidget {
  const TestRunnerScreen({super.key});

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
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Test Runner',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Execução automatizada',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        key: const Key('back_home_button'),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'Cobertura Geral',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const LinearProgressIndicator(
                      value: 0.92,
                      minHeight: 14,
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    '92% dos testes executados com sucesso',
                    style: TextStyle(
                      color: AppColors.white70,
                    ),
                  ),

                  const SizedBox(height: 35),

                  buildTestCard(
                    'Login Test',
                    'SUCCESS',
                    Icons.check_circle,
                    Colors.green,
                  ),

                  buildTestCard(
                    'Logout Test',
                    'SUCCESS',
                    Icons.check_circle,
                    Colors.green,
                  ),

                  buildTestCard(
                    'Navigation Test',
                    'RUNNING',
                    Icons.autorenew,
                    Colors.orange,
                  ),

                  buildTestCard(
                    'API Integration Test',
                    'FAILED',
                    Icons.cancel,
                    Colors.redAccent,
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

  Widget buildTestCard(
    String title,
    String status,
    IconData icon,
    Color color,
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
            color: color,
            size: 32,
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  status,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
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