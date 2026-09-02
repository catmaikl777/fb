FROM heroiclabs/nakama:latest

# Проверяем, что переменная DATABASE_URL передана, и выводим её значение
CMD if [ -z "$DATABASE_URL" ]; then \
        echo "❌ DATABASE_URL не задана!"; \
        exit 1; \
    else \
        echo "✅ DATABASE_URL: $DATABASE_URL"; \
        /nakama/nakama migrate up --database.address "$DATABASE_URL" && \
        /nakama/nakama --database.address "$DATABASE_URL" --console.username "$CONSOLE_USERNAME" --console.password "$CONSOLE_PASSWORD"; \
    fi
