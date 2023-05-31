package hx;

import godot.*;
import godot.variant.*;
import hx.*;

class GbeMain extends Node {
    public var player:GbePlayer;

    override function _ready() {
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;

        trace("GbeMain._ready()");
        player = get_node("Player").as(hx.GbePlayer);
        player.onHit.connect(Callable.fromObjectMethod(this, "onPlayerHit"), 0);
        player.onFire.connect(Callable.fromObjectMethod(this, "onPlayerFire"), 0);
        trace('$player signals connected');
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
        if (Engine.singleton().is_editor_hint()) // skip if in editor
            return;
        trace("GbeMain.onPlayerFire()");
        player.fireBullet();
    }
}