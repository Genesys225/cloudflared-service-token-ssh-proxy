# cloudflared-service-token-ssh-proxy

to correctly encode your keys, use:
```bash
echo -n "$(cat ~/.ssh/id_rsa.pub)" | base64 -w 0
```
then copy the results to your secret/var.

run ssh command through cloudflared tunnel proxy
```yml
example:
  - name: cloudflared-service-token-ssh-proxy
      uses: Genesys225/cloudflared-service-token-ssh-proxy@V1
      with:
        HOST: ipv4/ipv6 | host address
        USER: username
        PORT: 22
        CLIENT_ID: ${{ secrets.CLIENT_ID }}
        CLIENT_SECRET: ${{ secrets.CLIENT_SECRET }}
        PUBLIC_KEY: ${{ secrets.PUBLIC_KEY }}
        PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
        KEY_TYPE: id_rsa
        REMOTE_SHELL: 'sh'
        COMMAND: |
          docker pull ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:latest
          docker-compose up -d {{ env.IMAGE_NAME }}:latest
```
