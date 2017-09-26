from mapnikio.map import Map

map_ = Map()
map_.register_plugins()
map_.load(b'tests/data/simple_style.xml')
map_.zoom_all()
# mapnik.render_to_file(m, "the_image.png")
