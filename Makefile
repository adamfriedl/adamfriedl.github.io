.PHONY: run stop

# Run a local web server using Docker
run:
	@echo "Starting local web server on http://localhost:8080"
	@docker run --rm -d \
		--name adamfriedl-site \
		-p 8080:80 \
		-v $(PWD):/usr/share/nginx/html:ro \
		nginx:alpine
	@echo "Server running. Press Ctrl+C to stop (or run 'make stop')"
	@docker logs -f adamfriedl-site

# Stop the running container
stop:
	@echo "Stopping web server..."
	@docker stop adamfriedl-site 2>/dev/null || echo "Server not running"
