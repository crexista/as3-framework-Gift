package st.crexi.as3.utils.interfaces
{
	
	/**
	 * Templateのswfのインターフェースです
	 * 
	 * @author kaoru_shibasaki
	 * 
	 */	
	public interface ITemplateView
	{
		
		/**
		 * 埋め込まれたswfをクラスかさせたものです
		 * @return 
		 * 
		 */		
		function get embedSWF():Class;
		
		
		
		/**
		 * 埋め込まれたswfの実体です.
		 * MovieClipそのものです
		 * @return 
		 * 
		 */		
		function get entity():*;
		
		
		
		/**
		 * swfのステージに置かれたtemplateのMovieClipの名称です
		 * @return 
		 * 
		 */		
		function get name():String;
	}
}