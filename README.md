# Mapnikio

Experimental Mapnik python 3 wrapper using cython.


## Compiling

Note: Mapnik compilation needs python2.

    make configure
    make compile

## Testing

    export LD_LIBRARY_PATH=vendor/mapnik/src/ python examples/simple.py
