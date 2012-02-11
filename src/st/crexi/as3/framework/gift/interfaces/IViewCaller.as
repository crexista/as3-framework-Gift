////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.framework.gift.interfaces
{
	import flash.display.MovieClip;

	/**
	 * Viewの呼び出すオブジェクトのインターフェースです
	 * AbstViewCallerとセットで使ってください
	 * 
	 * 内部でIViewRootを生成して、IViewRootがシングルトンである様に処理を行います
	 * 
	 * @author crexista
	 * 
	 */	
	public interface IViewCaller
	{
		
		/**
		 * テンプレートのrootとなるMovieClipを返します
		 * 実装する際は[Bindable] setterを付け加えてください
		 * @return 
		 * 
		 */		
		function get root():*;
		
	}
}