package hx;

import godot.*;

class GbeMain extends Node2D {
    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeMain._ready()");
    }
}