

This sets up and runs a NextCloud service.
Thanks to confusing Docker permissions and general fed-up experimentation, there is a `prepare-first-run.sh` script to help.

- First run `prepare-first-run.sh` to create the data directory
- Secondly, run `docker-compose up -d` for the first time.

Once prepared, normal operation with docker-composer can be resumed.

The default data directory in docker-compose.yml and the prepare script is `./opt/cloud_data,` relative to this directory.

Personally, our setup is:
- VPS with sufficient processing and memory to run these containers
- locally mounted scalable storage volumes (ie: digital ocean volumes) mounted to /opt/xyz
- SSL/HTTPS certificates handles by the LetsEncrypt container for a specific domains
- Domain added to Trusted Domains
- Prepare script ran with /opt/xyz in mind
- Docker Compose ran with /opt/xyz and relevant passwords and directory locations in place
- Nightly (or more often) rsync backups of /opt/xyz for protection of cloud storage data
- Happiness

Large Uploads Hanging? (uncaught HTTP 413 causes this)

If you notice that uploads larger than 1M is not working, then assume that the proxy client max body size is set to the default 1M. This can be remedied by modifying `/etc/nginx/nginx.conf` in the proxy container:
- docker exec -it nextcloud-proxy bash
- vi /etc/nginx/nginx.conf
- add `client_max_body_size 0;` inside the http {}
- exit the container, and restart it `docker restart nextcloud-proxy`

Thanks to Hannes van der Westhuyzen for his DevOps magic and Docker knowledge from the warfront.

22/11/2018: Added namshi's smtp container. Set up your nextcloud to send mail through server address `mailerthing` on port 25

Use at your own risk.
Marlon
