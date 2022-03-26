.PHONY: build
build:
		flutter build web --web-renderer auto --release

.PHONY: run
run:
		flutter run -d chrome --web-hostname 127.0.0.1 --web-port 8080 --web-renderer html