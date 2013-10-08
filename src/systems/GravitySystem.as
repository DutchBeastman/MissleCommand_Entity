package systems {

	public class GravitySystem extends System {
		private var _Gravity:int = 1;
		
		override public function update():void
		{
			// in deze update staat de logica om de objecten te laten bewegen
			for each( var target:Entity in targets )
			{
				target.velocity.velocityY += _Gravity;
			}
		}
		
	}
}
