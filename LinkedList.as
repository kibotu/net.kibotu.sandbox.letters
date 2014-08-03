package 
{
	public class LinkedList implements Collection
	{
		private var _head:Node = new Node(null,null);
		private var _tail:Node;
		private var _size:int;

		public function LinkedList():void
		{
			init();
		}

		private function init():void
		{
			_head = new Node(null,null);
			_tail = new Node(null,null);
			_head.next = _tail;
			_size = 0;
		}

		public function add(element:Object):void
		{
			addAt(element,0);
		}

		public function get(index:int):Object
		{
			return getNode(index).content;
		}

		public function removeAt(index:int):void
		{
			inRange(index);
			var tempNode:Node = _head;
			for (var i:int = 0; i < index; ++i)
			{
				tempNode = tempNode.next;
			}
			tempNode.next = tempNode.next.next;
			_size--;
		}

		public function remove(element:Object):void
		{
			if (element == null)
			{
				throw new ArgumentError("object must not be 'null'");
			}
			var tempNode:Node = _head;
			var prevNode:Node = tempNode;
			for (var i:int = 0; i < _size; ++i)
			{
				if (tempNode.content == element)
				{
					prevNode.next = tempNode.next;
					break;
				}
				prevNode = tempNode;
				tempNode = tempNode.next;
			}
			_size--;
		}

		public function size():int
		{
			return _size;
		}

		public function clear():int
		{
			var deletedItems:int = _size;
			init();
			return deletedItems;
		}

		public function contains(element:Object):int
		{
			if (element == null)
			{
				throw new ArgumentError("object must not be 'null'");
			}
			var node:Node = _head;
			for (var i:int = 0; i <= _size; ++i)
			{
				if (node.content == element)
				{
					return i;
				}
				node = node.next;
			}
			return -1;
		}

		public function isEmpty():Boolean
		{
			return _head.next == _tail;
		}

		private function getNode(index:int):Node
		{
			inRange(index);
			var currentNode:Node = _head;
			for (var i:int = 0; i <= index; ++i)
			{
				currentNode = currentNode.next;
			}
			return currentNode;
		}

		private function addAt(element:Object,index:int):void
		{
			if (element == null)
			{
				throw new ArgumentError("object must not be 'null'");
			}
			inRange(index);
			var tempNode:Node = _head;
			for (var i:int = 0; i < index; ++i)
			{
				tempNode = tempNode.next;
			}
			var newNode:Node = new Node(element,tempNode.next);
			tempNode.next = newNode;
			_size++;
		}

		private function inRange(index:int):void
		{
			if (index < 0 || index > _size)
			{
				throw new ArgumentError("Invalid index: index " + index + " bigger than " + _size);
			}
		}

		public function toString():String
		{
			var result:String = "";
			for (var i:int; i < _size; ++i)
			{
				result +=  get(i).toString() + "\n";
			}
			return result;
		}


	}
}
internal class Node {
	public var content:Object;
	public var next:Node;
	
	public function Node(content:Object,next:Node)
	{
		this.content = content;
		this.next = next;
	}
	
	public function toString():String
	{
		return content.toString();
	}
}