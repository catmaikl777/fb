FROM heroiclabs/nakama:latest

CMD /nakama/nakama migrate up --database.address "$DATABASE_URL" && /nakama/nakama --database.address "$DATABASE_URL" --console.username "$CONSOLE_USERNAME" --console.password "$CONSOLE_PASSWORD"
