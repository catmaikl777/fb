FROM heroiclabs/nakama:latest

# Аргумент для DATABASE_URL (передаётся из Render)
ARG DATABASE_URL

# Устанавливаем переменную окружения
ENV DATABASE_URL=$DATABASE_URL

ENV CONSOLE_USERNAME=admin
ENV CONSOLE_PASSWORD=Kotlovemilk_8

# Запуск
CMD /nakama/nakama migrate up --database.address "$DATABASE_URL" && /nakama/nakama --database.address "$DATABASE_URL" --console.username "$CONSOLE_USERNAME" --console.password "$CONSOLE_PASSWORD"
