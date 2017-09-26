from libcpp.string cimport string
from libcpp cimport bool
from libc.stdint cimport uint32_t, uint8_t


cdef extern from "mapnik/map.hpp" namespace "mapnik":
    cdef cppclass Map:
        Map() except +
        void zoom_all()


cdef extern from "mapnik/load_map.hpp" namespace "mapnik":
    void load_map(Map & map, string filename, bool strict, string base_path)


cdef extern from "mapnik/datasource_cache.hpp" namespace "mapnik::datasource_cache":
    cdef cppclass datasource_cache:
        @staticmethod
        datasource_cache instance()
        bool register_datasources(string path, bool recurse)


cdef extern from "mapnik/pixel_types.hpp":
    cdef enum image_dtype:
        image_dtype_rgba8 = 0,
        image_dtype_gray8,
        image_dtype_gray8s,
        image_dtype_gray16,
        image_dtype_gray16s,
        image_dtype_gray32,
        image_dtype_gray32s,
        image_dtype_gray32f,
        image_dtype_gray64,
        image_dtype_gray64s,
        image_dtype_gray64f,
        image_dtype_null,
        IMAGE_DTYPE_MAX
    cdef struct rgba8_t:
        pass
        # using type = uint32_t
        # image_dtype id = image_dtype_rgba8


cdef extern from "mapnik/image.hpp" namespace "mapnik":
    cdef cppclass image[T]:
        image(int width, int height)


cdef extern from "mapnik/agg_renderer.hpp" namespace "mapnik":
    cdef cppclass agg_renderer[buffer_type]:
        agg_renderer(Map & map, buffer_type & pixmap)


cdef extern from "mapnik/image_util.hpp":
    void save_to_file(image & im, string, string)
