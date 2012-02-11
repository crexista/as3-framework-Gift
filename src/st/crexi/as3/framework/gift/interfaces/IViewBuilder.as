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
	import flash.display.DisplayObjectContainer;
	import flash.display.LoaderInfo;
	
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
		function get swfClass():Class;
		
		
		
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
		 * 処理が終了したときに飛ぶevent名を規定します
		 * @return 
		 * 
		 */		
		function get eventType():String;
		
		
		
		/**
		 * IViewCompostionを実装したクラスインスタンスをなんと言う名称でevent.targetオブジェクトに入れるかを決めます<br/>
		 * 例えば、ここの値が"hoge"だった場合はevent.targe.hogeにcompositionクラスを実装したインスタンスが入ります<br/>
		 * 
		 * @return 
		 * 
		 */		
		function get propertyName():String;
		
		
		
		/**
		 * IViewBuilderを初期化します
		 * @param viewRoot
		 * 
		 */		
		function initialize(loaderInfo:LoaderInfo):void
	}
}