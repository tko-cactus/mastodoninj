build:
	JAVA_CONTAINER_BUILD_TARGET=builder
	mutagen-compose build && mutagen-compose up -d
up:
	JAVA_CONTAINER_BUILD_TARGET=runner
	mutagen-compose build && mutagen-compose up -d
down:
	mutagen-compose down