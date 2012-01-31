package st.crexi.as3.utils.view.interfaces
{
	import flash.display.DisplayObjectContainer;

	/**
	 * Viewの構造を返します
	 * @author kaoru_shibasaki
	 * 
	 */	
	public interface IViewComposition
	{
		
		/**
		 * Viewを初期化します
		 * @param container
		 * 
		 */		
		function initialize(container:DisplayObjectContainer):void;
	}
}