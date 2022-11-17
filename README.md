# cloudflared-service-token-ssh-proxy
run ssh command through cloudflared tunnel proxy
```yml
example:
  - name: cloudflared-service-token-ssh-proxy
      uses: Genesys225/cloudflared-service-token-ssh-proxy@V1
      with:
        HOST: ipv4/ipv6 | host address
        USER: usename
        CLIENT_ID: ${{ secrets.CLIENT_ID }}
        CLIENT_SECRET: ${{ secrets.CLIENT_SECRET }}
        PUBLIC_KEY: ${{ secrets.PUBLIC_KEY }}
        PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
        COMMAND: |
          docker pull ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:latest
          docker-compose up -d {{ env.IMAGE_NAME }}:latest
```
