/*
https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html
*/

s.boot;
s.reboot;
s.makeWindow.alwaysOnTop;
s.recSampleFormat = "int16";
s.recHeaderFormat = "wav";
FreqScope.new;






x = Platform.recordingsDir;
x = "/Users/robinson.will.sam/Library/Mobile Documents/com~apple~CloudDocs/STUDIO/SuperCollider/Recordings/"
x;



2+2


{Pan2.ar(SinOsc.ar(440, 0, 0.1), 0.0)}.play;


{
	Pan2.ar(SinOsc.ar(440, 0, 0.1), 0.0)
}.play;


{Pan2.ar(SinOsc.ar(MouseX.kr(440, 880), 0, 0.1), 0.0)}.play;



(
Routine({
	s.record("/Users/robinson.will.sam/Library/Mobile Documents/com~apple~CloudDocs/STUDIO/SuperCollider/Recordings/Gendy0.wav", duration: 4);

{
	var n = 33;
	Resonz.ar(
		Mix.fill(n,{
			var freq=rrand(50,560.3);
			var numcps= rrand(2,20);
			Pan2.ar(Gendy1.ar(666.rand,6.rand,1.0.rand,1.0.rand,freq ,freq, 1.0.rand, 1.0.rand, numcps, LFNoise1.kr(exprand(0.02,0.2), 0, numcps/2, numcps/2), 0.5/(n.sqrt)), 1.0.rand2)
		}),
		MouseX.kr(10,2000),
		MouseY.kr(0.01,1.0)
		);
	}.play
}).play;
)

{Pan2.ar(SinOsc.ar(440, 0, 0.1), 0.0)}.play;


(
{

	SinOsc.ar(440, 0, 0.1) + Pulse.ar(443, 0.6, 0.05)
}
.play;
)

(
if(4==4, {
	if(3==3, {
		"correct!".postln
	});
});
)

2.postln;

Post << [2,3,4] <<nl;


(

var freq;
freq = rrand(300, 600);
{ SinOsc.ar(freq, 0, 0.1)}.play;
)


//use unix commands
"ls -l".unixCmd;
"grep -r 'TempoClock.default' SCClassLibrary/*".unixCmd;

(
d = "";
p = Pipe.new("ls -l", "r");
l = p.getLine;
while({l.notNil}, {d = d ++ l ++ "\n"; l = p.getLine;});
p.close;
)

Post << d << nl;
d[0..20];


Clock.dumpClassSubtree;
Array.dumpInterface;

Meta_Array.dumpInterface;

Array.hasHelpFile;

Array.browse;


//purge SynthDef files
"rm synthdefs/*.scsyndef".unixCmd;


/*
1.3: Obtaining SuperCollider
https://composerprogrammer.com/teaching/supercollider/sctutorial/1.3%20Obtaining%20SC3.html
*/

/*
2.1: Subtractive and Additive Synthesis
https://composerprogrammer.com/teaching/supercollider/sctutorial/2.1%20Subtractive%20and%20Additive%20Synthesis.html
*/

(
{

}.scope;
)

FreqScope.new;


//Subtractive Synthesis
{WhiteNoise.ar(0.1)}.scope;

{LPF.ar(WhiteNoise.ar(0.1), 1000)}.scope;

{LPF.ar(WhiteNoise.ar(0.1), Line.kr(10000, 1000, 10))}.scope;


{Resonz.ar(LFNoise0.ar(400), Line.kr(10000,1000,10), 0.2)}.scope;

(
{
var source, line, filter;
source = LFNoise0.ar(400);
line = Line.kr(10000, 1000, 1);
filter = Resonz.ar(source, line, 0.1);

}.scope;
)

//additive synthesis

{SinOsc.ar}.scope;

{SinOsc.ar(400, 0, 0.1) + SinOsc.ar(660, 0, 0.1)}.scope;

{SinOsc.ar([400, 660], 0, 0.1)}.scope;


{Pan2.ar(WhiteNoise.ar(0.1), MouseX.kr(-1, 1))}.scope;

{SinOsc.ar([400, 500], 0, 0.1)}.scope;

{Mix(SinOsc.ar([400, 660], 0, 0.1))}.scope;

{Pan2.ar(Mix(SinOsc.ar([400, 660], 0, 0.1)), MouseX.kr(-1,1))}.play;


//saw wave

(
{
	var n = 60;
	var wave = Mix.fill(10, {|i|
		var mult = ((-1)**i)*(0.5/((i+1)));
		SinOsc.ar(440*(i+1))*mult
	});
	Pan2.ar(wave/n, 0.0);
}.scope;
)

//square wave

(
{
	var n = 10;
	var wave = Mix.fill(10, {|i|
		var harmonicnumber = 2*i+1;
		SinOsc.ar(440*harmonicnumber)/harmonicnumber})*0.25;
	Pan2.ar(wave, 0.0);
}.scope;
)

//triangle wave
(
{
	var n = 10;
	var wave = Mix.fill(10, {|i|
		var harmonicnumber = 2*1+1;
		var mult = ((-1)**((harmonicnumber-1/2)) *(1.0/harmonicnumber*harmonicnumber));
		SinOsc.ar(440*i)*mult })/n;
	Pan2.ar(wave, 0.0);

}.scope;
)

//bell frequency

(
{Mix(SinOsc.ar(500*[0.5,1,1.19,1.56,2,2.51,2.66,3.01,4.1], 0, 0.1))}.scope;

{Mix(SinOsc.ar(500*[0.5,1,1.19,1.56,2,2.51,2.66,3.01,4.1], 0, [0.25,1,0.8,0.5,0.9,0.4,0.3,0.6,0.1]))}.scope;
)

(
var n = 30;
{Mix(SinOsc.ar(250*(1..n), 0, 1/n))}.scope;
)


(1..10)

/*

2.2: Mul and Add
https://composerprogrammer.com/teaching/supercollider/sctutorial/2.2%20Mul%20and%20add.html
*/

//mul
{SinOsc.ar(mul:0.1)}.scope;
{SinOsc.ar(mul:MouseY.kr(1.0, 0.1))}.scope;

//add
{SinOsc.ar(mul:0.1, add: MouseY.kr(0.9, -0.9))}.scope;

{SinOsc.ar(mul: MouseX.kr(0.1, 1.0), add: MouseY.kr(0.9, -0.9))}.scope;


(
{
	var cutoff = SinOsc.ar(
		freq: 1,
		mul: MouseX.kr(0.0, 1700.0),
		add: 2000.0
	);
	LPF.ar(WhiteNoise.ar, freq: cutoff);

}.scope;
)


(
{
	var cutoff = SinOsc.ar(1)*1700.0 + 2000.0;
	LPF.ar(WhiteNoise.ar, freq:cutoff);

}.scope;
)


{SinOsc.ar(440, 0.0, 0.1, 0.0)}.scope;

{SinOsc.ar(MouseX.kr(440, 880), 0.0, 0.1, 0.0)}.scope;

{SinOsc.ar(MouseX.kr(440, 880), mul:0.1)}.scope;



{SinOsc.ar(SinOsc.ar(3,mul:40,add:440),0,0.1)}.scope






/*
2.3: Controlling Synths
https://composerprogrammer.com/teaching/supercollider/sctutorial/2.3%20Controlling%20Synths.html
*/

a = {SinOsc.ar(440)*0.1}.play;
a.run(false)
a.run;
a.free;


a = {|freq=440| SinOsc.ar(freq)*0.1}.play;
a.set(\freq, 330);

a = {|freq=440, amp=0.1| SinOsc.ar(freq)*amp}.play;
a.set(\freq, rrand(220, 440), \amp, rrand(0.05, 0.2));

/*
2.4:Modulation Synthesis
https://composerprogrammer.com/teaching/supercollider/sctutorial/2.4%20Modulation%20Synthesis.html
*/

//Ring Modulation
(
{
	var carrier, modulator, carfreq, modfreq;
	carfreq = MouseX.kr(440, 5000, 'exponential');
	modfreq = MouseY.kr(1, 5000, 'exponential');
	carrier = SinOsc.ar(carfreq, 0, 0.5);
	modulator = SinOsc.ar(modfreq, 0, 0.5);
	carrier * modulator;

}.scope;
)


//amplitude modulation
{SinOsc.ar(440, 0, 0.5)}.scope;
{SinOsc.ar(440, 0, 0.5, 0.5)}.scope;

(
{
	var carrier, modulator, carfreq, modfreq;
	carfreq = MouseX.kr(440, 5000, 'exponential');
	modfreq = MouseY.kr(1, 5000,'exponential');
	carrier = SinOsc.ar(carfreq, 0, 0.5);
	modulator = SinOsc.ar(modfreq, 0, 0.25, 0.25);
	carrier * modulator;
}.scope;
)


//Frequency Modulation
(
var w, carFreqSlider, modFreqSlider, modDepthSlider, synth;

w = Window("frequency modulation", Rect(100,400,400,300));
w.view.decorator = FlowLayout(w.view.bounds);
synth = {
	|carFreq = 440, modFreq = 1, modDepth = 0.01|
	SinOsc.ar(carFreq + (modDepth*SinOsc.ar(modFreq)),0,0.25)
}.scope;

carFreqSlider = EZSlider(w, 300@50, "carFreq", ControlSpec(20, 5000, 'exponential', 10, 440), {|ez| synth.set(\carFreq, ez.value)});
w.view.decorator.nextLine;

modFreqSlider = EZSlider(w, 300@50,"modfreq", ControlSpec(1, 5000, 'exponential', 1, 1), {|ez| synth.set(\modDepth, ez.value)});

w.front;
)

(

var w, carrfreqslider, modfreqslider, modindexslider, synth;



w=Window("frequency modulation via modulation index", Rect(100, 400, 400, 300));

w.view.decorator = FlowLayout(w.view.bounds);



synth= {arg carrfreq=440, modfreq=1, modindex=0;

SinOsc.ar(carrfreq + (modindex*modfreq*SinOsc.ar(modfreq)),0,0.25)

}.scope;



carrfreqslider= EZSlider(w, 300@50, "carrfreq", ControlSpec(20, 5000, 'exponential', 10, 440), {|ez|  synth.set(\carrfreq, ez.value)});

w.view.decorator.nextLine;



modfreqslider= EZSlider(w, 300@50, "modfreq", ControlSpec(1, 5000, 'exponential', 1, 1), {|ez|  synth.set(\modfreq, ez.value)});

w.view.decorator.nextLine;

modindexslider= EZSlider(w, 300@50, "modindex", ControlSpec(0.0, 10, 'linear', 0.01, 0.0), {|ez|  synth.set(\modindex, ez.value)});



w.front;

)

(
{
	var carFreq, modFreq, harmonicity, modIndex;
	carFreq = 110;
	harmonicity = MouseX.kr(0,10).round(1);
	modIndex = MouseY.kr(0.0, 10.0);
	modFreq = carFreq*harmonicity;
	SinOsc.ar(carFreq+(
		SinOsc.ar(modFreq)*modFreq*modIndex),
	phase: 0.0,
	mul: 0.1);

}.play;
)

//Phase Modulation


(

var w, carrfreqslider, modfreqslider, modindexslider, synth;

var conversion= 2pi/(s.sampleRate); //needed to avoid phase being adjusted too wildly



w=Window("phase modulation via modulation index", Rect(100, 400, 400, 300));

w.view.decorator = FlowLayout(w.view.bounds);



synth= {arg carrfreq=440, modfreq=1, modindex=0;

SinOsc.ar(carrfreq, ( (modfreq*modindex)*conversion*SinOsc.ar(modfreq)),0.25)

}.scope;



carrfreqslider= EZSlider(w, 300@50, "carrfreq", ControlSpec(20, 5000, 'exponential', 10, 440), {|ez|  synth.set(\carrfreq, ez.value)});

w.view.decorator.nextLine;



modfreqslider= EZSlider(w, 300@50, "modfreq", ControlSpec(1, 5000, 'exponential', 1, 1), {|ez|  synth.set(\modfreq, ez.value)});

w.view.decorator.nextLine;



//bigger range since adjusting phase directly and not frequency

modindexslider= EZSlider(w, 300@50, "modindex", ControlSpec(0.0, 100, 'linear', 0.01, 0.0), {|ez|  synth.set(\modindex, ez.value)});



w.front;

)

//mouse control

(
{
	var modFreq, modIndex, conversion;
	modFreq = MouseX.kr(
		minval: 1,
		maxval: 1000,
		warp: 'exponential'
	);
	modIndex = MouseY.kr(
		minval: 0.0,
		maxval: 100.0
	);
	conversion = 2pi/(s.sampleRate);

	SinOsc.ar(
		freq: 0,
		phase: Phasor.ar(
			trig: 0,
			rate: 440*conversion*SinOsc.ar(modFreq)),
		mul: 0.25
	);
}.scope;
)


/*
2.5:
https://composerprogrammer.com/teaching/supercollider/sctutorial/2.5%20More%20Synthesis%20Examples.html
*/

//Fat Chorus
(
{
	Mix(
		Saw.ar(
			freq: [440, 443, 437],
			mul: 0.1
		)
	)
}.scope;
)

(
{
	Mix(
		Resonz.ar(
			in: Saw.ar(
				freq: [440, 443, 437] + SinOsc.ar(
					freq: 100,
					phase: 0,
					mul: 100
				)
			),
			freq: XLine.kr(
				start: 10000,
				end: 10,
				dur: 10
			),
			bwr: Line.kr(
				start: 1.0,
				end: 0.05,
				dur: 10
			),
			mul: LFSaw.kr(
				freq: Line.kr(
					start: 3,
					end: 17,
					dur: 3
				),
				iphase: 0,
				mul: 0.5,
				add: 0.5
			) * Line.kr(
				start: 1,
				end: 0,
				dur: 10
			)
		)
	)
}.scope;
)

//Sample Playback Rate Modulation

(
b = Buffer.read(
	server: s,
	path: Platform.resourceDir +/+ "sounds/a11wlk01.wav")
)
(
{
	var modFreq, modIndex, modulator;
	modFreq = MouseX.kr(
		minval: 1,
		maxval: 4400,
		warp: 'exponential'
	);
	modIndex = MouseY.kr(
		minval: 0.0,
		maxval: 10.0,
		warp: 'linear'
	);
	modulator = SinOsc.kr(
		freq: modFreq,
		phase: 0,
		mul: modFreq*modIndex,
		add: 440
	);
	PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: BufRateScale.kr(b)*(modulator/440),
		trigger: 1,
		startPos: 0,
		loop: 1
	)
}.scope;
)

//bell
// (
// {
// 	var nPartials, spectrum, amps, modFreqs1, modFreqs2, decayTimes;
// 	spectrum = [0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 4.1];
// 	amps = [0.25, 1, 0.8, 0.5, 0.9, 0.4, 0.3, 0.6, 0.1];
// 	nPartials = spectrum.size;
// 	modFreqs1 = Array.rand(
// 		size: nPartials,
// 		minVal: 1,
// 		maxVal: 5.0
// 	);
// 	modFreqs2 = Array.rand(
// 		size: nPartials,
// 		minVal: 0.1,
// 		maxVal: 3.0
// 	);
// 	decayTimes = Array.fill(
// 		size: nPartials,
// 		function: {
// 			|i|
// 		rrand(2.5, 2.5+(5*(1.0-(i/nPartials))))}
// 	);
//
// 	{
// 		Mix.fill(
// 			n: spectrum.size,
// 			function: {
// 				|i|
// 				var amp, hz;
// 				hz = (spectrum[i]+
// 					(SinOsc.kr(
// 						freq: modFreqs1[i],
// 						phase: 0,
// 						mul: 0.005
// 				))) * 500;
// 				amp = 0.1 * Line.kr(
// 					start: 1,
// 					end: 0,
// 					dur: decayTimes[i]
// 				) * (SinOsc.ar(
// 					freq: modFreqs2[i],
// 					phase: 0,
// 					mul: 0.1,
// 					add: 0.9
// 					) * amps[i]
// 				);
// 				Pan2.ar(
// 					in: SinOsc.ar(
// 						freq: freq,
// 						phase: 0,
// 						mul: amp
// 					),
// 					pos: 1.0.rand2
// 				)
// 			}
// 		)
//
//
// 	}.scope;
// )

(

var numpartials, spectrum, amplitudes, modfreqs1, modfreqs2, decaytimes;



spectrum = [0.5,1,1.19,1.56,2,2.51,2.66,3.01,4.1];



amplitudes= [0.25,1,0.8,0.5,0.9,0.4,0.3,0.6,0.1];



numpartials = spectrum.size;



modfreqs1 = Array.rand(numpartials, 1, 5.0); //vibrato rates from 1 to 5 Hz



modfreqs2 = Array.rand(numpartials, 0.1, 3.0); //tremolo rates from 0.1 to 3 Hz



decaytimes = Array.fill(numpartials,{|i|  rrand(2.5,2.5+(5*(1.0-(i/numpartials))))}); //decay from 2.5 to 7.5 seconds, lower partials longer decay



{

Mix.fill(spectrum.size, {arg i;

	var amp, freq;



	freq= (spectrum[i]+(SinOsc.kr(modfreqs1[i],0,0.005)))*500;

	amp= 0.1* Line.kr(1,0,decaytimes[i])*(SinOsc.ar(modfreqs2[i],0,0.1,0.9)* amplitudes[i]);



	Pan2.ar(SinOsc.ar(freq, 0, amp),1.0.rand2)});

}.scope



)


/*
3.1:
https://composerprogrammer.com/teaching/supercollider/sctutorial/3.1%20Envelopes.html
*/

//Time varying sounds
(
{
	SinOsc.ar(
		freq: 440,
		phase: 0,
		mul: Line.kr(
			start: 0.1,
			end: 0.0,
			dur: 1.0,
			doneAction: 2
		)
	)
}.scope;
)

//Envelopes
Env([1, 0, 1],[1, 1]).plot;
Env([0,1,0],[1.0, 0.5]).plot;
Env.linen(0.03, 0.5, 0.1).plot;
(
Env.adsr(
	attackTime: 0.01,
	decayTime: 0.5,
	sustainLevel: 0.1,
	releaseTime: 1.0,
).plot;
)

(
Env.perc(
	attackTime: 0.05,
	releaseTime: 0.5,
	level: 1.0,
	curve: 0
).plot;
)

(
Env([1,0],[1.0]).plot;
)

(
{
	EnvGen.ar(
		Env(
			levels: [1,0],
			times: [1.0]
		)
	)
}.scope;
)

(
{
	SinOsc.ar(
		freq: 440,
		phase: 0,
		mul: 0.1
	) * EnvGen.kr(
		Env(
			levels: [1,0],
			times: [1.0]
		)
	)
}.scope;
)

Env([1000, 20], [1.0]).plot;

(
{
	Saw.ar(
		EnvGen.ar(
			Env(
				levels: [1000, 20],
				times: [1.0]
			)
		),
		mul: 0.1
	)
}.scope;
)

(
{
	Saw.ar(
		EnvGen.kr(
			Env(
				levels: [10000, 20],
				times: [0.5],
			)
		),
		EnvGen.kr(
			Env(
				levels: [0.1,0],
				times: [2.0]
			)
		)
	)
}.scope;
)

//FM sound
(
{
	SinOsc.ar(
		SinOsc.ar(
			freq: 10,
			phase: 0,
			mul: 10,
			add: 440
		),
		phase: 0.0,
		mul: EnvGen.kr(
			envelope: Env(
				levels: [0.5, 0.0],
				times: [1.0]
			),
			doneAction: 2
		)
	)
}.scope;
)

(
{
	Saw.ar(
		SinOsc.ar(
			freq: 1,
			phase: 0,
			mul: 10,
			add: 440
		),
		mul: Line.kr(
			start: 0,
			end: 1,
			dur: 1,
			doneAction: 2
		)
	)
}.scope;
)

(
{
	Saw.ar(
		freq: SinOsc.ar(
			freq: 1,
			phase: 0,
			mul: 10,
			add: 440
		),
		mul: Line.kr(
			start: 0,
			end: 1,
			dur: 1,
			doneAction: 2
		)
	)
}.scope;
)

//releasing envelopes
(
{
	EnvGen.ar(
		envelope: Env(
			levels: [0, 0.1, 0],
			times: [0.1, 0.9]
		),
		doneAction: 2
	) * SinOsc.ar(freq: 330)
}.play;
)

(
a = {
	EnvGen.ar(
		Env.asr(
			attackTime: 0.1,
			sustainLevel: 0.1,
			releaseTime: 1.0
		),
		doneAction: 2
	) * SinOsc.ar(330)
}.play;
)

a.release(2);
(
a = {|gate=1|
	EnvGen.ar(
		Env.asr(
			attackTime: 0.1,
			sustainLevel: 0.1,
			releaseTime: 0.9
		),
		gate,
		doneAction: 2
	) * SinOsc.ar(330)
}.play;
)
a.set(\gate, 0);

//looping envelopes





/*
Server side sequencing and triggers
https://composerprogrammer.com/teaching/supercollider/sctutorial/3.4%20Server-side%20Sequencing%20and%20Triggers.html
*/

(
{
	Impulse.ar(
		freq: MouseX.kr(

			minval: 1,

			maxval: 100
		)
	)
}.play;
)

(
{
	[
		LFNoise0.ar(100),
		LFNoise1.ar(100),
		LFNoise2.ar(100)
	]

}.plot(0.1);
)

(
{
	Stepper.ar(
		trig: Impulse.ar(
			freq: 100
		),
		reset: 0,
		min: 1,
		max: 10,
		step: 1
	)

}.plot(0.3, minval: 0, maxval:10);
)



(
{
	SinOsc.ar(
		freq: Stepper.ar(
			trig: Impulse.ar(
				freq: 10
			),
			reset: 0,
			min: 1,
			max: 10,
			step: 1
		) * 100,
		phase: 0,
		mul: 0.1
	)

}.play;
)

(
{
	Saw.ar(
		freq: Select.kr(
			which: Stepper.kr(
				trig: Impulse.kr(
					freq: MouseX.kr(
						minval: 1,
						maxval: 40
					),
					phase: 0.1
				),
				reset: 0,
				min: 0,
				max: 7,
				step: 1
			),
			array: [75, 63, 67, 72, 55, 62, 63, 60].midicps
		),
		mul: 0.1
	)
}.play;
)

(
{
	Saw.ar(
		freq: Select.kr(
			which: Stepper.kr(
				trig: Impulse.kr(
					freq: MouseX.kr(
						minval: 1,
						maxval: 40
					),
					phase: 0.1,
				),
				reset: 0,
				min: 0,
				max: 7,
				step: 1
			),
			array: [75, 63, 67, 72, 55, 62, 63, 60].midicps
		),
		mul: 0.1
	)
}.play;
)


(
{
	var source = SinOsc.ar(100);
	[source, Trig1.ar(source, 0.001)];
}.plot(0.1);
)


//trigger from negative to positive
(
{
	var source, trigger;
	source = LFNoise0.ar(
		freq: 100
	);
	trigger = Trig1.ar(
		in: source,
		dur: 0.001
	);
	[source, trigger]
}.plot(0.2);
)


//trigger on all ups
(
{
	var source, trigger;
	source = LFNoise0.ar(
		freq: 100
	);
	trigger = Trig1.ar(
		in: source - Delay1.ar(
			in: source,
		),
		dur: 0.001
	);
	[source, trigger]
}.plot(0.2);
)

//on any change
(
{
	var source, trigger;
	source = LFNoise0.ar(
		freq: 100
	);
	trigger = Trig1.ar(
		in: abs(source - Delay1.ar(source)
		),
		dur: 0.001
	);
	[source, trigger]

}.plot(0.2);
)

(
{
	Latch.ar(
		in: LFNoise2.ar(
			freq: 100
		),
		trig: Impulse.ar(
			freq: 100
		)
	)
}.plot(0.5);
)

(
{
	Latch.ar(
		in: LFNoise2.ar(
			freq: 100
		),
		trig: Impulse.ar(
			freq: 100
		)
	)

}.plot(0.1);
)

(
{
	SinOsc.ar(
		freq: 300 + (200*Latch.ar(
			in: SinOsc.ar(
				freq: 13.3
			),
			trig: Impulse.ar(
				freq: 10
	))))*0.2

}.play;
)

(
{
	EnvGen.ar(
		envelope: Env(
			levels: [0, 1, 0],
			times: [0.01, 0.01]
		),
		gate: Impulse.kr(
			freq: 50
		)
	)

}.plot(0.1);
)

(
{
	EnvGen.ar(
		envelope: Env(
			levels: [0,1,0,0.5,-0.4],
			times: 0.01!4
		),
		gate: Impulse.kr(
			freq: 25
		)
	)
}.plot(0.1);
)

(
{
	SinOsc.ar(
		freq: 400 * (1.01+EnvGen.ar(
			envelope: Env(
				levels: [0, 0.0125, 0, 0.5, -0.4],
				times: 0.1!4,
				curve: \step
			),
			gate: Impulse.kr(
				freq: 2.0
	))))
}.play;
)

(
{
	SinOsc.ar(
		EnvGen.ar(
			envelope: Env(
				levels: [63, 63, 60, 55, 60],
				times: 0.125!4,
				curve: \step
			),
			gate: Impulse.kr(
				freq: 2
		)).midicps
	)
}.play;
)

(
{
	var sound, env, trig;
	trig = Impulse.ar(
		freq: 3
	);

	sound = Mix(
		array: LFPulse.ar(
			freq: 110.2 * [1.121, 5/2.0001],
			iphase: 0.0,
			width: 0.5,
			mul: 0.2
		)
	);

	env = EnvGen.ar(
		envelope: Env.perc(
			attackTime: 0.02,
			releaseTime: 2,
		),
		gate: trig
	);

	Pan2.ar(sound*env, 0.0);
}.play;
)

(

SynthDef(\mytriggersynth,{arg trig=0;

var env;



//must have additional starting level in envelope, else no nodes to go back to

env= EnvGen.ar(Env([2,2,1],[0.0,0.5],'exponential'),trig);



Out.ar(0,Pan2.ar(Resonz.ar(Saw.ar(env*440),1000,0.1),0.0))

},[\tr]).add

)

a = Synth(\mytriggersynth);
a.set(\trig, 1);


(
{
	var sound, env, trig;
	trig = LFNoise0.ar(13)>0;
	sound = Mix(
		array: LFPulse.ar(
			freq: 100 * [1, 5/2, TRand.ar(
				lo: 3.9,
				hi: 4.1,
				trig: trig
			)],
			iphase: 0.0,
			width: 0.5,
			mul: 0.2
		)
	);

	env = EnvGen.ar(
		envelope: Env.perc(
			attackTime: 0.02,
			releaseTime: 0.1
		),
		gate: trig
	);
	Pan2.ar(sound*env, 0.0)
}.play;
)

{
	SyncSaw.ar(
		syncFreq: MouseX.kr(
			minval: 1,
			maxval: 400
		),
		sawFreq: MouseY.kr(
			minval: 400,
			maxval: 800
		),
		mul: 0.1
	);

}.play;



{EnvGen.ar(Env([0,0,1,-1,0],MouseY.kr(0,1)*[0,128,256,128]/SampleRate.ir),Impulse.ar(MouseX.kr(10,300,'exponential')))}.play


(
{
	var source;
	source = LFNoise0.ar(10);
	[
		source,
		source.lag(0.1)

	]
}.plot;
)

{Saw.ar((Stepper.ar(Impulse.ar(10), 0, 1, 10, 1)*200).lag(MouseX.kr(0.0, 0.2)))}.play;


{Ringz.ar(Saw.ar(LFNoise0.kr(5).lag(MouseX.kr(0.01, 0.3)).exprange(100, 2000).round(20), 0.2), 1000, 0.01)}.play;


(
{
	Decay.ar(Impulse.ar(100),0,0.01)
}.plot(0.1);
)




































