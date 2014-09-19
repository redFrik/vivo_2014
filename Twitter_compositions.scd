//workshop / twitter compositions / f@fredrikolofsson.com / vivo2014

//https://github.com/redFrik/vivo_2014


////////////////////////////////////////////////////////////////////
//--INTRO
////////////////////////////////////////////////////////////////////
s.boot  //first always boot the sound server


//--tweet0212
play{{|i|RecordBuf.ar(Limiter.ar(HPF.ar(Warp1.ar(1,b=LocalBuf(9e3).clear,c=LFSaw.ar(d=1.0009,i).max,1/d)+(c>0/3),9)),b)}!2}// #SuperCollider

//put the cursor on the line above and press shift+return
//stop with cmd+.





////////////////////////////////////////////////////////////////////
//--GENERAL
////////////////////////////////////////////////////////////////////

//avoid headphone when experimenting.
//safer to use the small internal speakers.
//code mistakes will happen and the sound might become very loud.


{SinOsc.ar*0.1}.play  //your sctweet
"{SinOsc.ar*0.1}.play".size  //check if it fits (twitter max 140)


//add a hashtag if you want your sctweet to show up in searches.
//note the space before the # sign.
// #SuperCollider
// #sctweet
// #sc

{SinOsc.ar*0.1}.play// #SuperCollider
"{SinOsc.ar*0.1}.play// #SuperCollider".size
//but the hashtag will also eat up precious space
//so some people leave it out.


//have the meter and scope windows open.
//check levels, spot channel mistakes and dc-offset.
s.meter  //or cmd+m
s.scope  //or cmd+shift+m


//the server window is also useful.
s.makeWindow  //record, cpu status and global volume


//and be prepared to use cmd+. often (= panic shortcut).

//save often.
//and save every step/revision. you then can go back and branch out.
//git is useful for this, but also a plain code file with comments.





////////////////////////////////////////////////////////////////////
//--TWEET #1
////////////////////////////////////////////////////////////////////

play{SinOsc.ar([400,404],0,0.1)}// #SuperCollider

play{SinOsc.ar([400,404]+SinOsc.ar([0.5,0.6],0,50),0,0.1)}// #SuperCollider

play{SinOsc.ar([4000,4004]+SinOsc.ar([10.5,10.6],0,1500),0,0.1)}// #SuperCollider

play{SinOsc.ar([4000,4004]+SinOsc.ar([10.5,10.6],0,1500)+SinOsc.ar(0.1,0,5000,1000),0,0.1)}// #SuperCollider

play{SinOsc.ar([4000,4004]+SinOsc.ar([100.5,10.6],0,1500)+SinOsc.ar(0.1,0,5000,1000),0,SinOsc.ar(2)+SinOsc.ar(3))}// #SuperCollider

"play{SinOsc.ar([4000,4004]+SinOsc.ar([100.5,10.6],0,1500)+SinOsc.ar(0.1,0,5000,1000),0,SinOsc.ar(2)+SinOsc.ar(3))}// #SuperCollider".size


//optimizing:
a=SinOsc;play{a.ar([4000,4004]+a.ar([100.5,10.6],0,1500)+a.ar(0.1,0,5000,1000),0,a.ar(2)+a.ar(3))}// #SuperCollider


//easy to replace main oscillator:
a=LFSaw;play{a.ar([4000,4004]+a.ar([100.5,10.6],0,1500)+a.ar(0.1,0,5000,1000),0,a.ar(2)+a.ar(3))}// #SuperCollider

LFTri
LFPar
LFCub
Blip
LFPulse
VarSaw

a=Blip;play{a.ar([4000,4004]+a.ar([100.5,10.6],0,1500)+a.ar(0.1,0,5000,1000),0,a.ar(2)+a.ar(3))}// #SuperCollider

a=LFPulse;play{a.ar([4000,4004]+a.ar([100.5,10.6],0,1500)+a.ar(0.1,0,5000,1000),0,a.ar(2)+a.ar(3))}// #SuperCollider


//two simple effects you can add.  tanh, and CombN:
a=SinOsc;play{a.ar([4000,4004]+a.ar([100.5,10.6],0,1500)+a.ar(0.1,0,5000,1000),0,a.ar(2)+a.ar(3)*5).tanh}// #SuperCollider

{SinOsc.ar(400, 0, SinOsc.ar(0.1)*5).tanh}.play

a=Blip;play{CombN.ar(a.ar([4000,4004]+a.ar([100.5,10.6],0,1500)+a.ar(0.1,0,5000,1000),0,a.ar(2)+a.ar(3)))}// #SuperCollider


//math and bitwise operators:
a=SinOsc;play{a.ar([4000,4004]&a.ar([100.5,10.6],0,1500)*a.ar(0.1,0,5000,1000),0,a.ar(2)*a.ar(3))}// #SuperCollider

>>
<<
*
/
%
|
&
>
<





////////////////////////////////////////////////////////////////////
//--TEMPLATES
////////////////////////////////////////////////////////////////////

//study and modify the template tweets below.
//try to change numbers, replace ugens.  a=SinOsc is a good target.
//do not care so much of the 140 character limitation to start with.
//also for fun try playing many at the same time!


//shepard tones
play{b=(1..9)*99;Splay.ar(SinOsc.ar(b+LFSaw.kr(-9/b,1,99))*SinOsc.ar(4.5/b))/2}

//drone pieces
play{Splay.ar({|i|SinOsc.ar(i+SinOsc.ar(0.01,a=pi/[2,4,8]@@i,0.1,1)*80+SinOsc.ar(i+1*1e-4+i),a,SinOsc.ar(i+1*1e-3,a)/4)}!9)}//#SuperCollider

{|i|x=i+6.rand;Pbind(\dur,0.06,\sustain,1,\amp,0.01,\degree,Pgauss(x,sin(x+Ptime()%6/6e3)*9),\pan,Pkey(\degree)-x*9).play}!6//#SuperCollider

//--annoying ringtone melodies
a=SinOsc;fork{inf.do{|i|play{Pan2.ar(a.ar(i,a.ar(Duty.ar(b=0.1,0,Dseq([0,i%9,2,3,4,0,2,1]*150,9))),b),i%3-1)};wait(i%5+1)}}// #SuperCollider

a=SinOsc;play{a.ar(0,a.ar(5/3)%1+a.ar(Duty.ar(b=0.15,0,Dseq(a.ar(a.ar(b)/3+0.3).max+1*[[261,440],220,261,349,99,0],inf))))}// #SuperCollider

a=(1,3..9)*99;fork{inf.do{play{SinOsc.ar(Duty.ar(1/[8,9],0,Dseq(a=wrap(a*9,99,8e3),99)),0,Line.kr(0.2,0,9,1,0,2))};2.wait}}// #SuperCollider

//--massive noise
{|i|play{a=LFPulse;HPF.ar(Ringz.ar(a.ar(a.ar(1/(j=i+1)+a.ar(b=(2..5),0,1/b)*b).sum+1*[89,99]*j),2**i*99,0.42).tanh,9)/5}}!4// #SuperCollider

play{a=SinOsc;Normalizer.ar(Splay.ar(a.ar(811+b=(2..8),a.ar((c=a.ar(0.1/b,b))<0*9*b+855+(9/b),a.ar(899/b)*2,2).tanh*6,c)))}// #SuperCollider

play{f=LFPar.ar(1/14).round*20+80;Splay.ar(LFPar.ar({|i|[i+1*f,i*f+(i+1/3)]}!4)>BrownNoise.ar(Pulse.ar({|i|i+1}!4,0.35))/3)}//#SuperCollider

//--minimal techno
a=LFPar;play{Out.ar(5,a.ar(1)|a.ar(5)+RLPF.ar(x=Pan2.ar(InFeedback.ar(5),SinOsc.ar(5.5)),3e3,a.ar(1/25)/2+1.7));x*a.ar(99)}// #SuperCollider

a=LFPar;play{Splay.ar(GrainFM.ar(1,a.ar(9),a.ar((3..7))%1/9,a.ar(1/(2..8))%1*99,(1..9)*99,a.ar(0.22/(4..6))/2+0.5*9)).tanh}// #SuperCollider

a=Blip;play{Splay.ar(Formant.ar(a.ar(9/b=(1..9),a.ar(1/b,b)+2*99,b)+1*[99,400,999,50],a.ar(1/4/b,a.ar(0.2/b,b))*99*b)).sin}// #SuperCollider

play{CombN.ar(SinOsc.ar(Saw.ar(3,64,99),Saw.ar([3,4],Saw.ar(1,32,128),Duty.ar(1,0,flop(Dseq([0,8,1,5])*[1,4,8]))))/9,1,1/6)}//#SuperCollider





////////////////////////////////////////////////////////////////////
//--TWEET #2
////////////////////////////////////////////////////////////////////

play{SinOsc.ar(0,SinOsc.ar([400,404])*2pi)}
play{SinOsc.ar(0,SinOsc.ar([400,404])*3)}
play{SinOsc.ar(0,SinOsc.ar([400,404])*15)}

play{SinOsc.ar(0,SinOsc.ar([400,404])*SinOsc.ar(0.1)*2pi)}

play{SinOsc.ar(0,SinOsc.ar([400,404])*SinOsc.ar(SinOsc.ar(0.1))*2pi)}

play{SinOsc.ar(0,SinOsc.ar([400,404])*SinOsc.ar(SinOsc.ar(0.1)*40)*2pi)}


//this low one recommended for testing with sub bas:
play{SinOsc.ar(0,SinOsc.ar([50,51])*SinOsc.ar(SinOsc.ar(0.1)*40)*2pi)}


//with main oscillator as a variable:
a=SinOsc;play{a.ar(0,a.ar([400,404])*a.ar(a.ar(0.1)*40)*2pi)}

a=VarSaw;play{SinOsc.ar(0,a.ar([400,404])*a.ar(a.ar(0.1)*40)*2pi)}

a=Pulse;play{SinOsc.ar(0,a.ar([400,404])*a.ar(CombN.ar(a.ar(0.1))*40)*2pi)}





////////////////////////////////////////////////////////////////////
//--TRICKS
////////////////////////////////////////////////////////////////////

1000
999

1000
1e3

100000
1e5

0.001
1e-3

99.rrand(999)
900.rand+99

{}.play
play{}

abs(50)
50.abs

[60,63,66,69]
[0,3,6,9]+60

[3,4,5,6]
(3..6)

[0,3,6,9]
(0,3..9)

(24.rand+60).midicps
midicps(24.rand+60)

12.rand+60+(LFPulse.kr(0.3.rand)*3)
LFPulse.kr(0.3.rand)*3+12.rand+60

{EnvGen.ar(Env.perc,Impulse.ar(2))*SinOsc.ar}.play
{EnvGen.ar(Env.perc,LFTri.ar(2))*SinOsc.ar}.play

play{SinOsc.ar(0,SinOsc.ar([400,404]),SinOsc.ar([0.1,0.2]))}
a=SinOsc;play{a.ar(0,a.ar([400,404]),a.ar([0.1,0.2]))}

//some ugens are similar enough to be used as substitutes
{WhiteNoise.ar*0.1}.play
{ClipNoise.ar*0.1}.play

{SinOsc.ar*0.1}.play
{LFCub.ar*0.1}.play

//but it all depends on your usage.
//e.g. LFCub can not be phase modulated, but as steady LFO it is ok.
//and one character less than SinOsc!





////////////////////////////////////////////////////////////////////
//--MULTI CHANNEL
////////////////////////////////////////////////////////////////////

play{SinOsc.ar([400,404,500])*0.1}  //note we only hear 2 channels


//Splay spreads out 3 channels in the stereo field (2 channels)
play{Splay.ar(SinOsc.ar([400,404,500])*0.1)}

play{Splay.ar(SinOsc.ar([400,404,500,600,700,800])*0.1)}


//.sum will add all channels together
play{SinOsc.ar([400,404,500]).sum*0.1!2}


//.mean will add all channels together and then divide by the number
play{SinOsc.ar([400,404,500]).mean*0.1!2}





////////////////////////////////////////////////////////////////////
//--STEP BY STEP
////////////////////////////////////////////////////////////////////

play{SinOsc.ar(midicps([60,63]))}  //a very simple two channel synth

play{Splay.ar(SinOsc.ar(midicps([60,63,66,69])))}  //Splay spread out channels in stereo

//adding note changes (LFPulse varies between 0 and 1)
//.kr means control rate
play{Splay.ar(SinOsc.ar(midicps([60,63,66,69]+LFPulse.kr(1/[3,4,5,6]))))}

//adding rhythm (LFSaw ramps -1 to 1. the clicks happen when jumping from 1 back to -1)
play{Splay.ar(SinOsc.ar(midicps([60,63,66,69]+LFPulse.kr(1/[3,4,5,6])))*LFSaw.ar(1/[1,2,3,0.4]))}

//same thing but more developed
play{Splay.ar(SinOsc.ar(midicps([60,63,66,69]+LFPulse.kr(1/[3,4,5,6]))*LFPulse.kr(2/[3,4,5,6],0,0.1,1,1))*LFSaw.ar(1/[1,2,3,0.4]))}

//again same but written more compact using tricks
a=LFPulse;play{Splay.ar(SinOsc.ar(midicps((0,3..9)+60+a.kr(1/b=(3..6)))*a.kr(2/b,0,0.1,1,1))*LFSaw.ar(1/[1,2,30,0.4]))}

//now hack away!





////////////////////////////////////////////////////////////////////
//--DIFFERENT TECHNIQUES
////////////////////////////////////////////////////////////////////

//LocalIn and LocalOut
//BufRd and BufWr
//InFeedback
//Dseq and other Demand rate ugens
//Pbind, fork and Routine
//.reduce
//recursion
//fm and pm  //we mainly used only these in this workshop!





////////////////////////////////////////////////////////////////////
//--TAKING IT FURTHER
////////////////////////////////////////////////////////////////////

//good sounding tweets can be reused in your 'real' music.
//and also combined with other code to great effect.

//one way is to use simple {}.play.
//first remove the play form your tweet,
//then add any arguments you like (like amp and lag).
//also add these in the tweet code.
//last save the function in a variable (here ~mytweet123)
(
~mytweet123= {|amp= 1, lag= 1|
	CombN.ar(SinOsc.ar(Saw.ar(3,64,99),Saw.ar([3,4],Saw.ar(1,32,128),Duty.ar(1,0,flop(Dseq([0,8,1,5])*[1,4,8]))))/9,1,1/6)
	*amp.lag(lag);
}
)
x= ~mytweet123.play(fadeTime: 8)  //start synth and fade in over 8 s
x.set(\amp, 0.4)  //fade to 40% amplitude in 1 second
x.set(\amp, 1, \lag, 10)  //back to full amplitude over 10 second
x.release(3)  //fade out and free the synth in 3 seconds


//another way is to rewrite it as a SynthDef.
//this requires more work but is probably more flexible in the long run.
//here is one way to do it...
(
SynthDef(\mytweet123, {|out= 0, tempo= 3, amp= 1, lag= 1|
	var src= CombN.ar(SinOsc.ar(Saw.ar(tempo,64,99),Saw.ar([3,4],Saw.ar(1,32,128),Duty.ar(1,0,flop(Dseq([0,8,1,5])*[1,4,8]))))/9,1,1/6);
	Out.ar(out, src*amp.lag(lag));
}).add;
)

a= Synth(\mytweet123)
b= Synth(\mytweet123, [\tempo, 4])
a.free
b.free


//a third possibility is to use Ndef. and this is a great option.
//you get a control gui and more for free.
//this is very similar to the first {}.play above. but no need for
//lag and amp arguments.
(
Ndef(\mytweet123, {
	CombN.ar(SinOsc.ar(Saw.ar(3,64,99),Saw.ar([3,4],Saw.ar(1,32,128),Duty.ar(1,0,flop(Dseq([0,8,1,5])*[1,4,8]))))/9,1,1/6)
});
)

Ndef(\mytweet123).play
Ndef(\mytweet123).gui  //you can play/stop and change the volume
Ndef(\mytweet123).clear


//another example
(
Ndef(\mytweetABC, {	CombN.ar(SinOsc.ar(Saw.ar(3,64,99)+50,Saw.ar([3,4],Saw.ar(1,32,128),Duty.ar(1,0,flop(Dseq([0,8,1,5])*[1,4,8]))))/9,1,1/6)
});
)
Ndef(\mytweetABC).play
Ndef(\mytweetABC).stop(5)  //fade out and stop over 5 seconds




//fadeTime
Ndef(\test3, {SinOsc.ar([400,404]+SinOsc.ar(50,0,50))*0.5})
Ndef(\test3).play
Ndef(\test3).fadeTime= 8  //set 8 seconds crossfade time

Ndef(\test3, {SinOsc.ar([505,808]+SinOsc.ar(50,0,80))*0.5})


//so with Ndef you can change the code while it is running
//and with a fadeTime set you the changes will be smooth.
Ndef(\test3, {LFTri.ar([505,808]+SinOsc.ar(50,0,80))*0.5})

Ndef(\test3, {SinOsc.ar(1)%LFTri.ar([505,808]+SinOsc.ar(50,0,80))*0.5})
Ndef(\test3, {SinOsc.ar(1)%LFTri.ar([505,808]+SinOsc.ar(150,0,180))*0.5})
Ndef(\test3, {SinOsc.ar(1)%LFTri.ar([200,202]+SinOsc.ar(150,0,180))*0.5})
Ndef(\test3).stop(10)





////////////////////////////////////////////////////////////////////
//--EXTRA
////////////////////////////////////////////////////////////////////

{LFSaw.ar(400, 1)}.plot  //useful for learning
{LFSaw.ar(-400, 1)}.plot

//draw tweets with graphviz
Quarks.checkoutAll
Quarks.install("rd_dot")
draw{b=(1..9)*99;Splay.ar(SinOsc.ar(b+LFSaw.kr(-9/b,1,99))*SinOsc.ar(4.5/b))/2}





////////////////////////////////////////////////////////////////////
//--LINKS
////////////////////////////////////////////////////////////////////

http://supercollider.sourceforge.net/sc140/
http://www.archive.org/download/sc140/sc140_sourcecode.txt
http://schemawound.com/post/25710867587/supercollider-tweets-background-tips
http://sccode.org/tag/category/sctweet
http://sccode.org/twitter  //realtime search engine - but seems broken
http://twitter.com/search?q=supercollider+play  //will not catch everything
http://sctweets.tumblr.com  //rukano!
http://soundcloud.com/groups/sc-tweets
http://sccode.org/1-4Qy  //my archive
http://fredrikolofsson.com/f0blog/?q=node/478
http://twitter.com/headcube  //black belt sctweeter
