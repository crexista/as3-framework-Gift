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
	 * ViewのRootを内包したクラスのInterfaceです
	 * @author kaoru_shibasaki
	 * 
	 */	
	public interface IViewRoot
	{
		
		
		/**
		 * テンプレートのviewのrootとなるMovieClipを返します
		 * @return 
		 * 
		 */
		function get root():MovieClip;



		/**
		 * テンプレートのViewのRootとなるMovieClipを設定します
		 * @param value
		 * 
		 */
		function set root(value:MovieClip):void;
	}
}