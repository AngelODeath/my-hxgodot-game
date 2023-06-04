package hx;

import godot.*;

class GbeScore extends Label {
    @:export public var score(default,default):Int = 0;

    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        // trace("GbeScore._ready()");
    }
    @:export
    public function setScore(_score:Int) {
        score = _score;
        this.set_text('Score: $score');
    }
    @:export
    public function incrementScore() {
        score++;
        this.set_text('Score: $score');
    }
}