package main

import (
	"fmt"
	"net/http"
)

func main() {
	// Обработчик для HTTP-метода GET
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!")
	})

	// Запуск веб-сервера на порту 8080
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println("Error:", err)
	}
}
