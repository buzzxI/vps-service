# VPS Service - Flexible Docker Setup

A flexible Docker Compose setup for running nginx, xray, and hysteria2 

i have tried to extract service acme to implement auto issue ssl certification and renew the certification, but i give up

> the service is not that easy to write, i have to make sure it runs after system boots so that the renew job works and i need to avoid the service to request for duplicate certifications
> however i have to install the certification after it has been renewed by acme
> i have searched approaches to deploy amce in docker, while most of them told me to deploy the service and request for certifications by 'docker exec'
> i mean, if i have used docker compose, but i still have to type the commands to get job done, maybe just install acme on host machine is fine -> linux cron make sure renew job can be done

lets get back to this script, before your deployment, you should install the ssl certifications under `/etc/ssl/certs/{your-domain}`

> the path can be changed, but you need to change docker-compose file

and you should export your domain to default shell: bash, zsh ... just add ~~one~~ two line: `export DOMAIN={your-domain}` and `export REALITY_DOMAIN={your-reality-domain}`to your shell .xxrc, and make it happen

the docker compose deploy three entries:

* hysteria2: udp, fast but not always available (it should be related to your ISP, fuck you xx Mobile)
* vless + websocket + cloudflare: tcp, high availablity but slow, use cloudflare CDN to build the tunnel (remember to let cloudflare to manage your domain)
* vless + reality: next generation proxy, maybe better

file `.env` contains a reality domain, this domain is necessory for `vless + reality` proxy, you can leave it alone, if hysteria2 and websocket is just fine

by default vps serve as a openlist server (or a static webpage)

