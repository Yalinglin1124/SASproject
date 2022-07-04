option nocenter linesize=256 pagesize=3200 mprint mlogic ; ;             
                                                                         
libname in 'D:/output/all_loan' ;                                        
libname out 'D:/output/all_loan_datasets';                               
libname out1 'D:/output/SPL' ;

*==========================* ;
*=====1.Cluster Variables=======* ;
*==========================* ;

data CoarseRanked ;
set out1.all_base ; 

if CURR_INT_12<=0 then RCURR_INT_12=0 ;
else if CURR_INT_12<=8.9 then RCURR_INT_12=1 ;
else if CURR_INT_12>8.9 then RCURR_INT_12=2 ;

if MTHEND_BAL_12<=90011 then RMTHEND_BAL_12=0 ;
else if MTHEND_BAL_12>90011 then RMTHEND_BAL_12=1 ;

if MTHEND_INTBAL_12<=0 then RMTHEND_INTBAL_12=0 ;
else if MTHEND_INTBAL_12<1900 then RMTHEND_INTBAL_12=1 ;
else if MTHEND_INTBAL_12>=1900 then RMTHEND_INTBAL_12=2 ;

if MTHEND_PEN_12<=0 then RMTHEND_PEN_12=0 ;
else if MTHEND_PEN_12>0 then RMTHEND_PEN_12=1 ;

if MTHEND_FEE_12<=0 then RMTHEND_FEE_12=0 ;
else if MTHEND_FEE_12>0 then RMTHEND_FEE_12=1 ;

if ratio_bal_loan12<0.418 then Rratio_bal_loan12=0 ;
else if 0.418<=ratio_bal_loan12<0.71 then Rratio_bal_loan12=1 ;
else if 0.71<=ratio_bal_loan12 then Rratio_bal_loan12=2 ;

if BAL_Dec_Nov<0 then RBAL_Dec_Nov=0 ;
else if BAL_Dec_Nov>=0 then RBAL_Dec_Nov=1 ;

if INTBALavg_6M<=0 then RINTBALavg_6M=0 ;
else if 0<INTBALavg_6M<=500 then RINTBALavg_6M=1 ;
else if INTBALavg_6M>500 then RINTBALavg_6M=2 ;

if INTBAL_Dec_Nov<=0 then RINTBAL_Dec_Nov=0 ;
else if INTBAL_Dec_Nov>0 then RINTBAL_Dec_Nov=1 ;

if INTBAL_Nov_Oct<=0 then RINTBAL_Nov_Oct=0 ;
else if INTBAL_Nov_Oct>0 then RINTBAL_Nov_Oct=1 ;

if DLINavg_6M<=0  then RDLINavg_6M=0 ;  
else if 0<DLINavg_6M<30  then RDLINavg_6M=1 ;  
else if DLINavg_6M>=30  then RDLINavg_6M=2 ;  

if DLIN_Dec_Nov<0  then RDLIN_Dec_Nov=0 ;  
else if DLIN_Dec_Nov=0  then RDLIN_Dec_Nov=1 ;  
else if DLIN_Dec_Nov>0  then RDLIN_Dec_Nov=2 ;  

if ratio_bal_loan_Dec_Nov<-0.018  then Rratio_bal_loan_Dec_Nov=0 ; 
else if -0.018<=ratio_bal_loan_Dec_Nov<-0.0146  then Rratio_bal_loan_Dec_Nov=1 ; 
else if -0.0146<=ratio_bal_loan_Dec_Nov then Rratio_bal_loan_Dec_Nov=2 ; 

if ratio_bal_loan_Nov_Oct<-0.018  then Rratio_bal_loan_Nov_Oct=0 ; 
else if -0.018<=ratio_bal_loan_Nov_Oct<-0.0146  then Rratio_bal_loan_Nov_Oct=1 ; 
else if -0.0146<=ratio_bal_loan_Nov_Oct then Rratio_bal_loan_Nov_Oct=2 ; 

if ratio_paid_balavg_6M<0.027 then Rratio_paid_balavg_6M=0 ; 
else if 0.027<=ratio_paid_balavg_6M<0.05 then Rratio_paid_balavg_6M=1 ; 
else if 0.05<=ratio_paid_balavg_6M then Rratio_paid_balavg_6M=2 ; 

if ratio_paid_balavg_12M<-0.04 then Rratio_paid_balavg_12M=0 ; 
else if -0.04<=ratio_paid_balavg_12M<0.035 then Rratio_paid_balavg_12M=1 ; 
else if 0.035<=ratio_paid_balavg_12M then Rratio_paid_balavg_12M=2 ; 

if ratio_paid_bal_Nov_Oct<0 then Rratio_paid_bal_Nov_Oct=0 ; 
else if ratio_paid_bal_Nov_Oct=0 then Rratio_paid_bal_Nov_Oct=1 ; 
else if ratio_paid_bal_Nov_Oct>0 then Rratio_paid_bal_Nov_Oct=2 ; 

if Dlin_24<=2 then RDlin_24=0 ; 
else if 2<Dlin_24<=5 then RDlin_24=1 ; 
else if Dlin_24=6 then RDlin_24=2 ; 
else if Dlin_24>=7 then RDlin_24=3 ; 

if PAID_REPAY_13=0 then RPAID_REPAY_13=0 ; 
else if PAID_REPAY_13 in (1,2) then RPAID_REPAY_13=1 ; 
else if PAID_REPAY_13>=3 then RPAID_REPAY_13=2 ; 

if CHRVA100<=21 then RCHRVA100=0 ; 
else if 21<CHRVA100<=34 then RCHRVA100=1 ; 
else if 34<CHRVA100 then RCHRVA100=2 ; 

if CHRVA210=-9999999  then RCHRVA210=0 ; 
else if CHRVA210=0  then RCHRVA210=1 ; 
else if CHRVA210>0  then RCHRVA210=2 ; 

if CHRVA260=0  then RCHRVA260=0 ; 
else if 0<CHRVA260<=2  then RCHRVA260=1 ; 
else if CHRVA260>2  then RCHRVA260=2 ; 

if CHRVA264=0  then RCHRVA264=0 ; 
else if 0<CHRVA264<=6  then RCHRVA264=1 ; 
else if 6<CHRVA264  then RCHRVA264=2 ; 

if CHRVA331=0  then RCHRVA331=0 ; 
else if 0<CHRVA331<=7  then RCHRVA331=1 ; 
else if 7<CHRVA331<=10  then RCHRVA331=2 ; 
else if CHRVA331>=11  then RCHRVA331=3 ; 

if CHRVA340<=95 then RCHRVA340=0 ; 
else if 95<CHRVA340<=98 then RCHRVA340=1 ; 
else if 98<CHRVA340 then RCHRVA340=2 ; 

if CHRVA345<=66  then RCHRVA345=0 ; 
else if 66<CHRVA345<=81  then RCHRVA345=1 ; 
else if 81<CHRVA345  then RCHRVA345=2 ; 

if CHRVA540Z=0  then RCHRVA540Z=0 ; 
else if CHRVA540Z=1  then RCHRVA540Z=1 ; 
else if CHRVA540Z>=2  then RCHRVA540Z=2 ; 

if CHRVA941Y=0  then RCHRVA941Y=0 ; 
else if CHRVA941Y in (1,2,3) then RCHRVA941Y=1 ; 
else if CHRVA941Y>=4  then RCHRVA941Y=2 ; 

if CHRVA1017<=18 then RCHRVA1017=0 ; 
else if 18<CHRVA1017<=39 then RCHRVA1017=1 ; 
else if 39<CHRVA1017 then RCHRVA1017=2 ; 

if CHRVA1040=-9999999 then RCHRVA1040=0 ; 
else if 0<=CHRVA1040<0.56 then RCHRVA1040=1 ; 
else if 0.56<=CHRVA1040<=0.68 then RCHRVA1040=2 ; 
else if 0.68<CHRVA1040 then RCHRVA1040=3 ; 

if BU2=0  then RBU2=0 ; 
else if 1<=BU2<=3  then RBU2=1 ; 
else if 3<BU2<=5  then RBU2=2 ; 
else if 5<BU2  then RBU2=3 ; 

if BU29=0  then RBU29=0 ; 
else if BU29=1  then RBU29=1 ; 
else if 1<BU29  then RBU29=2 ; 


if BU56=0 then RBU56=0 ; 
else if BU56=1 then RBU56=1 ; 
else if 1<BU56 then RBU56=2 ; 
run ;

data devbase ;
set out1.devbase ;
keep acc_no data_ymd_12 ;

proc sort data=devbase ; by data_ymd_12 acc_no ;
proc sort data=CoarseRanked ; by data_ymd_12 acc_no ;

data CoarseRanked_devbase CoarseRanked_intimevalbase;
merge devbase(in=a) CoarseRanked(in=b) ;
by data_ymd_12 acc_no ;
if a then output CoarseRanked_devbase;
else output CoarseRanked_intimevalbase;
run ;

*==========================================* ;
*===== 2. calculate WOE, IV, Bad_rate in each bucket ===* ;
*==========================================* ;

*-----2. calculate WOE, IV, Bad_rate in each bucket-----* ;

%macro FindTotalBads;
proc means data = out1.DevBase(keep = perform);
var  perform;
output out = BadsCount(rename = (_freq_ = TotalPop)) SUM(perform) = NoofBads; 
run;
%mend FindTotalBads;

%FindTotalBads;

data BadsCount;
set BadsCount;
call symput("TotalPop",TotalPop);       
call symput("NoofBads",NoofBads);
run;

%put &TotalPop;   
%put &NoofBads;  
%let NoofGoods   = %eval(&TotalPop - &NoofBads);


%macro MakeBinsC(Varname);

data CoarseRanked(keep=RankVar &varname perform) ;
set CoarseRanked_devbase ;
RankVar=R&varname ;
run ; 

proc summary SUM data = CoarseRanked nway;
class RankVar;
var  &Varname perform;
output out = &varname (rename = (_freq_ = TotalinBand) Drop = _Type_ ) MIN(&Varname) = Low MAX(&Varname) = High SUM(perform) = BandNoofBads; 
run;

data &varname(drop = Low High rename=(tempLow = Low tempHigh=High));
set &varname;
length tempLow $32.;
length tempHigh $32.;
tempLow = Low||"";
tempHigh = High||"";
run;

data &varname ;
set &varname ;
length var $32 ;
var = "&varname" ;
retain cumm_infoval 0; 
TP = TotalinBand*100/&TotalPop;
BandNoofGoods = TotalinBand - BandNoofBads;
GP = BandNoofGoods*100/&NoofGoods;
BP = BandNoofBads*100/&NoofBads;
if gp*bp ne 0 then WoE = log((BandNoofGoods/&NoofGoods)/(BandNoofBads/&NoofBads));
			  else if gp = 0 then WoE = 0 ; else WoE = 0 ;
InfovalBand = (gp - bp)*WoE;
*WoeRound = floor(WoE*10);
cumm_Infoval + InfovalBand;
BadRate = BandNoofBads*100/TotalinBand;
*BadRateRound = floor(BadRate/5);
run;

proc means data = &varname;
var  InfovalBand;
output out = inf&varname SUM(InfovalBand) = Infoval; 
run;

data inf&varname(drop = _type_ _freq_);
set inf&varname;
length var $32;
var = "&varname";
run;
%mend MakeBinsC;


* 3. Form bins for each discrete variable (no. of bins = no. of distinct values) and find the infoval *;

* 4. Form the continuous and discrete variables list * ;
%let BinCVarList = 
CURR_INT_12            
MTHEND_BAL_12          
MTHEND_INTBAL_12       
MTHEND_PEN_12          
MTHEND_FEE_12          
ratio_bal_loan12       
BAL_Dec_Nov            
INTBALavg_6M           
INTBAL_Dec_Nov         
INTBAL_Nov_Oct         
DLINavg_6M             
DLIN_Dec_Nov           
ratio_bal_loan_Dec_Nov 
ratio_bal_loan_Nov_Oct 
ratio_paid_balavg_6M   
ratio_paid_balavg_12M  
ratio_paid_bal_Nov_Oct 
Dlin_24
PAID_REPAY_13          
CHRVA100               
CHRVA210               
CHRVA260               
CHRVA264               
CHRVA331               
CHRVA340               
CHRVA345               
CHRVA540Z              
CHRVA941Y              
CHRVA1017              
CHRVA1040              
BU2                    
BU29                   
BU56 ;                  

%put &BinCVarList;

*%let BinDVarList = 
;

*%put &BinDVarList;

%macro CallMakeBinsWithList;
%let j = 1;
%do %while(%scan(&BinCVarList, &j) ne %str());
    %let var = %scan(&BinCVarList, &j);
	%MakeBinsC(&var);	
    %put &var;
    %let j = %eval(&j+1);
%end;
%put &j;

%mend CallMakeBinsWithList;

%CallMakeBinsWithList;

*%let BinVarList = &BinCVarList &BinDVarList;
%let BinVarList = &BinCVarList ;

* 5. Append the datasets created for each variable which have GP,BP,bandinfoval etc. 
      Also append the datasets created for each variable that have the variable name and its infoval * ;
%macro ForAppending;
%let i = 1;
%do %while(%scan(&BinVarList, &i) ne %str());
    %let var = %scan(&BinVarList, &i);
	&var
    %let i = %eval(&i+1);
%end;
%put &i;
%mend ForAppending;

data out1.appended;
set %ForAppending;
run;

*================================================================* ;
*====3. merge devbase and CoarseRanked_devbase_woe to create a dataset containing 
          oringal data and WOE to run logistic model ============================ * ;
*=================================================================* ;
%macro WOE1(in,woe,var,var1) ;

data mark ;
set out1.appended ;
if var=&var1 then do ;
    &woe=woe ;
	&var=rankvar ;
end ;
else delete ;
keep &var &woe ;  

proc sort data=mark ; by &var ;
proc sort data=&in ; by &var ;

data a ;
merge &in(in=a) mark(in=b) ;
by &var ;
if a then output ;
run ;

%mend WOE1 ;
%WOE1(CoarseRanked_devbase,woeCURR_INT_12,RCURR_INT_12,'CURR_INT_12' ) ;                                         
%WOE1(a,woeMTHEND_BAL_12,RMTHEND_BAL_12,'MTHEND_BAL_12' ) ;                                  
%WOE1(a,woeMTHEND_INTBAL_12,RMTHEND_INTBAL_12,'MTHEND_INTBAL_12' ) ;                         
%WOE1(a,woeMTHEND_PEN_12,RMTHEND_PEN_12,'MTHEND_PEN_12' ) ;                                  
%WOE1(a,woeMTHEND_FEE_12 ,RMTHEND_FEE_12 ,'MTHEND_FEE_12 ' ) ;                               
%WOE1(a,woeratio_bal_loan12,Rratio_bal_loan12,'ratio_bal_loan12' ) ;                         
%WOE1(a,woeBAL_Dec_Nov,RBAL_Dec_Nov,'BAL_Dec_Nov' ) ;                                        
%WOE1(a,woeINTBALavg_6M,RINTBALavg_6M,'INTBALavg_6M' ) ;                                     
%WOE1(a,woeINTBAL_Dec_Nov,RINTBAL_Dec_Nov,'INTBAL_Dec_Nov' ) ;                               
%WOE1(a,woeINTBAL_Nov_Oct,RINTBAL_Nov_Oct,'INTBAL_Nov_Oct' ) ;                               
%WOE1(a,woeDLINavg_6M,RDLINavg_6M,'DLINavg_6M' ) ;                                           
%WOE1(a,woeDLIN_Dec_Nov,RDLIN_Dec_Nov,'DLIN_Dec_Nov' ) ;                                     
%WOE1(a,woeratio_bal_loan_Dec_Nov,Rratio_bal_loan_Dec_Nov,'ratio_bal_loan_Dec_Nov' ) ;       
%WOE1(a,woeratio_bal_loan_Nov_Oct,Rratio_bal_loan_Nov_Oct,'ratio_bal_loan_Nov_Oct' ) ;       
%WOE1(a,woeratio_paid_balavg_6M,Rratio_paid_balavg_6M,'ratio_paid_balavg_6M' ) ;             
%WOE1(a,woeratio_paid_balavg_12M,Rratio_paid_balavg_12M,'ratio_paid_balavg_12M' ) ;          
%WOE1(a,woeratio_paid_bal_Nov_Oct,Rratio_paid_bal_Nov_Oct,'ratio_paid_bal_Nov_Oct' ) ;       
%WOE1(a,woeDlin_24,RDlin_24,'Dlin_24' ) ;                                                    
%WOE1(a,woePAID_REPAY_13,RPAID_REPAY_13,'PAID_REPAY_13' ) ;                                  
%WOE1(a,woeCHRVA100,RCHRVA100,'CHRVA100' ) ;                                                 
%WOE1(a,woeCHRVA210,RCHRVA210,'CHRVA210' ) ;                                                 
%WOE1(a,woeCHRVA260,RCHRVA260,'CHRVA260' ) ;                                                 
%WOE1(a,woeCHRVA264,RCHRVA264,'CHRVA264' ) ;                                                 
%WOE1(a,woeCHRVA331,RCHRVA331,'CHRVA331' ) ;                                                 
%WOE1(a,woeCHRVA340,RCHRVA340,'CHRVA340' ) ;                                                 
%WOE1(a,woeCHRVA345,RCHRVA345,'CHRVA345' ) ;                                                 
%WOE1(a,woeCHRVA540Z,RCHRVA540Z,'CHRVA540Z' ) ;                                              
%WOE1(a,woeCHRVA941Y,RCHRVA941Y,'CHRVA941Y' ) ;                                              
%WOE1(a,woeCHRVA1017,RCHRVA1017,'CHRVA1017' ) ;                                              
%WOE1(a,woeCHRVA1040,RCHRVA1040,'CHRVA1040' ) ;                                              
%WOE1(a,woeBU2,RBU2,'BU2' ) ;                                                                
%WOE1(a,woeBU29,RBU29,'BU29' ) ;                                                             
%WOE1(a,woeBU56,RBU56,'BU56' ) ;                                                             

run ;

data out1.devbase_woe ;
set a ;
run ;

*================================================* ;
*========4. After execute logistic model, Scoring the data======* ;
*================================================* ;

*---------------------* ;
*--Score Model_1--* ;
*----------------------* ;

data Model_Char1 ;
set out1.appended ;
if var in ('MTHEND_PEN_12' 
'INTBALavg_6M'  
'INTBAL_Dec_Nov'
'CHRVA100'      
'CHRVA264'      
'CHRVA1040'     
'BU2'           
'BU29'          
'BU56') then output ;

data beta ;
length var $32 ;
input var $ beta ;
datalines ;
MTHEND_PEN_12   -0.3495
INTBALavg_6M    -0.2426
INTBAL_Dec_Nov  -0.3793
CHRVA100        -0.8893
CHRVA264        -0.3073
CHRVA1040       -0.3497
BU2             -0.7604
BU29            -0.2773
BU56            -0.3402
;
run ;

proc sort data=Model_Char1 ; by var ;
proc sort data=beta ; by var ;

data out1.Model_Score1 ;
merge Model_Char1(in=a) beta ;
by var ;
if a then do ;
    score=round((beta*woe*(-20/log(2)))) ;
end ;
run ;

*--------------------------------* ;
*---all_acc Score Model_1---* ;
*--------------------------------* ;

%macro mainx(in,score,ClusVar,Var) ;

data x1 ;
set &in ;
RankVar=&ClusVar ;

data x2 ;
set out1.Model_Score1 ;
&score=score ;
if var=&Var then output ;
keep  RankVar &score ;

proc sort data=x1 ; by RankVar ;
proc sort data=x2 ; by RankVar ;

data x ;
merge x1(in=a) x2(in=b) ;
by RankVar  ;
if a then output ;
run ;

%mend mainx ;
%mainx(out1.devbase_woe,score04,RMTHEND_PEN_12,'MTHEND_PEN_12' ) ;     
%mainx(x,score08,RINTBALavg_6M,'INTBALavg_6M' ) ;                      
%mainx(x,score09,RINTBAL_Dec_Nov,'INTBAL_Dec_Nov' ) ;                  
%mainx(x,score20,RCHRVA100,'CHRVA100' ) ;                              
%mainx(x,score23,RCHRVA264,'CHRVA264' ) ;                              
%mainx(x,score30,RCHRVA1040,'CHRVA1040' ) ;                            
%mainx(x,score31,RBU2,'BU2' ) ;                                        
%mainx(x,score32,RBU29,'BU29' ) ;                                      
%mainx(x,score33,RBU56,'BU56' ) ;                                      
                
run ;

data acc_score1 ;
set x ;
SC_CONS = round((600 - ((20 / log(2)) * (log(60) + (-1.7138)))));
SCORE=sum (of score04--score33)+SC_CONS ;
run ;

*---------------------------------* ;
*---Model-1:Calculate K-S---* ;
*---------------------------------* ;

data acc_score1;
set acc_score1;

if SCORE<=500 then mark=1 ;          
else if 500<SCORE<=504 then mark=2 ; 
else if 504<SCORE<=508 then mark=3 ; 
else if 508<SCORE<=512 then mark=4 ; 
else if 512<SCORE<=516 then mark=5 ; 
else if 516<SCORE<=520 then mark=6 ; 
else if 520<SCORE<=524 then mark=7 ; 
else if 524<SCORE<=528 then mark=8 ; 
else if 528<SCORE<=532 then mark=9 ; 
else if 532<SCORE<=536 then mark=10 ;
else if 536<SCORE<=540 then mark=11 ;
else if 540<SCORE<=544 then mark=12 ;
else if 544<SCORE<=548 then mark=13 ;
else if 548<SCORE<=552 then mark=14 ;
else if 552<SCORE<=556 then mark=15 ;
else if 556<SCORE<=560 then mark=16 ;
else if 560<SCORE<=564 then mark=17 ;
else if 564<SCORE<=568 then mark=18 ;
else if 568<SCORE<=572 then mark=19 ;
else if 572<SCORE<=576 then mark=20; 
else if 576<SCORE<=580 then mark=21; 
else if 580<SCORE<=584 then mark=22; 
else if 584<SCORE<=588 then mark=23; 
else if 588<SCORE<=592 then mark=24; 
else if 592<SCORE<=596 then mark=25; 
else if 596<SCORE<=600 then mark=26; 
else if 600<SCORE<=604 then mark=27; 
else if 604<SCORE<=608 then mark=28 ;
else if 608<SCORE<=612 then mark=29 ;
else if 612<SCORE<=616 then mark=30 ;
else if 616<SCORE<=620 then mark=31 ;
else if 620<SCORE<=624 then mark=32 ;
else if 624<SCORE<=628 then mark=33 ;
else if 628<SCORE<=632 then mark=34 ;
else if 632<SCORE<=650 then mark=35 ;
else if 650<SCORE<=660 then mark=36 ;
else if 660<SCORE<=670 then mark=37 ;
else if 670<SCORE<=680 then mark=38 ;
else if 680<SCORE<=690 then mark=39 ;
else if 690<SCORE then mark=40 ;
run ;

proc sort data=acc_score1;  by mark perform ;

proc means data=acc_score1 noprint ;
var  perform ;
by mark perform ;
output out=acc_score1_n(drop=_type_ _freq_) n=n ;
run ;


*====construct a complete null data file====* ;
proc sort data=acc_score1_n ; by mark ;

data AttachFile ;
set acc_score1_n ;
by mark ;
if first.mark then output ;
keep mark ;

data perform ;
input perform ;
cards ;
0
1
;
run ;

proc means data=perform noprint ;
var perform ;
output out=perform1 n=max ;

%global max ;
data _null_ ;
set perform1 ;
call symput('max',max) ;
run ;

proc datasets ; delete final ;

%macro n1 ;

%do i=1 %to &max ;

data perform2 ;
set perform ;
if _n_=&i then output ;

data spl ;
if _n_=1 then set perform2 ;
set AttachFile ;

proc append base=final data=spl ;
run ;
%end ;

%mend n1 ;
%n1 ;
run ;

proc sort data=final ; by mark perform ;
proc sort data=acc_score1_n ; by mark perform ;

data shell ;
merge acc_score1_n final(in=a) ;
by mark perform ;
if a then do ;
  if n=. then n=0 ;
end ;
run ;

proc transpose prefix=shell out=SPL_No ;      
var n ;                                                         
by mark ;                                                       
run ;                                                           

%macro a ;
proc means data=SPL_No noprint ;
var shell1 shell2 ;
output out=Count sum=NoofGood  NoofBad ;
run ;
%mend a ;
%a ;

data Count ;
set Count ;
call symput('NoofGood',NoofGood) ;
call symput('NoofBad',NoofBad) ;

data SPL_KS ;
set SPL_No ; 
retain accm_good 0 ;
accm_good+shell1 ;

retain accm_bad 0 ;
accm_bad+shell2 ;

per_good=accm_good/&NoofGood ;
per_bad=accm_bad/&NoofBad ;

KS=abs(per_good-per_bad) ;
drop _name_ ;
run ;

