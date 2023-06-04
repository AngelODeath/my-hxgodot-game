package hx;

import godot.*;

class GbeParticles extends GPUParticles2D {
    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;
        // trace("GbeParticles._ready()");
    }
}