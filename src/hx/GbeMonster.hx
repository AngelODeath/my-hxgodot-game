package hx;

import godot.*;
import godot.variant.*;

class GbeMonster extends Node2D {
    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;

        trace("GbeMonster._ready()");
    }
}