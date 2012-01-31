////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.utils.view.abstract
{
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.MovieClipLoaderAsset;
	import mx.events.PropertyChangeEvent;
	
	import st.crexi.as3.utils.view.event.ViewBehaviorInitEvent;
	
	/**
	 * Templateの抽象クラスです.
	 * 
	 * このクラスを継承して使う場合は、[Bindable]タグを使う必要が有ります
	 *  
	 * @author kaoru_shibasaki
	 * 
	 */	
	public class AbstTemplateView extends EventDispatcher
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
		 * コンストラクタです
		 * 埋め込まれたSWFを読み込める様に変換します
		 * このクラス単体で呼ぶと、IllegalOperationErrorが飛びます
		 * 
		 */
		public function AbstTemplateView()
		{			
			if (this["constructor"] == AbstTemplateView) throw new IllegalOperationError("このクラスは継承して使ってください");
			var mc: MovieClipLoaderAsset = new this[METHOD_NAME_EMBEDSWF]();			
			Loader(mc.getChildAt(0)).contentLoaderInfo.addEventListener(Event.INIT, onInit);
		}



		/**
		 * 埋め込まれたswfを読み込める様にします
		 * @param event
		 * 
		 */		
		protected function onInit(event:Event):void
		{
			var info: LoaderInfo = LoaderInfo(event.target);
			var name:String = this[METHOD_NAME_TEMPLATENAME];
			var caller:AbstViewCaller = new this[METHOD_NAME_CALLERCLASS]();
			var behavior:*;
			var mc:MovieClip = info.content as MovieClip;
			
			info.removeEventListener(Event.INIT, onInit);			
			caller[AbstViewCaller.SET_ROOT] = mc[this[METHOD_NAME_TEMPLATENAME]]; 
			
			behavior = new this[METHOD_NAME_BEHAVIORCLASS]();
			dispatchEvent(new ViewBehaviorInitEvent(ViewBehaviorInitEvent.INIT, behavior));
		}


	}
}