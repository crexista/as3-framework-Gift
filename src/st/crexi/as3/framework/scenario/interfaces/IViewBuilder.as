////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011-2012 crexista(kaoru_shibasaki)
//  All Rights Reserved.
//
//  NOTICE: crexista permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package st.crexi.as3.framework.scenario.interfaces
{
	import flash.display.DisplayObjectContainer;
	
	/**
	 * Templateのswfのインターフェースです
	 * 
	 * @author crexista
	 * 
	 */	
	public interface IViewBuilder
	{
		
		/**
		 * 埋め込まれたswfをクラスかさせたものです
		 * @return 
		 * 
		 */		
		function get embedSWF():Class;
		
		
		
		/**
		 * テンプレートのルートを返すクラスです
		 * @return 
		 * 
		 */		
		function get callerClass():Class;
		
		
		
		
		/**
		 * Viewの振る舞いをまとめたクラス、IViewCompostionを継承実装したクラスを返します
		 * IViewCompostionを実装してないクラスを返すとエラーが飛びます
		 * @return 
		 * 
		 */		
		function get compositionClass():Class
		
		
		
		/**
		 * swfのステージに置かれたtemplateのMovieClipの名称です
		 * @return 
		 * 
		 */		
		function get name():String;
		
		
		
		/**
		 * IViewBuilderを初期化します
		 * @param viewRoot
		 * 
		 */		
		function initialize(viewRoot:DisplayObjectContainer):void;
	}
}