from typing import Union
from rembg import remove
from PIL import Image, ImageMath

# base64 image utils
from utils.images import base64_to_image, image_to_base64


def remove_bg_image(
    image: Union[str, Image.Image],
    to_base64: bool = True,
    myme: bool = True,
    _format: str = "jpeg"
):
    """removes image bg"""
    if isinstance(image, str):
        image = base64_to_image(image)
    result = remove(image)
    if to_base64:
        result = image_to_base64(result, _format=_format, myme=myme)
    return result

def edit_and_remove_bg(
    image: Union[str, Image.Image],
    expression: str,
    *args, **kwargs
):
    """applies "image expression" to edit image, then removes image bg"""
    if expression is None:
       return remove_bg_image(image, *args, **kwargs)
    if isinstance(image, str):
      image = base64_to_image(image)
    try:
      edited = ImageMath.eval(expression, image=image)
    except ValueError:
      pass
    return remove_bg_image(image if edited is None else edited, *args, **kwargs)