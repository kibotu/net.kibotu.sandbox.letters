package 
{
	public interface Collection
	{
		function get(index:int):Object;
		function add(element:Object):void;
		function removeAt(index:int):void;
		function remove(element:Object):void;
		function size():int;
		function clear():int;
		function isEmpty():Boolean;
		function contains(element:Object):int;
		function toString():String;
	}
}