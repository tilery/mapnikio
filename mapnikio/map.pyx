# cython: language_level=3
# distutils: language = c++
from libcpp.string cimport string

cimport mapnik


cdef class Map:
    cdef mapnik.Map _map

    def __cinit__(self):
        self._map = mapnik.Map()

    cpdef load(self, string filename):
        mapnik.load_map(self._map, filename, False, b'')

    cpdef zoom_all(self):
        self._map.zoom_all()

    cpdef register_plugins(self):
        mapnik.datasource_cache.instance().register_datasources(b'vendor/mapnik/plugins/input', True)

    # cpdef save_to_file(self, filename):
    #     cdef mapnik.image[mapnik.rgba8_t] *im = new mapnik.image[mapnik.rgba8_t](256, 256)
    #     # image(map.width(),map.height());
    #     # mapnik.render(self._map, image, 1.0, 0, 0)
    #     cdef mapnik.agg_renderer[mapnik.image[mapnik.rgba8_t]] *renderer = new mapnik.agg_renderer[mapnik.image[mapnik.rgba8_t]](self._map, <mapnik.image[mapnik.rgba8_t]>im)
    #     # renderer.apply()
    #     mapnik.save_to_file(<mapnik.image>im, filename, b"png")
