

This sets up and runs a NextCloud service.
Thanks to confusing Docker permissions and general fed-up experimentation, there is a prepare-first-run.sh script to help.

- First run `prepare-first-run.sh` to create the data directory
- Secondly, run `docker-compose up -d` for the first time.

Once prepared, normal operation with docker-composer can be resumed.

The default data directory in docker-compose.yml and the prepare script is ./opt/cloud_data, relative to this directory.

Use at your own risk.
Marlon
