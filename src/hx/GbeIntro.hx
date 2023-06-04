package hx;

import godot.*;
import godot.variant.*;
// import hx.*;

class GbeIntro extends Node2D {
    var transition_timer:Timer;

    public function new() {
        super();
        trace("new GbeIntro()");
    }

    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeIntro._ready()");
        transition_timer = get_node("SceneTransitionTimer").as(Timer);

        transition_timer.on_timeout.connect(Callable.fromObjectMethod(this, "onTransition"), 0);
    }

    @:export
    public function onTransition() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbeIntro.onTransition()");
        get_tree().change_scene_to_file("res://scenes/main.tscn");
    }
}