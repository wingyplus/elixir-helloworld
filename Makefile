IMAGE_NAME = "elixir-helloworld"

docker:
	docker build -t $(IMAGE_NAME) .

docker-run:
	docker run -d -p 4001:4001 --name $(IMAGE_NAME) $(IMAGE_NAME)

docker-stop:
	docker rm -f $(IMAGE_NAME)

docker-log:
	docker logs -f $(IMAGE_NAME)
