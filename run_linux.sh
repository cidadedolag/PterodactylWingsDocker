# Run docker compose
docker compose \
 -f .docker/compose-dev-linux.yaml \
 --project-directory . \
 --project-name dev-pterodactyl-wings \
 up --build
