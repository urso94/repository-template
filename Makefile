help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2} '

install: ## Installa il progetto
	cp -n .env.example .env || true
	cp -n backend/.env.example backend/.env || true
	docker compose run --rm -u dev fpm composer install
	docker compose run --rm -u dev fpm php artisan migrate --seed
	docker compose run --rm -u 1000:1000 node npm i
