package hx;

import godot.*;
import godot.variant.*;

class GbeMonsters extends Node2D {
    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeMonsters._ready()");
    }
    @:export
    override function _process(_delta:Float):Void {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeMonsters._process()");
        // this.queue_redraw();
    }
    @:export
    override function _physics_process(_delta:Float):Void {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeMonsters._physics_process()");
    }
    @:export
    override function _draw() {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeMonsters._draw()");
    }
    @:export
    public function addMonster(_speed:Float, _direction:Vector2, _texture:Texture, _player_position:Vector2) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeMonsters.addMonster()");
    }
    @:export
    override function _exit_tree(){
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeMonsters._exit_tree()");
    }
}