package st.crexi.as3.framework.scenario.interfaces
{
	import flash.display.DisplayObjectContainer;

	/**
	 * Viewの構造を返します
	 * @author crexista
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