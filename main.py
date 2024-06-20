from flask import Flask, render_template, request
from utils.background import remove_bg_image, edit_and_remove_bg


app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/v1/remove", methods=["POST"])
def remove_bg():
    image = request.json.get("image")
    if image is not None:
        result = remove_bg_image(
            image, 
            to_base64=True, 
            myme=True,
            _format="png"
        )
        response = {
            "result": result
        }
        return response
    return "Something went wrong!"

@app.route("/v2/remove", methods=["POST"])
def edit_im_remove_bg():
    image = request.json.get("image")
    expression = request.json.get("expr")
    if image is not None:
        result = edit_and_remove_bg(
            image, 
            expression,
            to_base64=True, 
            myme=True,
            _format="png"
        )
        response = {
            "result": result
        }
        return response
    return "Something went wrong!"
