////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.utils.view.event
{
	import flash.events.Event;
	
	/**
	 * Viewの振る舞い挙動の初期化が終わったときに飛ぶイベントです
	 * @author kaoru_shibasaki
	 * 
	 */	
	public class ViewBehaviorInitEvent extends Event
	{
		
		/**
		 * viewの振る舞いが初期化されたら飛ぶイベントデス
		 */		
		public static const INIT:String = "viewbehaviorInit";
		
		
		/**
		 * viewの振る舞いオブジェクトです
		 */		
		private var _behavior:*;
		
		
		/**
		 * コンストラクタです
		 * @param type
		 * @param behavior
		 * 
		 */		
		public function ViewBehaviorInitEvent(type:String, behavior:*)
		{
			super(type);
			_behavior = behavior;
		}
		
		
		/**
		 * Viewの振る舞いをかえします
		 * @return 
		 * 
		 */		
		public function get behavior():*
		{
			return _behavior;
		}
		
		
		override public function clone():Event
		{
			return new ViewBehaviorInitEvent(type, behavior);
		}
	}
}