# Docker container for CSAF-Tools

Repository contains scripts and files to create docker container for CSAF-Tools.

`build_all.sh` will create images for all tools.
`remove_all.sh` will delete all casf-tools docker images 

`provider_template` contains an docker compose file and all needed config files to run the provider. You need to add private and public pgp-key in the `config` folder. Filenames can be found in `config.toml`.