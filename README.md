# Flutter Test Architecture

## Sobre o Projeto

O **Flutter Test Architecture** é um projeto desenvolvido com foco em automação de testes mobile utilizando Flutter.

A aplicação simula um pequeno sistema corporativo de QA (Quality Assurance), contendo autenticação, navegação entre telas e uma dashboard de execução de testes.

Além do desenvolvimento visual da aplicação, o principal objetivo do projeto é demonstrar uma arquitetura prática de:

* Testes automatizados;
* Integração contínua (CI/CD);
* Cobertura de testes;
* GitHub Actions;
* Pipeline automatizada;
* Validação contínua de qualidade.

---

# Objetivo

Demonstrar como aplicações Flutter podem possuir:

* Fluxos automatizados de validação;
* Execução automática de testes;
* Cobertura de código;
* Integração contínua;
* Estrutura profissional de QA Automation.

O projeto foi desenvolvido como base para estudos, apresentações técnicas e demonstrações práticas de automação de testes mobile.

---

# Tecnologias Utilizadas

## Mobile

* Flutter
* Dart

## Testes

* flutter_test
* Widget Tests
* LCOV Coverage

## CI/CD

* GitHub Actions

---

# Arquitetura do Projeto

```txt
lib/
 ├── screens/
 │    ├── login_screen.dart
 │    ├── dashboard_screen.dart
 │    └── test_runner_screen.dart
 │
 ├── theme/
 │    └── app_colors.dart
 │
 └── widgets/
      ├── custom_button.dart
      ├── custom_input.dart
      └── phone_container.dart
```

---

# Fluxo da Aplicação

```txt
Login
   ↓
Dashboard
   ↓
Test Runner
   ↓
Dashboard
   ↓
Logout
   ↓
Login
```

---

# Telas do Sistema

## Login

Responsável pela autenticação do usuário.

### Funcionalidades

* Inserção de e-mail;
* Inserção de senha;
* Validação de login;
* Tratamento de erro.

---

## Dashboard QA

Tela principal da aplicação.

### Funcionalidades

* Navegação para Test Runner;
* Logout;
* Painel principal.

---

## Test Runner

Tela simulando execução de testes automatizados.

### Funcionalidades

* Cobertura de testes;
* Indicadores de status;
* Simulação de dashboard QA.

---

# Credenciais de Login

```txt
E-mail:
admin@flutter.com

Senha:
12345678
```

---

# Como Executar o Projeto

## 1. Clonar o repositório

```bash
git clone https://github.com/jhenriquedm/flutter-test-architecture.git
```

---

## 2. Entrar na pasta

```bash
cd flutter-test-architecture
```

---

## 3. Instalar dependências

```bash
flutter pub get
```

---

## 4. Executar aplicação

```bash
flutter run
```

---

# Como Executar os Testes

## Executar todos os testes

```bash
flutter test
```

---

# Logs Automatizados

Os testes foram implementados com logs personalizados.

Exemplo:

```txt
==============================
INICIANDO TESTE LOGIN VÁLIDO
==============================

✓ Tela de login carregada
✓ E-mail válido digitado
✓ Senha válida digitada
✓ Botão ENTRAR acionado
✓ Dashboard carregado com sucesso
✓ Botão de logout encontrado

==============================
TESTE FINALIZADO COM SUCESSO
==============================
```

---

# Cenários Automatizados

## 1. Renderização da Tela de Login

Valida:

* Campo de e-mail;
* Campo de senha;
* Botão login;
* Botão criar conta.

---

## 2. Login Inválido

Valida:

* Tratamento de erro;
* Permanência na tela de login.

---

## 3. Login Válido

Valida:

* Autenticação;
* Navegação para Dashboard.

---

## 4. Logout

Valida:

* Retorno para login;
* Limpeza dos campos.

---

## 5. Navegação Dashboard → Test Runner

Valida:

* Navegação entre telas;
* Carregamento de métricas;
* Retorno ao Dashboard.

---

# Cobertura de Testes

## Gerar coverage

```bash
flutter test --coverage
```

---

# Resultado Atual

## Cobertura total

```txt
96.8%
```

## Widgets

```txt
100%
```

## Screens

```txt
95.8%
```

---

# GitHub Actions

O projeto possui pipeline automatizada utilizando GitHub Actions.

## Workflow

Arquivo:

```txt
.github/workflows/flutter-tests.yml
```

---

# Pipeline Executada

A cada:

* push;
* pull request;

o GitHub executa automaticamente:

```bash
flutter pub get
flutter test --coverage
```

---

# Etapas da Pipeline

## 1. Checkout do código

```yaml
uses: actions/checkout@v4
```

## 2. Configuração do Flutter

```yaml
uses: subosito/flutter-action@v2
```

## 3. Instalação de dependências

```bash
flutter pub get
```

## 4. Execução dos testes

```bash
flutter test --coverage
```

## 5. Geração do relatório HTML

```bash
genhtml coverage/lcov.info -o coverage/html
```

## 6. Upload do relatório

```yaml
uses: actions/upload-artifact@v4
```

---

# Como Acessar o GitHub Actions

1. Abrir o repositório no GitHub;
2. Clicar na aba:

```txt
Actions
```

3. Selecionar:

```txt
Flutter Automated Tests
```

---

# Como Validar a Pipeline

## Verde

```txt
Pipeline executada com sucesso
```

## Vermelho

```txt
Pipeline com falha
```

## Amarelo

```txt
Pipeline em execução
```

---

# Relatório HTML de Coverage

Após a execução da pipeline:

1. Entrar em:

```txt
Actions
```

2. Abrir a execução mais recente;

3. Baixar o artefato:

```txt
coverage-report
```

4. Extrair o `.zip`;

5. Abrir:

```txt
index.html
```

---

# Resultado do Coverage

O relatório LCOV exibe:

* percentual de cobertura;
* linhas cobertas;
* arquivos analisados;
* métricas por diretório.

Resultado atual:

```txt
Lines: 96.8%
```

---

# Estrutura de Testes

```txt
test/
 └── widget/
      └── login_screen_test.dart
```

---

# Benefícios da Arquitetura

* Automação de testes;
* Redução de bugs;
* Qualidade contínua;
* Pipeline automatizada;
* Cobertura de código;
* Validação automática;
* Estrutura escalável.

---

# Melhorias Futuras

* Clean Architecture;
* Mock API;
* Repository Pattern;
* Golden Tests;
* Firebase Test Lab;
* SonarCloud;
* Testes de integração;
* Testes E2E.

---

# Autor

José Henrique Dias Moreira

---

# Projeto Acadêmico / Demonstrativo

Projeto desenvolvido para fins de estudo, demonstração prática de QA Automation e automação de testes mobile utilizando Flutter.
