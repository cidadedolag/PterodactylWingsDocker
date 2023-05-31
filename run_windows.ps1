# Build a docker image
docker build -t dev-pterodactyl-wings .

# Create a docker volume if not exists
docker volume create --name=mindwired-node1-pterodactyl-lib
docker volume create --name=mindwired-node1-pterodactyl-tmp
docker volume create --name=mindwired-node1-pterodactyl-ssl
docker volume create --name=mindwired-node1-docker-lib

# Set environment variables
Get-Content .env\windows.env | ForEach-Object {
    $name, $value = $_.split('=')
    if ([string]::IsNullOrWhiteSpace($name) -or $name.Contains('#')) {
        continue
    }
    Set-Content env:\$name $value
}

# Run docker compose
docker compose `
 -f .docker/compose-dev-windows.yaml `
 --project-directory . `
 --project-name dev-pterodactyl-wings `
 up --build
