package hx;

import godot.*;
import godot.variant.*;

class GbePlayer extends CharacterBody2D {
    public var onHit:TypedSignal<()->Void>;
    public var onFire:TypedSignal<()->Void>;

    var MoveRight:StringName = "right";
    var MoveLeft:StringName = "left";
    var MoveUp:StringName = "up";
    var MoveDown:StringName = "down";

    public function new() {
        super();
        trace("new GbePlayer()");
        onHit = Signal.fromObjectSignal(this, "onHit");
        onFire = Signal.fromObjectSignal(this, "onFire");
    }

    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer._ready()");
    }

    @:export
    override function _physics_process(_delta:Float) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer._physics_process()");

        // Already normalized
        var input_vector = Input.singleton().get_vector(MoveLeft, MoveRight, MoveUp, MoveDown);
        trace(input_vector);
    }

    @:export
    function getMouseDirection() {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer.getMouseDirection()");
    }

    @:export
    public function fireBullet(){
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer.fireBullet()");
    }
}