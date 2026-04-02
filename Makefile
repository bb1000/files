index.html: talk.md
	uv run python refreeze/freeze.py

test:
	uv run python -m pytest -vx --doctest-glob '*.md'

RANDOM_PORT=`python -c 'import random; print(int(5000+ 5000*random.random()))'`

slideshow:
	PORT=$(RANDOM_PORT) uv run python refreeze/flask_app.py &
	gnome-terminal --tab -e "vim talk.md"
