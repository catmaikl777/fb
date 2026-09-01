# Используем официальный образ Nakama
FROM heroiclabs/nakama:latest

# Устанавливаем переменные окружения для консоли администратора
# (их также можно будет переопределить в настройках Render)
ENV CONSOLE_USERNAME=admin
ENV CONSOLE_PASSWORD=Kotlovemilk_8

# Команда, которая запустится при старте контейнера
# Выполнит миграцию, а затем запустит сам сервер
CMD /nakama/nakama migrate up --database.address "$DATABASE_URL" && /nakama/nakama --database.address "$DATABASE_URL" --console.username "$CONSOLE_USERNAME" --console.password "$CONSOLE_PASSWORD"
