FROM heroiclabs/nakama:latest

# Проверяем, что переменная DATABASE_URL передана, и выводим её значение
CMD if [ -z "$NAKAMA_DATABASE_DSN" ]; then \
        echo "❌ DATABASE_URL не задана!"; \
        exit 1; \
    else \
        echo "✅ DATABASE_URL: $NAKAMA_DATABASE_DSN"; \
        /nakama/nakama migrate up --database.address "$NAKAMA_DATABASE_DSN" && \
        /nakama/nakama --database.address "$NAKAMA_DATABASE_DSN" --console.username "$CONSOLE_USERNAME" --console.password "$CONSOLE_PASSWORD"; \
    fi
