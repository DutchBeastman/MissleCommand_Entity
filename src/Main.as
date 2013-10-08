package 
{
	import flash.display.DisplayObject;
	import systems.GravitySystem;
	import systems.RenderSystem;
	import systems.MovementSystem;
	import flash.events.Event;
	import components.VelocityComponent;
	import components.PositionComponent;
	import components.DisplayComponent;
	import flash.display.Sprite;

	public class Main extends Sprite
	{
		
		private var _engine	:	Engine;
		
		public function Main()
		{
			
			// we maken als eerste de engine aan. Deze is het belangrijkste
			_engine	=	new Engine();
			
			// vervolgens initieren wij de systemen
			// dit doen we door ze toe te voegen aan de engine
			_engine.addSystem(new MovementSystem());
			_engine.addSystem(new GravitySystem());
			_engine.addSystem(new RenderSystem());			
			
			
			var car : Entity	=	makeCar(new CarImage(), 300);
			var truck : Entity	=	makeCar(new CarImage(), 200);
			var missle :Entity = makeMissle(new MissleImage(), 400);
			
			
			// registreer de auto bij de engine
			_engine.addEntity(car);
			_engine.addEntity(truck);
			_engine.addEntity(missle);
			
			// laat de auto ook visueel zien
			// we voegen hem toe aan de stage
			addChild(car.display.view);
			addChild(truck.display.view);
			addChild(missle.display.view);
			
			// start het updaten van het spel
			stage.addEventListener(Event.ENTER_FRAME, updateEngine);
		}
		private function makeMissle(view :DisplayObject, x :Number)
		{
			var display	:	DisplayComponent		=	new DisplayComponent();
			display.view							=	view;
			
			var position	:	PositionComponent	=	new PositionComponent();
			position.x								=	x;
			position.y								=	550;
			
			var velocity	:	VelocityComponent	=	new VelocityComponent();
			velocity.velocityX						=	-5;
			velocity.velocityY						=	0;
		
		}
		private function makeCar( view : DisplayObject, x : Number ) : Entity
		{
			// we maken de componenten aan. Hier kan het systeem zijn 'data' in opslaan
			// met data kunnen we waardes opslaan (positie, rotatie, etc.)
			var display	:	DisplayComponent		=	new DisplayComponent();
			display.view							=	view;
			
			var position	:	PositionComponent	=	new PositionComponent();
			position.x								=	x;
			position.y								=	550;
			
			var velocity	:	VelocityComponent	=	new VelocityComponent();
			velocity.velocityX						=	-5;
			velocity.velocityY						=	0;
			
			// als laatste maken we onze entity aan
			// de entity bestaat uit componenten.
			var car	:	Entity						=	new Entity(display, position, velocity);
			
			return car;
		}

		private function updateEngine(e : Event) : void
		{
			_engine.update();
		}
	}
}
