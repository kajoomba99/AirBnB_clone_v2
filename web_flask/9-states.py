#!/usr/bin/python3
"""starts a Flask web application"""
from flask import Flask, escape, render_template
from models import storage
from models.state import State
app = Flask(__name__)


@app.route('/states', defaults={'id': None}, strict_slashes=False)
@app.route('/states/<id>', strict_slashes=False)
def states(id):
    states = storage.all(State)
    if id is None:
        return render_template('9-states.html' , states = states.values())
    state_by_id = states.get("State.{}".format(id), None)
    return render_template('9-states.html' , state_by_id = state_by_id)


@app.teardown_appcontext
def tear_dow(void):
    storage.close()


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
