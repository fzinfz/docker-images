# https://github.com/moby/moby/issues/20973

docker stats $(docker ps --format={{.Names}}) --no-stream

# copied from https://pastebin.com/xzu1VK6Y

for line in `docker ps | awk '{print $1}' | grep -v CONTAINER`; do docker ps | grep $line | awk '{printf $NF" "}' && echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; done

