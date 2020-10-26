/*1. Complete the following:
a. the average of all 8 generated values
in each sample. from a triangular distribution with peak at h = 0.1 [You
will need to look up details of the =RAND(‘TRIANGLE’,h) function]. Use PROC SGPLOT to produce
a histogram to look at the distribution of your generated observations.*/

data Histogram;
do k=1 to 10000;/*the average of all 8 generated values in each sample.*/
 		x=rand('triangle',0.1);/*triangular distribution with peak at h = 0.1*/
		output;
end;
run;
title 'triangular distribution with peak at h = 0.1';
proc sgplot data=Histogram;
histogram x;
run;

/*b. Describe the shape of the distribution and how it compares to the normal distribution. (Use an
ods text=’’; statement).*/

ods text='The distribution is right skewed, a normal distribution is usually more centered and the mean is in
the middle, th emean of a right skewed distribution is not.';

/*c. Generate 10,000 samples of 8 triangular random variables with peak h = 0.1. For each sample,
calculate the three averages: the average of the first 2 generated values in each sample, the
average of the first 4 generated values in each sample, and the average of all 8 generated values
in each sample. Each of the three averages should be calculated in the same loop. Print the first
20 observations of your generated data set which now includes average calculations.*/

data Histogram1;
do k=1 to 10000;/*Generate 10,000 samples*/
 		x1=rand('triangle',0.1);/*8 triangular random variables with peak h = 0.1*/
 		x2=rand('triangle',0.1);
 		x3=rand('triangle',0.1);
 		x4=rand('triangle',0.1);
 		x5=rand('triangle',0.1);
 		x6=rand('triangle',0.1);
 		x7=rand('triangle',0.1);
 		x8=rand('triangle',0.1);
 		avg2 = mean(of x1-x2);/*the average of the first 2 generated values in each sample*/
 		avg4 = mean(of x1-x4);/*the average of the first 4 generated values in each sample*/
 		avg8 = mean(of x1-x8);/*the average of all 8 generated values in each sample.*/
 		output;
end;
run;
proc print data = histogram1 (obs=20);
run;
/*d. Produce overlapping histograms for the distribution of the three above averages using PROC
SGPLOT. Please have your histograms meet the following conditions:
i. Each histogram should have 50 bins requested.*/

data Histogram2;
do k=1 to 10000;
 		x1=rand('triangle',0.1);
 		x2=rand('triangle',0.1);
 		x3=rand('triangle',0.1);
 		x4=rand('triangle',0.1);
 		x5=rand('triangle',0.1);
 		x6=rand('triangle',0.1);
 		x7=rand('triangle',0.1);
 		x8=rand('triangle',0.1);
 		avg2 = mean(of x1-x2);
 		avg4 = mean(of x1-x4);
 		avg8 = mean(of x1-x8);
 		output;
end;
run;
proc sgplot data = histogram2;
			histogram avg2/nbins=50 fillattrs=(color=red) transparency=.8;
			/*ii. Your first histogram should be red in color and 80% transparent.*/
			histogram avg4/nbins=50 fillattrs=(color=blue) transparency=.7;
			/*iii. Your second histogram should be blue in color and 70% transparent.*/
			histogram avg8/nbins=50 fillattrs=(color=purple) transparency=.6;
			/*iv. Your third histogram should be purple in color and 60% transparent.*/
run;

/*e. Comment on the center, spread, and shape of each distribution. (Use an ods text=’’; statement).*/

ods text='The Center of the 3 distributions is very similar and shape is very similar 
what mostly varies is the spread of them, with red having the 
biggest spread, blue the smallest and purple right in the middle.';

/*f. Create a new data step based on a modification of the one in 1(c). Simply add 1 to the average
calculation for the two variables (e.g., a = mean(of X1-X2)+1), add 2 to the average calculation
involving the 4 variables, and add 3 to the average calculation involving the 8 variables. Using on
PROC SGPLOT create 4 histograms, each with 100 bins. One histogram for the first generated
individual variable, one for the average of 2 variables plus 1, one for the average of 4 variables
plus 2, and one for the average of 6 variables plus 3. Display the resulting plot. You can use the
default colors and it should show the four distributions with little overlapping.*/
data Histogram3;
do k=1 to 10000;
 		x1=rand('triangle',0.1);
 		x2=rand('triangle',0.1);
 		x3=rand('triangle',0.1);
 		x4=rand('triangle',0.1);
 		x5=rand('triangle',0.1);
 		x6=rand('triangle',0.1);
 		x7=rand('triangle',0.1);
 		x8=rand('triangle',0.1);
 		avg2 = mean(of x1-x2)+1;
 		avg4 = mean(of x1-x4)+2;
 		avg8 = mean(of x1-x8)+3;
 		output;
end;
run;
proc sgplot data = histogram2;		
			histogram avg2/nbins=100 ;
			histogram avg4/nbins=100;
			histogram avg8/nbins=100 ;
run;

/*g. Explain what statistical concept is being demonstrated in 1(f) above. (Use an ods text=’’;
statement).*/
ods text=' 1(f) is explaining the Central Limit Theorem that states that"that given a 
sufficiently large sample size from a population with a finite level of variance, 
the mean of all samples from the same population will be approximately equal to the
mean of the population.".';


/*2. The raw data file DriveThru4.txt has two variables: Restaurant (1,2,3,or 4) and Time (drive thru service
time in seconds).
a. You may use data lines to read the data into a SAS data step. */
data DriveThru4;
input Restaurant Time;
datalines;
1  260
1  246
1  263
1  249
1  230
1  240
1  238
1  254
1  242
1  230
1  257
1  254
1  215
1  229
1  243
1  248
1  244
1  233
1  246
1  254
2  205
2  236
2  233
2  220
2  234
2  230
2  223
2  241
2  226
2  211
2  239
2  190
2  242
2  231
2  215
2  221
2  225
2  222
2  242
2  214
3  275
3  251
3  253
3  272
3  255
3  253
3  256
3  229
3  263
3  264
3  265
3  241
3  267
3  261
3  249
3  264
3  240
3  231
3  262
3  243
4  248
4  244
4  259
4  257
4  252
4  233
4  235
4  269
4  251
4  268
4  270
4  259
4  236
4  250
4  237
4  269
4  262
4  243
4  270
4  245
;
proc print data=drivethru4 (firstobs= 20 obs=45 );/*Print Observations 20 through 45.*/
run;


/*b. Use PROC MEANS to print the summarized service times for each of the four restaurants without
sorting the data. Display the median, range, 5th percentile (P5), and 95th percentile (P95). Based
on this output comment on how the four restaurants’ drive-through times compare. (Use an ods
text=’’; statement).*/

proc means data=drivethru4 mean range P5 P95  ;
			class Restaurant;
			var Time;
			run;
ods text='Though they all have similar drive-through times the second restaurant has the shortest time,
the thrid has the longest and the first and fourth are riht in between.';
/*c. Create a new data set based on the above data set that adds a third variable. The new variable
should be called “Efficiency” which takes on the following categorical values: “Fast” for times <
225, “Typical” for 225 ≤ times ≤ 250, and “Slow” for times > 250. Perform a PROC FREQ to
display the number of observations that are in each category of efficiency.*/

data ndrivethru4;
set drivethru4;
if 225<=Time<=250 then Efficiency='Typical';
if Time < 225 then Efficiency= 'Fast';
if Time > 250 then Efficiency= 'Slow';
run;
proc freq data =ndrivethru4;
Tables  Efficiency;
run;
/*d. Create a two-way table for restaurant by efficiency. Comment on at least one interesting pattern
seen. (Use an ods text=’’; statement).*/

proc freq data=ndrivethru4;
tables Restaurant * Efficiency;
run;
ods text='The Second Restaurant has the fastest drive through time and is the most efficient.';

/*3. A European roulette wheel has 37 slots, each marked with a number 0, 1, 2, …, 36. The game is played by
spinning the wheel and a ball is set in motion around the wheel. The ball eventually falls in one of the
slots and, therefore, an integer between 0 and 36 is essentially selected at random.
/*a. Create a data step that simulates one spin of this roulette wheel using the appropriate function
to place the result into a variable (you just need one functional expression and no iteration is
required). Print the resulting data set to show which number came up on this spin.*/
Data Eroulette;
do i = 1 to 1;
	x = rand('Integer',0,36);
	output;
end;
	run;
proc print data=eroulette;
run;

/*b. Simulate 7500 spins of this wheel placing all the results into a single variable. Produce a vertical
bar chart of the results, formatting the chart in any way you feel is effective.*/
Data Eroulette;
do SpinN = 1 to 7500;
	SpinV = rand('Integer',0,36);
	output;
end;
	run;
proc sgplot data=eroulette;
vbar SpinV/ stat=freq;
run;

/*c. Look at the data distribution from your chart in (b). Explain why this distribution’s center,
spread, and shape is expected. (Use an ods text=’’; statement).*/
ods text='This distribution’s center, spread, and shape is expected because in a roulette the evry single
outcome has the same chance of happening';
/*d. One type of wager called a square or corner bet allows a player to select four numbers. One
such example involves the numbers 10, 11, 13, and 14 and the players wins if just one of these
number come up. Simulate 5000 spins of this roulette wheel such that the 10-11-13-14 corner
bet is made. Track each spin by creating a new variable that takes on the value “Win” or “Lose”
depending on the results. Use PROC FREQ to produce a frequency table of the new variable.*/

Data European;
do SpinN = 1 to 5000;
	SpinV = rand('Integer',0,36);
	If 10 <= SpinV <=14 then European ='Win';
	Else European ='Lose';
output;
end;
	run;
proc freq data=European;
Tables European;
run;

/*e. Based on (d), what is your estimated probability of winning on a given spin is a 10-11-13-14
corner bet is placed? (Use an ods text=’’; statement).*/
ods text='what is your estimated probability of winning on a given spin is a 10-11-13-14
corner bet is placed?- There is a 3.5 probabily of winning with these values';

/*4. Consider the following study involving four battery brands (A, B, C, and D), operating conditions (room
temperature or cold) and the time for the battery to fail once a load is placed on it.
a. The data is in the text file BatteryFail.txt. You may copy and paste the contents of BatteryFail.txt into
data lines in a SAS data step you create. There should be three variables: one indicating the time to
failure, one for the temperature condition, and one for the brand. Print observations 5 through 12 of
your resulting data set.*/
Data BatteryFail;
input TimetoFail   Condition $   Brand $ ; 
datalines;
181   RoomTemp   A 
187   RoomTemp   B
150   RoomTemp   C
173   RoomTemp   D
 85   Cold   A
 80   Cold   B
 93   Cold   C
 87   Cold   D
180   RoomTemp   A
192   RoomTemp   B
159   RoomTemp   C
190   RoomTemp   D
 85   Cold   A
 87   Cold   B
100   Cold   C
 98   Cold   D
;
run;
proc print data= batteryfail (firstobs= 5 obs = 12);
run;
/*b. Use PROC SGPLOT to produce a vertical bar chart. Each bar should represent the average of battery
life for each of the four brands. Make sure that the bars are violet in color with a pressed dataskin,*/

Data BatteryFail;
input TimetoFail   Condition $   Brand $ ; 
datalines;
181   RoomTemp   A 
187   RoomTemp   B
150   RoomTemp   C
173   RoomTemp   D
 85   Cold   A
 80   Cold   B
 93   Cold   C
 87   Cold   D
180   RoomTemp   A
192   RoomTemp   B
159   RoomTemp   C
190   RoomTemp   D
 85   Cold   A
 87   Cold   B
100   Cold   C
 98   Cold   D
;
run;
proc sgplot data=batteryfail;
	title 'Average of batterylife';
   vbar Brand / response= TimetoFail stat=mean dataskin=pressed fillattrs=(color=violet);
run;

/*c. Use PROC SGPLOT to produce a grouped vertical bar chart of the same data. Use the groupdisplay=
cluster option. The chart should have two bars for each brand. The bar height should represent the
average battery life for each condition within each brand. Include the STYLEATTRS statement to use
the following two colors in the order given: tan and rose.*/

proc sgplot data=batteryfail;
 STYLEATTRS datacolors= (tan rose);
 vbar Brand  / response=TimetoFail stat=mean group= Condition groupdisplay=cluster  ;
run;

/*d. Use PROC SGPLOT to produce a grouped vertical line chart of the same data. The chart should have
two series of line segments, one series for each of the temperature conditions. In addition, open
triangle markers should be used to indicate the average battery life for each condition for each brand.
Use default colors.*/

proc sgplot data=batteryfail;
vbar Brand  / response=TimetoFail stat=mean group= Condition groupdisplay=cluster  ;
vline Brand  / response=TimetoFail stat=mean group= Condition groupdisplay=cluster
markers markerattrs=(symbol=trialngle)  ;
run;

/*e. Which plot, (c) or (d), do you think represents the information contained in the data better? Explain
(place your explanation in an ods text=’’; statement).*/
ods text='Plot C represented the information the best, because you can clearly see the distinction between room temp
and cold temperature.';





