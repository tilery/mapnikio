configure:
	git submodule update --init
	cd vendor/mapnik && git submodule update --init && ./configure && make

compile:
	cython -3 --cplus mapnikio/map.pyx
	python setup.py build_ext --inplace

test:
	py.test -v
