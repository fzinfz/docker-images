# test e.g.: 
#     printf '%s\n' 18 0 n | ./build.sh

. ../scripts/linux/init.sh || source /dev/stdin <<< "$(curl -sSL https://raw.githubusercontent.com/fzinfz/scripts/master/linux/init.sh)"

. ./init.sh

echo_tip Please select folder:
select_file -d */
d=$(echo $selected_file | sed 's#/##')
echo_tip Please select Dockerfile:
select_file $d
f=$selected_file

run ls -l ${d}/${f}

tag_prefix=$docker_user/$d

[ $f == "Dockerfile" ] && tag_suffix=latest || \
    tag_suffix=$(echo $f | sed 's/Dockerfile-//')

tag=$tag_prefix:$tag_suffix

docker_build(){ run docker build -f ${d}/${f} -t $tag $d $@; }

run "docker images | grep ^$tag_prefix | grep $tag_suffix" 
[ $? -eq 0 ] && ask "Force rebuild?" || docker_build
[ "$a" = "y" ] && docker_build --no-cache

docker_run_tmp(){ docker run --rm $tag $@; }

case $d:$tag_suffix in
    python:django)
        ver_py=$(docker_run_tmp python -V | grep -oP '\d+\.\d+\.\w+') # e.g.: 3.9.14
        ver2_py=$(echo $ver_py | cut -d. -f1-2)                       # e.g.: 3.9
        ver_django=$(docker_run_tmp python -m django version)         # e.g.: 4.1.1
        ver2_django=$(echo $ver_django | cut -d. -f1)                 # e.g.: 4
        run docker tag ${tag} ${tag_prefix}:${ver_py}-django${ver_django}
        run docker tag ${tag} ${tag_prefix}:${ver2_py}-django${ver2_django}
        run "docker_images | grep -P '(^[A-Z])|(${tag_prefix}.*django)'"
    ;;
esac
    
echo_tip "docker run --rm -it --net host -v $(dirname $PWD):/src $tag /bin/bash"
