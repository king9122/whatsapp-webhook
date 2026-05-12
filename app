from flask import Flask, request

app = Flask(__name__)

VERIFY_TOKEN = "mytoken2024"

@app.route("/webhook", methods=["GET"])
def verify():
    if request.args.get("hub.verify_token") == VERIFY_TOKEN:
        return request.args.get("hub.challenge"), 200
    return "Error", 403

@app.route("/webhook", methods=["POST"])
def webhook():
    return "OK", 200

@app.route("/")
def home():
    return "Running!", 200
