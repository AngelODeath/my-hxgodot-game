package hx;

import godot.*;
import godot.variant.*;
import hx.*;

class GbeMain extends Node2D {
    public var player:GbePlayer;

    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeMain._ready()");
        player = this.get_node("Player").as(hx.GbePlayer);
        player.onHit.connect(Callable.fromObjectMethod(this, "onPlayerHit"), 0);
        player.onFire.connect(Callable.fromObjectMethod(this, "onPlayerFire"), 0);
        trace('$player signals connected');
    }

    @:export
    public function onMobTimer() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbeMain.onMobTimer()");
    }

    @:export
    public function onPlayerHit() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbeMain.onPlayerHit()");
        // player.onPlayerFire();
    }
    
    @:export
    public function onPlayerFire() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbeMain.onPlayerFire()");
        player.fireBullet();
    }
}