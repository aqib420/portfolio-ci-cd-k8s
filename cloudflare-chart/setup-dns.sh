#!/bin/bash

TUNNEL_ID=$(yq e '.cloudflare.tunnelId' values.yaml)
BASE_DOMAIN=$(yq e '.baseDomain' values.yaml)

echo "Setting up DNS entries for tunnel: ${TUNNEL_ID}"
echo "Base domain: ${BASE_DOMAIN}"

students=$(yq e '.students[].id' values.yaml)

for student in ${students}; do
    echo "Creating DNS entry for ${student}-dev-web-svc.${BASE_DOMAIN}"
    cloudflared tunnel route dns ${TUNNEL_ID} "${student}-dev-web-svc.${BASE_DOMAIN}"
    
    echo "Creating DNS entry for ${student}-prod-web-svc.${BASE_DOMAIN}"
    cloudflared tunnel route dns ${TUNNEL_ID} "${student}-prod-web-svc.${BASE_DOMAIN}"
done

echo "DNS setup complete!"
