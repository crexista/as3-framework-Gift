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
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	import mx.events.PropertyChangeEvent;
	
	import st.crexi.as3.framework.scenario.interfaces.IViewRoot;

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
		 * クラスをキーとして辞書を作ります
		 */		
		private static var classDic:Dictionary;
		
		
		/**
		 * viewのRootのオブジェクトです
		 */
		private var _viewRoot:IViewRoot;
		

		/**
		 * コンストラクタです 
		 * 
		 */
		public function AbstViewCaller()
		{
			if (!classDic) classDic = new Dictionary();
			if (!classDic[this[METHOD_NAME_ROOTCLASS]]) classDic[this[METHOD_NAME_ROOTCLASS]] = new this[METHOD_NAME_ROOTCLASS]();
			
			_viewRoot = classDic[this[METHOD_NAME_ROOTCLASS]];
			
			this[METHOD_NAME_ADDEVENTLISTNER](PropertyChangeEvent.PROPERTY_CHANGE, onSet);

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
			_viewRoot.root = event.newValue as MovieClip;
			this[METHOD_NAME_REMOVEEVENTLISTNER](PropertyChangeEvent.PROPERTY_CHANGE, onSet);
		}
		
		
		/**
		 * テンプレートのviewのrootを返します
		 * @return 
		 * 
		 */		
		public function get root():*
		{
			return _viewRoot.root;
		}
	}
}