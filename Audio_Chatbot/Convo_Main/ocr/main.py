import pytesseract
from PIL import Image

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR'

image_path = 'handwritten1.jpg'

img = Image.open(image_path)

text = pytesseract.image_to_string(img, lang='eng')
print(text)