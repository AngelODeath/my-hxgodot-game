package hx;

import godot.*;
import godot.variant.*;
// import hx.*;

class GbeShopkeeper extends Area2D {
    // var animationPlayer:AnimatedSprite2D;
    var dialogTexts:Array<String>;
    public function new() {
        super();
        trace("new GbeShopkeeper()");
        dialogTexts = [
            "Welcome! How can I help you?",
            "Take a look at my wares!",
            "Thanks for stopping by!"
        ];
        // Connect signals
        // onHit = Signal.fromObjectSignal(this, "onHit");
        // onFire = Signal.fromObjectSignal(this, "onFire");
    }

    @:export
    override function _ready() {
        if (Engine.singleton().is_editor_hint())
            return;
        trace("GbeShopkeeper._ready()");
        // animationPlayer = get_node("AnimatedSprite2D").as(AnimatedSprite2D);
    }

}