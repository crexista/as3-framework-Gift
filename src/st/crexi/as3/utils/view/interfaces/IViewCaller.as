////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.utils.view.interfaces
{
	import flash.display.MovieClip;

	/**
	 * Viewの呼び出すオブジェクトのインターフェースです
	 * AbstViewCallerとセットで使ってください
	 * 
	 * 内部でIViewRootを生成して、IViewRootがシングルトンである様に処理を行います
	 * 
	 * @author kaoru_shibasaki
	 * 
	 */	
	public interface IViewCaller
	{
		
		/**
		 * テンプレートのrootとなるMovieClipを返します
		 * @return 
		 * 
		 */		
		function get root():*;
		
		
		
		/**
		 * IViewRootを実装したクラスオブジェクトです
		 * Internalクラスを入れてください
		 * @return 
		 * 
		 */		
		function get viewRootClass():Class;
	}
}