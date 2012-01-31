package st.crexi.as3.utils.interfaces
{
	
	/**
	 * テンプレートのViewのロジックとRootを管理するクラスです
	 * @author crexista
	 * 
	 */	
	public interface IViewBehaviorRoot
	{
		
		/**
		 * テンプレートのrootです
		 * @return 
		 * 
		 */		
		function get entityRoot():*;
		
		
		
		/**
		 * ViewのロジックのInterfaceを返します
		 * @return 
		 * 
		 */		
		function get behaviorRoot():*
	}
}