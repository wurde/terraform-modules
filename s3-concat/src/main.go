package main

import (
	"fmt"
	"log"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
)

const bucketName = "andys-s3concat-1"
const firstObject = "data-1.csv"
const secondObject = "data-2.csv"
const targetObject = "data.csv"

func exitErrorf(msg string, args ...interface{}) {
	fmt.Fprintf(os.Stderr, msg+"\n", args...)
	os.Exit(1)
}

func main() {
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String("us-east-1")},
	)

	svc := s3.New(sess)

	// TODO Read the input S3 Object.
	reader, err := svc.GetObject(bucketName, firstObject)
	if err != nil {
		log.Fatalln(err)
	}
	defer reader.Close()

	// TODO Read the output S3 Object.
	reader, err := svc.GetObject(bucketName, secondObject)
	if err != nil {
		log.Fatalln(err)
	}
	defer reader.Close()

	// TODO concat input data to the output data.

	// TODO Write to the output S3 Object.
	n, err := svc.PutObject(bucketName, targetObject, reader, "application/octet-stream")
	if err != nil {
		log.Fatalln(err)
	}
}
