package hx;

import godot.*;

class GbePlayer extends CharacterBody2D {
    public function new() {
        super();
        trace("new GbePlayer()");
    }
    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbePlayer._ready()");
    }
    @:export
    override function _physics_process(_delta:Float) {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbePlayer._physics_process()");
    }
    @:export
    function getMouseDirection() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbePlayer.getMouseDirection()");
    }
    @:export
    public function onPlayerFire(){
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbePlayer.onPlayerFire()");
    }
}