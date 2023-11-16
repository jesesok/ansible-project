# Используем официальный образ Golang в качестве базового образа
FROM golang:1.19-alpine AS builder

# Указываем порт, который будет прослушивать приложение
EXPOSE 8080
# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем все файлы из текущего каталога (где находится Dockerfile) в рабочую директорию
COPY /application .
RUN go mod init example.com/m

# Собираем приложение
RUN go build -o main .

FROM alpine AS runner
COPY --from=builder /app /
# Команда для запуска приложения при старте контейнера
CMD ["./main"]
