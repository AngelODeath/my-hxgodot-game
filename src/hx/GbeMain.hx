package hx;

import godot.*;
import godot.variant.*;
import hx.*;

class GbeMain extends Node {
    public var player:GbePlayer;
    public var bullet:PackedScene;
    public var bullets:GbeBullets;

    public var fire_sound_player: AudioStreamPlayer;
    public var background_music_player: AudioStreamPlayer;

    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeMain._ready()");
        player = get_node("Player").as(hx.GbePlayer);
        player.onHit.connect(Callable.fromObjectMethod(this, "onPlayerHit"), 0);
        player.onFire.connect(Callable.fromObjectMethod(this, "onPlayerFire"), 0);
        trace('$player signals connected');

        fire_sound_player = get_node('PlayerFireSound').as(AudioStreamPlayer);
        background_music_player = get_node('BackgroundMusic').as(AudioStreamPlayer);
        background_music_player.play();

        // get_tree().set_auto_accept_quit(true);

        // bullet = ResourceLoader.singleton().load("res://scenes/bullet1.tscn", "", 1).as(PackedScene);
        // bullets = get_node("Bullets").as(GbeBullets);
        // var bullet_texture = ResourceLoader.singleton().load("res://assets/Bullet1.png", "", 1).as(Texture2D);
        // bullets.set_texture(bullet_texture);
        // get_tree().set_auto_accept_quit(true);
    }

    @:export
    override function _unhandled_input(_event: InputEvent) {
        // trace('GbeMain._unhandled_input(${_event.as_text()})');
        if (_event.as_text() == 'Escape') {
            trace('_event.as_text() == "Escape"');
            trace('quiting');
            get_tree().quit();
        }
    }


    // @:export
    // override function _notification(_what: Int) {
    //     trace('GbeMain._notification($_what)');
    //     // Quit event (Alt+F4,X button)
    //     if (_what == Node.NOTIFICATION_WM_CLOSE_REQUEST) {
    //         trace('quiting');
    //         get_tree().quit(); // default behavior
    //     }
    //     // Back event:
    //     // NOTIFICATION_WM_GO_BACK_REQUEST 
    // }

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
    // public function onPlayerFire(direction: Vector2, location: Vector2) {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbeMain.onPlayerFire()");
        fire_sound_player.play();
        player.fireBullet();
        
        // trace("GbeMain.onPlayerFire()");
        // var spawned_bullet = bullet.instantiate().as(GbeBullet);
        // // bullets.add_child(spawned_bullet);
                
        // var bullet_size = bullet_texture.get_size();
        // var offset = -bullet_size * 0.5;
        // var angle_radians = Math.atan2(direction.y, direction.x);

        // spawned_bullet.set_position(location+offset);
        // spawned_bullet.rotation = angle_radians;
        
        // bullets.add_bullet(spawned_bullet, bullet_texture);
        // trace('$spawned_bullet added to bullets layer');
    }
}