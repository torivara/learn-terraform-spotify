export SPOTIFY_CLIENT_REDIRECT_URI=http://localhost:27228/spotify_callback
docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy