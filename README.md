# Deep Auth – Teste Prático

Implementação do teste prático de autenticação solicitado pela **Deep**.

## Stack

- Laravel 12
- PHP 8.2+
- MySQL 8
- Docker / Docker Compose
- Laravel Breeze (Blade + Vite)

## Funcionalidades

- Cadastro de usuário com:
  - Nome, e-mail, senha e confirmação de senha
  - Validação de e-mail único
  - Senha com regras recomendadas do Laravel (`Rules\Password::defaults()`)
- Login e logout com redirecionamento para dashboard
- Dashboard protegido por middleware `auth`
- Edição de perfil:
  - Atualização de nome e e-mail via `FormRequest`
  - Validação de e-mail único ignorando o próprio usuário
  - Atualização de senha opcional (apenas se preenchida e validada)
- Diferenciais:
  - Rotas sensíveis protegidas por middleware
  - Componentes Blade para layout (`x-app-layout`, `x-guest-layout`, etc.)
  - Upload de foto de perfil com armazenamento em `storage/app/public`
  - Pequenas interações em JavaScript (feedback de atualização)
  - Testes de feature básicos (registro, login, atualização de perfil)

## Como rodar

### 1. Pré-requisitos

- Docker e Docker Compose instalados
- Node.js + npm instalados (para build dos assets com Vite)
- PHP e Composer instalados (para rodar comandos locais, se necessário)

### 2. Setup

```bash
cp .env.example .env
# ajustar variáveis de banco:
# DB_HOST=db
# DB_DATABASE=deep
# DB_USERNAME=deep
# DB_PASSWORD=deep

composer install

npm install
npm run build

php artisan key:generate

docker compose up -d
docker compose exec app php artisan migrate
docker compose exec app php artisan storage:link
