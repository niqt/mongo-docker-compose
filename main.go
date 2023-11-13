package main

import (
	"fmt"
	"github.com/rs/zerolog/log"
)

func main() {
	fmt.Printf("*** Server starting ***\n")
	router := mux.NewRouter()
	router.HandleFunc("/api/v1/books", GetEndpoint).Methods("GET")

	log.Fatal(http.ListenAndServe(":8080", router))
}
