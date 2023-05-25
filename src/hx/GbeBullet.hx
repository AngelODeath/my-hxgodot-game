package hx;

import godot.*;
import godot.variant.*;

class GbeBullet extends Node2D {
    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;

        trace("GbeBullet._ready()");
    }
}