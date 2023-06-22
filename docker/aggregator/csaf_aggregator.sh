#!/bin/bash

INTERIM=0

LOG_FOLDER=$(pwd)/log/
LOG_FILE_AGGREGATOR=aggregator.log
LOG_FILE_INTERIM=interim.log

DATA_FOLDER=$(pwd)/data/

CONFIG_FILE=$(pwd)/config/aggregator.toml

#!/bin/bash

usage() { echo "Usage: $0 [-c | Path to config toml] [-d | Folder for data files] [-i | Run in interim mode]" 1>&2; exit 1; }

while getopts ":c::d::i" o; do
    case "${o}" in
        d)
            DATA_FOLDER=${OPTARG}
            ;;
        c)
            CONFIG_FILE=${OPTARG}
            ;;
        i)
            INTERIM=1
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ ! -f "$CONFIG_FILE" ]; then
    echo "$CONFIG_FILE does not exist."
    exit 1
fi

if [ ! -d "$DATA_FOLDER" ]; then
    echo "$DATA_FOLDER does not exists."
    exit 1
fi

[ ! -d $DATAFOLDER/log ] || mkdir "$DATA_FOLDER/log"
[ ! -d $DATAFOLDER/html ] || mkdir "$DATA_FOLDER/html"
[ ! -d $DATAFOLDER/archive ] || mkdir "$DATA_FOLDER/archive"

docker run --rm --env INTERIM="$INTERIM" --env DELAY="1" -v $(realpath $CONFIG_FILE):/config/csaf/aggregator.toml -v $(realpath $DATA_FOLDER):/data/ csaf_aggregator:latest
