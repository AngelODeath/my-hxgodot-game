package hx;

import godot.*;

class GbePlayer extends CharacterBody2D {
    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbePlayer._ready()");
    }
}