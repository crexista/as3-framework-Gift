////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.framework.scenario.abstract
{
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.MovieClipLoaderAsset;
	import mx.events.PropertyChangeEvent;
	
	import st.crexi.as3.framework.scenario.event.ViewBehaviorInitEvent;
	import st.crexi.as3.framework.scenario.interfaces.IViewComposition;
	
	/**
	 * Templateの抽象クラスです.
	 * 
	 * このクラスを継承して使う場合は、[Bindable]タグを使う必要が有ります
	 *  
	 * @author crexista
	 * 
	 */	
	public class AbstViewBuilder extends EventDispatcher
	{
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_EMBEDSWF:String = "embedSWF";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_TEMPLATENAME:String = "name";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_ENTITY:String = "entity";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_CALLERCLASS:String = "callerClass";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_BEHAVIORCLASS:String = "behaviorClass";

		
		/**
		 * 
		 */		
		private var _viewRoot:DisplayObjectContainer;
		




		/**
		 * 
		 * コンストラクタです
		 * 埋め込まれたSWFを読み込める様に変換します
		 * このクラス単体で呼ぶと、IllegalOperationErrorが飛びます
		 * 
		 */
		public function AbstViewBuilder()
		{			
			if (this["constructor"] == AbstViewBuilder) throw new IllegalOperationError("このクラスは継承して使ってください");
		}
		
		
		
		/**
		 * Builderの初期化を行います
		 * @param viewRoot
		 * 
		 */		
		public function initialize(viewRoot:DisplayObjectContainer):void
		{
			_viewRoot = viewRoot;
			var mc:* = new this[METHOD_NAME_EMBEDSWF]();
			if (mc is MovieClipLoaderAsset) {
				Loader(mc.getChildAt(0)).contentLoaderInfo.addEventListener(Event.INIT, onInit);
			}
			else {
				notifyInit(mc);
			}
			

		}



		/**
		 * 埋め込まれたswfを読み込める様にします
		 * @param event
		 * 
		 */		
		protected function onInit(event:Event):void
		{
			var info: LoaderInfo = LoaderInfo(event.target);
			info.removeEventListener(Event.INIT, onInit);
			notifyInit(MovieClip(info.content));
		}
		
		
		/**
		 * Viewの初期化が終了した事を伝えます 
		 * @param mc
		 * 
		 */		
		protected function notifyInit(mc:MovieClip):void
		{
			var name:String = this[METHOD_NAME_TEMPLATENAME];
			var caller:AbstViewCaller = new this[METHOD_NAME_CALLERCLASS]();
			var behavior:IViewComposition;
			
			if (this[METHOD_NAME_TEMPLATENAME] != null) {				
				caller[AbstViewCaller.SET_ROOT] = mc[this[METHOD_NAME_TEMPLATENAME]];
			}
			else {
				caller[AbstViewCaller.SET_ROOT] = mc;
			}
			
			behavior = new this[METHOD_NAME_BEHAVIORCLASS]();
			behavior.initialize(_viewRoot);
			dispatchEvent(new ViewBehaviorInitEvent(ViewBehaviorInitEvent.INIT, behavior));

		}


	}
}