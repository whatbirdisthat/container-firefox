item = firefox
container = container-$(item)
image = image-$(item)
version = 1.0

install: uninstall
	ln -s ${PWD}/src/$(container).bash $${HOME}/.containers.d/${container}
	ln -s ${PWD}/src/$(image).bash $${HOME}/.containers.d/${image}
	mkdir -p ${PWD}/.mozilla
	sed -i '' 's|#CONTAINER_FIREFOX_LOCATION#|${PWD}|g' ${HOME}/.containers.d/$(image)

uninstall:
	rm -f $${HOME}/.containers.d/$(container)
	rm -f $${HOME}/.containers.d/$(image)

