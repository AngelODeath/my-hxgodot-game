package hx;

import godot.*;
import godot.variant.*;
// import hx.*;

class GbePlayer extends CharacterBody2D {
    @:export public var onHit:TypedSignal<()->Void>;
    @:export public var onFire:TypedSignal<(direction: Vector2, location: Vector2)->Void>;

    var MoveRight:StringName = "right";
    var MoveLeft:StringName = "left";
    var MoveUp:StringName = "up";
    var MoveDown:StringName = "down";
    var PrimaryFire:StringName = "primary_fire";

    var speed:Vector2 = new Vector2(600,600);
    var animationPlayer:AnimatedSprite2D;
    var fireTimer:Float = -0.5;
    var fireRate:Float = 0.5;

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
        animationPlayer = get_node("AnimatedSprite2D").as(AnimatedSprite2D);
    }

    @:export
    override function _input(_event: InputEvent) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace('GbePlayer._input(${_event.as_text()})');
    }

    @:export
    override function _physics_process(_delta: Float) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer._physics_process()");

        // Already normalized
        var input_vector = Input.singleton().get_vector(MoveLeft, MoveRight, MoveUp, MoveDown);
        
        // Calculate player position based on velocity and framerate
        var velocity = speed * input_vector * _delta;
        var position = get_position();
        position += velocity;
        set_position(position);
        
        // Calculate player direction based on mouse cursor
        var direction = getMouseDirection();
        var angleRad = Math.atan2(direction.y, direction.x);
        var angleDeg = angleRad * 180 / Math.PI;
        rotation_degrees = angleDeg;

        var currentTime = cast(Time.singleton().get_ticks_msec(), Float) / 1000.0;
        if (Input.singleton().is_action_pressed(PrimaryFire)) {
            if (currentTime >= fireTimer+fireRate) {
                fireTimer = currentTime;
                // fireBullet();
                emit_signal("onFire");
            }
            animationPlayer.play("fire");
        } else if (velocity.length() > 0)
            animationPlayer.play("walk");
        else
            animationPlayer.play("stand");
        
        //Todo: handle collisions
        // var collision = move_and_collide(velocity * _delta);
        // trace(collision);

    }

    @:export
    function getMouseDirection(): Vector2 {
        if (Engine.singleton().is_editor_hint())
            return new Vector2(0,0);
        trace("GbePlayer.getMouseDirection()");
        var mousePos = get_global_mouse_position();
        var playerPos = global_position;
        var direction = mousePos - playerPos;
        direction.normalize();
        return direction;
    }

    @:export
    public function fireBullet(){
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer.fireBullet()");
        // var direction = getMouseDirection();
        // var player_position = get_position();

        // trace("GbePlayer.fireBullet()");
        // trace('- And this is a direction: ${direction}');
        // trace('- This is a player_position: ${player_position}');
        
        // onFire.emit(direction, player_position);
    }
}