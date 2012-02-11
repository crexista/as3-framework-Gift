/////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.framework.gift.event
{
	import flash.events.Event;
	
	
	/**
	 * Viewの振る舞い挙動の初期化が終わったときに飛ぶイベントです
	 * @author crexista
	 * 
	 */	
	public class DeliverEvent extends Event
	{
		
		/**
		 * viewの振る舞いが初期化されたら飛ぶイベントデス
		 */		
		public static const INIT:String = "viewbehaviorInit";
		
		
		/**
		 * viewの振る舞いオブジェクトです
		 */		
		private var _behavior:*;
		
		private var _target:Object;
		
		private var _propName:String;
		
		private var _composition:Object;
		
		
		/**
		 * コンストラクタです
		 * @param type
		 * @param behavior
		 * 
		 */		
		public function DeliverEvent(type:String, propName:String, composition:Object)
		{			
			super(type);
			_target = new Object;
			_target[propName] = composition;
			_propName = propName;
			_composition = composition;
		}
		
		override public function get target():Object
		{
			return _target;
		}
		

		
		override public function clone():Event
		{
			return new DeliverEvent(type, _propName, _composition);
		}
	}
}
