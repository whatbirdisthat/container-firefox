item = firefox
container = container-$(item)
image = image-$(item)
version = 1.0

install: uninstall
	xhost + $$(ifconfig en0 | grep inet | awk '$$1=="inet" {print $$2}')
	ln -s ${PWD}/src/$(container).bash $${HOME}/.containers.d/${container}
	ln -s ${PWD}/src/$(image).bash $${HOME}/.containers.d/${image}

uninstall:
	rm -f $${HOME}/.containers.d/$(container)
	rm -f $${HOME}/.containers.d/$(image)

