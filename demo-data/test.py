from PIL import Image
import numpy as np

img = Image.open('0_hha.png')
print(img.mode)
img = np.array(img)
print(img)