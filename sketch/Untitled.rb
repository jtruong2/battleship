# :sketch_title belongs in --it is a convenience method of jruby_art-3.0+
def setup
  sketch_title 'My Sketch'
end

def draw
  background 0
  fill 200
  ellipse width / 2, height / 2, 300, 200
end

# NB: changes for processing-3.0+
# size, full_screen, pixel_density and smooth should all be moved to settings (this is hidden
# to users of processing ide, but not for JRubyArt, or for Eclipse NetBeans users). The FX2D
# rendering mode was introduced, and was expected to replace JAVA2D (as default rendering mode)
# but may not now happen, and not for processing-3.3 in any case.
def settings
  size 400, 300
end
