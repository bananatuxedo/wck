﻿package extras {		import Box2DAS.*;	import Box2DAS.Collision.*;	import Box2DAS.Collision.Shapes.*;	import Box2DAS.Common.*;	import Box2DAS.Dynamics.*;	import Box2DAS.Dynamics.Contacts.*;	import Box2DAS.Dynamics.Joints.*;	import cmodule.Box2D.*;	import wck.*;	import shapes.*;	import misc.*;	import extras.*;	import flash.utils.*;	import flash.events.*;	import flash.display.*;	import flash.text.*;	import flash.geom.*;		public class CircleBumper extends Circle {				[Inspectable(defaultValue=500)]		public var baseForce:Number = 100;				[Inspectable(defaultValue=10)]		public var forceMassFactor:Number = 2;				public override function create():void {			reportBeginContact = true;			listenWhileVisible(this, ContactEvent.BEGIN_CONTACT, handleBeginContact);			stop();			super.create();		}				public function handleBeginContact(e:ContactEvent):void {			play();			world.doOutsideTimeStep(function() {				if(e.pointCount > 0) {													e.applyForce(baseForce, forceMassFactor, true);				}			});		}	}}