# docker-postgres
[![Build Sta[![Build Status](https://travis-ci.org/joaosoft/docker-postgres.svg?branch=master)](https://travis-ci.org/joaosoft/docker-postgres) | [![codecov](https://codecov.io/gh/joaosoft/docker-postgres/branch/master/graph/badge.svg)](https://codecov.io/gh/joaosoft/docker-postgres) | [![Go Report Card](https://goreportcard.com/badge/github.com/joaosoft/docker-postgres)](https://goreportcard.com/report/github.com/joaosoft/docker-postgres) | [![GoDoc](https://godoc.org/github.com/joaosoft/docker-postgres?status.svg)](https://godoc.org/github.com/joaosoft/docker-postgres)
tus](https://travis-ci.org/joaosoft/docker-postgres.svg?branch=master)](https://travis-ci.org/joaosoft/docker-postgres) | [![codecov](https://codecov.io/gh/joaosoft/docker-postgres/branch/master/graph/badge.svg)](https://codecov.io/gh/joaosoft/docker-postgres) | [![Go Report Card](https://goreportcard.com/badge/github.com/joaosoft/docker-postgres)](https://goreportcard.com/report/github.com/joaosoft/docker-postgres) | [![GoDoc](https://godoc.org/github.com/joaosoft/docker-postgres?status.svg)](https://godoc.org/github.com/joaosoft/docker-postgres)

A simple docker-postgres with master/slave configuration.

###### If i miss something or you have something interesting, please be part of this project. Let me know! My contact is at the end.

## Usage 
This examples are available in the project at [docker-postgres/examples](https://github.com/joaosoft/docker-postgres/tree/master/examples)
```go
import "github.com/joaosoft/docker-postgres"

docker-postgres := docker-postgres.Newdocker-postgres()

//get user information
log.Info("get user information")
if user, err := docker-postgres.User().Get(); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nUSER: %+v \n\n", user)
}

// upload a file
log.Info("upload a file")
if response, err := docker-postgres.File().Upload("/teste.txt", []byte("teste")); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nUPLOADED: %+v \n\n", response)
}

// download the uploaded file
log.Info("download the uploaded file")
if response, err := docker-postgres.File().Download("/teste.txt"); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nDOWNLOADED: %s \n\n", string(response))
}

// create folder
log.Info("listing folder")
if response, err := docker-postgres.Folder().Create("/bananas"); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nCREATED FOLDER: %+v \n\n", response)
}

// listing folder
log.Info("listing folder")
if response, err := docker-postgres.Folder().List("/"); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nLIST FOLDER: %+v \n\n", response)
}

// deleting the uploaded file
log.Info("deleting the uploaded file")
if response, err := docker-postgres.File().Delete("/teste.txt"); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nDELETED FILE: %+v \n\n", response)
}

// deleting the created folder
log.Info("deleting the created folder")
if response, err := docker-postgres.Folder().DeleteFolder("/bananas"); err != nil {
    log.Error(err.Error())
} else {
    fmt.Printf("\n\nDELETED FOLDER: %+v \n\n", response)
}
```

## Known issues

## Follow me at
Facebook: https://www.facebook.com/joaosoft

LinkedIn: https://www.linkedin.com/in/jo%C3%A3o-ribeiro-b2775438/

##### If you have something to add, please let me know joaosoft@gmail.com
