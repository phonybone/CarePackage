import sys
from PIL import Image

# see https://auth0.com/blog/image-processing-in-python-with-pillow

try:
    width = int(sys.argv[1])
    height = int(sys.argv[2])
    print(F"resizing to {width}x{height}")
except IndexError:
    print(F"usage: resize-img.py <width> <height> <img_fn> ...")
    sys.exit(1)

for img_fn in sys.argv[3:]:
    img = Image.open(img_fn)
    new_img = img.resize((width, height))
    img_parts = img_fn.split('.')
    img_parts.insert(-1, F"{width}x{height}")
    new_img_fn = '.'.join(img_parts)
    new_img.save(new_img_fn)
    print(F"{new_img_fn} written")
