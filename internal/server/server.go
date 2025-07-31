package server

import (
	"fmt"
	"math/rand"
	"net/http"
	"time"
)

func randomMessage() string {
	messages := []string{
		"Have you tried turning it off and on again?",
		"It's not a bug, it's a feature.",
		"Works on my machine.",
		"There are 10 types of people in the world: those who understand binary, and those who don't.",
		"The best thing about a boolean is even if you are wrong, you are only off by a bit.",
	}
	rand.Seed(time.Now().UnixNano())
	return messages[rand.Intn(len(messages))]
}

func Handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Konflux says: %s", randomMessage())
}
