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
	import flash.display.MovieClip;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	import mx.events.PropertyChangeEvent;
	

	/**
	 * IViewCallerと合わせて使ってください
	 * このクラスは抽象クラスなため、そのまま呼ぶとエラーが飛びます
	 * @author crexista
	 * 
	 */	
	public class AbstViewCaller
	{
		
		/**
		 * テンプレートのviewのrootをセットするためのsetterの名称です
		 */		
		public static const SET_ROOT:String = "root";
		
		
		
		/**
		 * Rootクラスをラップしたクラスを取得するためのメソッド(getter)名称です
		 */
		private const METHOD_NAME_ROOTCLASS:String = "viewRootClass";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_ADDEVENTLISTNER:String = "addEventListener";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_REMOVEEVENTLISTNER:String = "removeEventListener";
		
		
		/**
		 * クラス名をキーとして辞書を作ります
		 */		
		private static var classDic:Dictionary;
		
				
		
		
		/**
		 * viewのRootのオブジェクトです
		 */
		private static var _viewRoot:MovieClip;
		

		/**
		 * コンストラクタです 
		 * 
		 */
		public function AbstViewCaller()
		{			
			IEventDispatcher(this).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onSet);
		}
		
		
		/**
		 * rootがセットされたときに実行されますが、内部でremoveEventが走るので
		 * 一回しか実行されません
		 * 
		 * @param event
		 * 
		 */		
		protected function onSet(event:PropertyChangeEvent):void
		{
			//TODO 後でErrorクラスを作る
			if (event.oldValue && !AbstViewBuilder.isBuilderInit) throw new Error("既に値が入っています");
			_viewRoot = event.newValue as MovieClip;
						
		}
		
		
		/**
		 * テンプレートのviewのrootを返します
		 * @return 
		 * 
		 */		
		public function get root():*
		{
			return _viewRoot;
		}
	}
}