# BgRemove CTF

Introducing BgRemove, your new go-to tool powered by AI for effortlessly removing backgrounds from images. Just upload your image via API, receive it back with the background gone, all in a flash. Perfect for creating clean, sleek visuals without the hassle of manual editing.

## Dependencies

Python 3.10+

## Getting Started

Clone repo

```sh
git clone -b demo/ctf --single-branch git@github.com:monrax/flask-image-bgremover.git
```

Create a virtual environment (optional)

```sh
cd flask-image-bgremover
mkdir venv
python3 -m venv ./venv
. venv/bin/activate
```

Install required packages

```sh
python3 -m pip install -r ./ctf/requirements.txt
```

Run the app

```sh
flask --app main run --debug --port 8080
```

Check out the docs! (Optional)
```sh
open http://localhost:8080/docs
```

## Usage

```sh
curl -H "Content-type:application/json" -d '{"image": "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAMUlEQVR4nGKRslBnwAYmG33GKs6EVRQPGNVADGB0sXuBVUJq0Rzq2DCqgRgACAAA///WdQUVuNf8NgAAAABJRU5ErkJggg=="}' http://localhost:8080/v1/remove > | jq -r '.result|ltrimstr("data:image/png;base64,")' | base64 -d > out.png
```

Want to know more? Check out the API docs at [/docs](./docs/API.md).

## v2

Exciting news! For v2, BgRemove introduces a new feature that enhances user flexibility and creativity. Now, you can utilize "image expressions" from the Pillow Python library to tweak your images before removing the background. The updated v2/remove endpoint accepts both the image and the expression, applying edits such as resizing, cropping, or applying filters before initiating the background removal process. This enhancement empowers users to tailor their images precisely to their preferences before utilizing BgRemove's cutting-edge background removal capabilities.

### Image Expressions

Pillow Image Expressions are standard Python expressions, but they’re evaluated in a non-standard environment. You can use PIL methods as usual, plus the following set of operators and functions:

#### Standard Operators

You can use standard arithmetical operators for addition (+), subtraction (-), multiplication (*), and division (/).

#### Bitwise Operators
The module also provides operations that operate on individual bits. This includes and (&), or (|), and exclusive or (^). You can also invert (~) all pixel bits.

#### Logical Operators
Logical operators like and, or, and not work on entire images, rather than individual pixels.

#### Built-in Functions

- `abs(image)`: Absolute value.

- `convert(image, mode)`: Convert image to the given mode. The mode must be given as a string constant.

- `float(image)`: Convert image to 32-bit floating point. This is equivalent to convert(image, “F”).

- `int(image)`: Convert image to 32-bit integer. This is equivalent to convert(image, “I”).

- `max(image1, image2)`: Maximum value.

- `min(image1, image2)`: Minimum value.

## Security disclaimer

Users are advised that the application now mandates the use of the latest versions of its dependencies due to identified security vulnerabilities in prior versions (**CVE-2023-50447** and **CVE-2022-22817**). These vulnerabilities may pose risks to data security and integrity. It is essential to update to the latest versions promptly to mitigate these risks and ensure robust protection against known threats. Thank you for prioritizing security in your use of the application.
