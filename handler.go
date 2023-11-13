package main

import (
	"encoding/json"
	"net/http"
)

func GetEndpoint(w http.ResponseWriter, req *http.Request) {

	json.NewEncoder(w).Encode("Hello, world!")
}
