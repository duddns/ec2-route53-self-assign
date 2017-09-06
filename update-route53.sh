#!/bin/sh

### BEGIN INIT INFO
# Provides:      update-route53
# Required-Start:    $local_fs $remote_fs $network $syslog $named
# Required-Stop:     $local_fs $remote_fs $network $syslog $named
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the update-route53
# Description:       starts update-route53 using start-stop-daemon
### END INIT INFO


HOSTED_ZONE_ID="{CHANGE_HOSTED_ZONE_ID}"

IP=$( curl http://instance-data/latest/meta-data/public-ipv4 )

JSON_DIR=$(dirname $(realpath $0))
JSON_FILE=$JSON_DIR/update-route53-A.json
echo "JSON_FILE: $JSON_FILE"

INPUT_JSON=$( cat $JSON_FILE | sed "s/127\.0\.0\.1/$IP/" )
echo "INPUT_JSON: $INPUT_JSON"

# http://docs.aws.amazon.com/cli/latest/reference/route53/change-resource-record-sets.html
# We want to use the string variable command so put the file contents (batch-changes file) in the following JSON
INPUT_JSON="{ \"ChangeBatch\": $INPUT_JSON }"

aws route53 change-resource-record-sets --profile assign-ec2-route53 --hosted-zone-id "$HOSTED_ZONE_ID" --cli-input-json "$INPUT_JSON"
