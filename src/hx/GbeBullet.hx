package hx;

import godot.*;
import godot.variant.*;

class GbeBullet extends Node2D {
    // @:export public var texture:Texture2D;
    // @:export public var speed:Float = 50;
    // @:export public var body:RID;

    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;

        trace("GbeBullet._ready()");
    }
    
    // @:export
    // public function set_texture(_texture:Texture2D) {
    //     texture = _texture;
    // }
}