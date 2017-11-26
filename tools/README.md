# Dockerfile
https://github.com/fzinfz/docker-images/tree/master/tools

# Related link
`latest`(ubuntu)/`debian`/`centos`: https://github.com/fzinfz/scripts/blob/master/install-tools.sh  

`fm`: http://phpfm.sourceforge.net/  

`httpbin`: https://github.com/kennethreitz/httpbin   

`gcc-gvt`: https://github.com/intel/gvt-linux/wiki/GVTg_Setup_Guide (KVMGT)

	docker run --rm -it -v /boot:/boot -v $(pwd):/data -w /data fzinfz/tools:gcc-gvt
