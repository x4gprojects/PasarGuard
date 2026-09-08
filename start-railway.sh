#!/usr/bin/env bash
set -e

# ریلوی پورت رو توی $PORT میده، پاسارگارد اسم UVICORN_PORT رو می‌خواد
export UVICORN_HOST="0.0.0.0"
export UVICORN_PORT="${PORT:-8000}"

# اگه دیتابیس خارجی ست نشده بود، sqlite پیش‌فرض
export SQLALCHEMY_DATABASE_URL="${SQLALCHEMY_DATABASE_URL:-sqlite+aiosqlite:///db.sqlite3}"
export ROLE="${ROLE:-all-in-one}"

# ریلوی پشت یه پروکسی HTTPS قرار داره، این تنظیمات کمک می‌کنه هدرهای
# X-Forwarded-* درست تشخیص داده بشن (مثلاً تشخیص https)
export UVICORN_PROXY_HEADERS="${UVICORN_PROXY_HEADERS:-true}"
export UVICORN_FORWARDED_ALLOW_IPS="${UVICORN_FORWARDED_ALLOW_IPS:-*}"

echo "Starting PasarGuard panel on port ${UVICORN_PORT}..."
exec /code/start.sh
