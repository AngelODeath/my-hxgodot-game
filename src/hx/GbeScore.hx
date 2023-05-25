package hx;

import godot.*;

class GbeScore extends Label {
    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeScore._ready()");
    }
}