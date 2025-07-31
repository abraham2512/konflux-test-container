package main

import (
	"log"
	"net/http"

	"konflux-test-container/internal/server"
)

func main() {
	http.HandleFunc("/", server.Handler)
	log.Println("Starting server on :8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
