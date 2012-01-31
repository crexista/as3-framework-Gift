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
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import st.crexi.as3.framework.scenario.interfaces.IViewRoot;

	
	/**
	 * ViewRootの振る舞いです<br/>
	 * ViewCallerを実装したクラスから呼ばれます<br/>
	 * 
	 * このクラスは基本的に以下の注意点があります<br/>
	 * 
	 * <p>extendsする</p>
	 * <p>extendsした子クラスがinternalではなくては行けない</p>
	 * <p>一度しかnewできない</p>
	 * 
	 * @author crexista
	 * 
	 */	
	public class TraitViewRoot implements IViewRoot
	{
		

		/**
		 * クラスをキーとしたインスタンスの辞書オブジェクトです
		 */		
		private static var classDic:Dictionary;

		
		
		/**
		 * rootとなるMovieClipを返します
		 */
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
			var className:String;
			var isInternal:Boolean = false;
			if (!classDic) classDic = new Dictionary();			
			if (classDic[this["constructor"]]) throw new IllegalOperationError("このクラスは既にnewされています");
			
			className = getQualifiedClassName(this);
			
			try {
				getDefinitionByName(className);
			}
			catch(error:Error) {
				isInternal = true;
			}
			if (!isInternal) throw new IllegalOperationError("TraitViewRootはInternalクラスにextendsしてください");
			classDic[this["constructor"]] = this;
		}
		
	}
}