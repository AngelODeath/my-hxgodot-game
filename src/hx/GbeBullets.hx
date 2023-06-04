package hx;

import godot.*;
import godot.variant.*;
// import hx.*;

class GbeBullets extends Node2D {
    @:export public var bullets:Array<GbeBullet>;
    @:export public var bullet_texture:Texture2D;

    @:export public var shape:RID;

    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeBullets._ready()");
        shape = PhysicsServer2D.singleton().circle_shape_create();
        PhysicsServer2D.singleton().shape_set_data(shape, 8);
        bullets = [];
        // bullet_texture = null;
    }
    @:export
    override function _process(_delta:Float):Void {
        if (Engine.singleton().is_editor_hint())
            return;
        // trace("GbeBullets._process()");
        // this.queue_redraw();
    }
    @:export
    override function _physics_process(_delta:Float):Void {
        if (Engine.singleton().is_editor_hint())
            return;
        // trace("GbeBullets._physics_process()");
    }
    @:export
    override function _draw() {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeBullets._draw()");
        for (bullet in bullets) {
            trace('draw bullet');
        //     this.draw_set_transform(bullet.position,bullet.rotation,new Vector2(bullet.speed,bullet.speed));
        //     this.draw_texture(bullet.texture, new Vector2(0,0), Color.SILVER);
        }
    }

    @:export
    public function set_texture(texture: Texture2D) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace('GbeBullets.set_texture($texture)');
        bullet_texture = texture;
    }

    @:export
    // public function addBullet(_speed:Float, _direction:Vector2, _texture:Texture, _player_position:Vector2) {
    public function addBullet(_bullet: GbeBullet) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace('GbeBullets.addBullet($_bullet)');


        // bullets.push(_bullet);

        // var i = 0;
        // for (bullet in bullets) {
        //     i++;
        //     trace('Bullet $i: $bullet');
        // }
    }
    @:export
    override function _exit_tree(){
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeBullets._exit_tree()");

        // for (bullet in bullets) {
        //     PhysicsServer2D.singleton().free_rid(bullet.body);
        // }

        // PhysicsServer2D.singleton().free_rid(shape);
        // bullets = [];
    }
}