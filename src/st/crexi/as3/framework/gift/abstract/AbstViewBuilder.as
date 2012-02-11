////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.framework.gift.abstract
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
	
	import st.crexi.as3.framework.gift.event.DeliverEvent;
	import st.crexi.as3.framework.gift.interfaces.IViewBuilder;
	
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
		 * 
		 */		
		private var _viewRoot:DisplayObjectContainer;
		
		
		
		/**
		 * Viewの準備ができたときにloaderInfoのSharedEventを通して通知します
		 */		
		private var _loaderInfo:LoaderInfo
		




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
		public function initialize(loaderInfo:LoaderInfo):void
		{
			if (!loaderInfo) throw new Error("loaderInfoをいれてください");			
			_loaderInfo = loaderInfo;
			
			var mc:* = new (IViewBuilder(this).swfClass)();
			if (mc is MovieClipLoaderAsset) {
				Loader(mc.getChildAt(0)).contentLoaderInfo.addEventListener(Event.INIT, onInit);
			}
			else {
				import mx.events.PropertyChangeEvent; PropertyChangeEvent;
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
			
			var caller:AbstViewCaller = new (IViewBuilder(this).callerClass)();			
			var composition:Object
			
			if (IViewBuilder(this).name != null) {				
				caller[AbstViewCaller.SET_ROOT] = mc[IViewBuilder(this).name];
			}
			else {
				caller[AbstViewCaller.SET_ROOT] = mc;
			}
			
			composition = new (IViewBuilder(this).compositionClass)();
						
			_loaderInfo.sharedEvents.dispatchEvent(new DeliverEvent(IViewBuilder(this).eventType,
																	IViewBuilder(this).propertyName,
																	composition));
		}


	}
}