package main

import (
	"fmt"
	"log"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
)

var s3BucketName = os.Getenv("S3_BUCKET_NAME")
var s3OutputPrefix = os.Getenv("S3_OUTPUT_PREFIX")

// func handleRequest(ctx context.Context) {
func handleRequest() {
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String("us-east-1")},
	)

	svc := s3.New(sess)

	// Read the input S3 Object.
	inputContent, err := svc.GetObject(&s3.GetObjectInput{
		Bucket: aws.String(s3BucketName),
		Key:    aws.String("data-1.csv"),
	})
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Println(inputContent.Body)

	// Read the output S3 Object.
	mainContent, err := svc.GetObject(&s3.GetObjectInput{
		Bucket: aws.String(s3BucketName),
		Key:    aws.String(s3OutputPrefix),
	})
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Println(mainContent.Body)

	// // Concat input data to the output data.
	// lines := strings.Split(string(inputContent), "\n")
	// var newContent string
	// if len(lines) > 1 {
	// 	newContent = strings.Join(lines[1:], "\n")
	// } else {
	// 	newContent = strings.Join(lines, "\n")
	// }
	// data := append(mainContent, newContent...)
	// data = append(data, []byte("\n")...)

	// // Write to the output S3 Object.
	// n, err := svc.PutObject(&s3.PutObjectInput{
	// 	Bucket: aws.String(bucketName),
	// 	Key:    aws.String(s3OutputPrefix),
	// 	Body:   data,
	// })
	// if err != nil {
	// 	log.Fatalln(err)
	// }
}

func main() {
	// lambda.Start(handleRequest)
	handleRequest()
}
