from flask import Flask, request, render_template_string, make_response

app = Flask(__name__)

@app.route('/')
def index():
    query = request.args.get('q')
    resp = make_response(render_template_string(open("index.html").read(), query=query))
    resp.set_cookie('sessionID', 'UWE_Cyber_XSS')
    return resp

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
