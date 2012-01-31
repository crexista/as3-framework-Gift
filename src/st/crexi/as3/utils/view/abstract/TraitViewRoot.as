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
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	
	import st.crexi.as3.utils.view.interfaces.IViewRoot;

	
	/**
	 * ViewRootの振る舞いです
	 * @author kaoru_shibasaki
	 * 
	 */	
	public class TraitViewRoot implements IViewRoot
	{
		
		private static var classDic:Dictionary;
		
		private var _root:MovieClip;
							
		/**
		 * Rootを返します
		 * @return 
		 * 
		 */
		public function get root():MovieClip
		{			
			return _root;
		}
		
		/**
		 * rootをセットします
		 * @param value
		 * 
		 */		
		public function set root(value:MovieClip):void
		{
			_root = value;
		}
		
		/**
		 * コンストラクタです
		 * このクラスを継承したクラスが2回以上newをされるとerrorが飛ぶ様になっています
		 * 
		 */		
		public function TraitViewRoot() 
		{
			if (!classDic) classDic = new Dictionary();			
			if (classDic[this["constructor"]]) throw IllegalOperationError("このクラスは既にnewされています");
			
			classDic[this["constructor"]] = this;
		}
		
	}
}