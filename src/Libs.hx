package ;

import api.Program;

using Lambda;

typedef Library =
{
	name:String,
	?checked:Bool,
	//?args:Array<String> // aditional args like --remap flash:nme ...
}

typedef SWFInfo = {
	src:String,
	help:String
}

typedef LibConf = {
	name : String,
	?args : Array<String>,
	?head:Array<String>,
	?body:Array<String>,
	?swf:SWFInfo
}

typedef AvailableLibs = {
	js : Array<LibConf>,
	swf : Array<LibConf>
}

class Libs
{

	public static var available : AvailableLibs = {
		js : [
			//{name:"nme", args : ["--remap","flash:browser"], head : ["<link rel='stylesheet' href='../swf.css' type='text/css'/>"], body:["<div id='haxe:jeash'></div>"]},
			//{name:"actuate"},
			//{name:"selecthx"},
			//{name:"modernizr"},
			//{name:"browserhx"},
			//{name:"format" },
			//{name:"three.js", head: ["<script src='../../../lib/js/stats-min.js'></script>", "<script src='../../../lib/js/three-min.js'></script>"]}
		],
		swf : untyped { [
			//{name:"actuate" , args : []},
			//{name:"format"},
			{name:"away3d", swf:{src:"away3d4.swf", help:"http://away3d.com/livedocs/away3d/4.0/"}},
			{name:"h3d"},
			//{name:"starling" },
		]; }
	};

	public static var defaultChecked : Array<String> = ["jeash"]; // array of lib names

	static public function getAvailableLibs(target:Target):Array<Library> 
	{
		var res:Array<Library> = new Array();

		var availableOnTarget = switch (target) {
			case JS(_): available.js;
			case SWF(_, _): available.swf;	
		}

		for( l in availableOnTarget ){
			res.push({
				name:l.name, 
				checked:defaultChecked.has( l.name ) 
			});
		}

		return res;
	} 

}