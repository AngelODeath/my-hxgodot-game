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
        animationPlayer = this.get_node("AnimatedSprite2D").as(AnimatedSprite2D);
    }

    @:export
    override function _physics_process(_delta:Float) {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer._physics_process()");

        // Already normalized
        var input_vector = Input.singleton().get_vector(MoveLeft, MoveRight, MoveUp, MoveDown);
        
        // Calculate player position based on speed
        var velocity = speed * input_vector * _delta;
        var position = this.get_position();
        position += velocity;
        this.set_position(position);
        
        // Calculate player direction based on mouse cursor
        var direction = getMouseDirection();
        var angleRad = Math.atan2(direction.y, direction.x);
        var angleDeg = angleRad * 180 / Math.PI;
        this.rotation_degrees = angleDeg;

        var currentTime = cast(Time.singleton().get_ticks_msec(), Float) / 1000.0;
        if (Input.singleton().is_action_just_pressed(PrimaryFire)) {
            if (currentTime >= fireTimer+fireRate) {
                fireTimer = currentTime;
                this.emit_signal("onFire");
            }
            animationPlayer.play("shoot");
        }
        // } else if (velocity.length() > 0)
        //     animationPlayer.play("walk");
        // else
        //     animationPlayer.play("base");
        
        //Todo: handle collisions
        // var collision = this.move_and_collide(velocity * _delta);
        // trace(collision);

    }

    @:export
    function getMouseDirection(): Vector2 {
        if (Engine.singleton().is_editor_hint())
            return new Vector2(0,0);
        trace("GbePlayer.getMouseDirection()");
        var mousePos = this.get_global_mouse_position();
        var playerPos = this.global_position;
        var direction = mousePos - playerPos;
        direction.normalize();
        return direction;
    }

    @:export
    public function fireBullet(){
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbePlayer.fireBullet()");
    }
}