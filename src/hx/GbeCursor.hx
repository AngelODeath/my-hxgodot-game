package hx;

import godot.*;
import godot.variant.*;

class GbeCursor extends Node2D {
    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;

        // trace("GbeCursor._ready()");
        var arrowTexture = ResourceLoader.singleton().load("res://assets/sprites/Reticle.png", "", 1).as(Texture);
        var hotspot = new Vector2(0, 0);
        Input.singleton().set_custom_mouse_cursor(arrowTexture, hotspot);
    }
}