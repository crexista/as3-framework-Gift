package st.crexi.as3.utils.abstract
{
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	
	import mx.core.MovieClipLoaderAsset;
	import mx.events.PropertyChangeEvent;
	
	/**
	 * Templateの抽象クラスです.
	 * 
	 * このクラスを継承して使う場合は、[Bindable]タグを使う必要が有ります
	 *  
	 * @author kaoru_shibasaki
	 * 
	 */	
	public class AbstTemplateView
	{
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_EMBEDSWF:String = "embedSWF";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_TEMPLATENAME:String = "name";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_ENTITY:String = "entity";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_ADDEVENTLISTNER:String = "addEventListener";
		
		
		/**
		 * メソッド名称です
		 */		
		private const METHOD_NAME_REMOVEEVENTLISTNER:String = "removeEventListener";
		
		
		/**
		 * 埋め込まれたswfの実体です
		 * 
		 */		
		private var _entity:*;



		/**
		 * 
		 * コンストラクタです
		 * 埋め込まれたSWFを読み込める様に変換します
		 * このクラス単体で呼ぶと、IllegalOperationErrorが飛びます
		 * 
		 */
		public function AbstTemplateView()
		{			
			if (this["constructor"] == AbstTemplateView) throw new IllegalOperationError("このクラスは継承して使ってください");
			var mc: MovieClipLoaderAsset = new this[METHOD_NAME_EMBEDSWF]();
			this[METHOD_NAME_ADDEVENTLISTNER](PropertyChangeEvent.PROPERTY_CHANGE, initEntity);
			Loader(mc.getChildAt(0)).contentLoaderInfo.addEventListener(Event.INIT, onInit);
		}



		/**
		 * 埋め込まれたswfを読み込める様にします
		 * @param event
		 * 
		 */		
		protected function onInit(event:Event):void
		{
			var info: LoaderInfo = LoaderInfo(event.target);
			var name:String = this[METHOD_NAME_TEMPLATENAME];
			info.removeEventListener(Event.INIT, onInit);

			_entity = info.content[this[name]];
		}
		
		
		
		/**
		 * enetityを初期化します
		 * @param event
		 * 
		 */		
		protected function initEntity(event:PropertyChangeEvent):void
		{
			if (_entity) throw new IllegalOperationError("既に初期化済みです");
			_entity = event.newValue;
			this[METHOD_NAME_REMOVEEVENTLISTNER](PropertyChangeEvent.PROPERTY_CHANGE, initEntity);
		}



		/**
		 * 埋め込まれたtemplateの実体を返します
		 * @return 
		 * 
		 */		
		public function get entity():*
		{
			return _entity;
		}
		

	}
}